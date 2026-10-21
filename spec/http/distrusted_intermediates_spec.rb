require 'spec_helper'
require 'socket'

# A minimal HTTPS server on 127.0.0.1 that sends the leaf and intermediate, and counts requests it receives.
class DistrustTestServer
  attr_reader :port, :request_count

  def initialize(leaf, leaf_key, intermediate)
    context = OpenSSL::SSL::SSLContext.new
    context.cert = leaf
    context.key = leaf_key
    context.extra_chain_cert = [intermediate]
    @tcp = TCPServer.new('127.0.0.1', 0)
    @port = @tcp.addr[1]
    @request_count = 0
    server = OpenSSL::SSL::SSLServer.new(@tcp, context)
    @thread = Thread.new { serve(server) }
  end

  def stop
    @thread.kill
    @tcp.close
  end

  private

  def serve(server)
    loop do
      begin
        socket = server.accept
      rescue OpenSSL::SSL::SSLError, SystemCallError
        next # The client refused the handshake.
      end
      begin
        next unless socket.gets # The client closed the connection without sending a request.

        nil until socket.gets.to_s.chomp.empty?
        @request_count += 1
        socket.write("HTTP/1.1 200 OK\r\nContent-Length: 2\r\nConnection: close\r\n\r\n{}")
      ensure
        socket.close
      end
    end
  end
end

# A root, an intermediate, and leaves for 127.0.0.1 and example.com.
module DistrustTestCerts
  def self.issue(subject, key, issuer, issuer_key, serial, authority:, san: nil)
    cert = OpenSSL::X509::Certificate.new
    cert.version = 2
    cert.serial = serial
    cert.subject = OpenSSL::X509::Name.parse(subject)
    cert.issuer = issuer ? issuer.subject : cert.subject
    cert.public_key = key.is_a?(OpenSSL::PKey::EC) ? OpenSSL::PKey::EC.new(key.public_to_der) : key.public_key
    cert.not_before = Time.now - 3600
    cert.not_after = Time.now + 86_400
    extensions = OpenSSL::X509::ExtensionFactory.new
    extensions.subject_certificate = cert
    extensions.issuer_certificate = issuer || cert
    cert.add_extension(extensions.create_extension('subjectKeyIdentifier', 'hash'))
    cert.add_extension(extensions.create_extension('authorityKeyIdentifier', 'keyid:always'))
    if authority
      cert.add_extension(extensions.create_extension('basicConstraints', 'CA:TRUE', true))
      cert.add_extension(extensions.create_extension('keyUsage', 'keyCertSign,cRLSign', true))
    else
      cert.add_extension(extensions.create_extension('subjectAltName', san))
      cert.add_extension(extensions.create_extension('extendedKeyUsage', 'serverAuth'))
    end
    cert.sign(issuer_key || key, OpenSSL::Digest.new('SHA256'))
    cert
  end

  ROOT_KEY = OpenSSL::PKey::RSA.new(2048)
  ROOT = issue('/CN=Distrust Test Root', ROOT_KEY, nil, nil, 1, authority: true)
  INTERMEDIATE_KEY = OpenSSL::PKey::EC.generate('prime256v1')
  INTERMEDIATE = issue('/CN=Distrust Test Intermediate', INTERMEDIATE_KEY, ROOT, ROOT_KEY, 2, authority: true)
  LEAF_KEY = OpenSSL::PKey::EC.generate('prime256v1')
  LEAF = issue('/CN=127.0.0.1', LEAF_KEY, INTERMEDIATE, INTERMEDIATE_KEY, 3, authority: false, san: 'IP:127.0.0.1')
  OTHER_HOST_LEAF = issue('/CN=example.com', LEAF_KEY, INTERMEDIATE, INTERMEDIATE_KEY, 4, authority: false, san: 'DNS:example.com')
end

describe Twilio::HTTP::DistrustedIntermediates do
  def hash(cert)
    described_class.send(:spki_sha256, cert)
  end

  def distrust(*certs)
    callback = described_class.send(:verify_callback, certs.map { |cert| hash(cert) })
    allow(described_class).to receive(:apply) { |http| http.verify_callback = callback }
  end

  # Requests / through Twilio::HTTP::Client, with the test root trusted unless trust_root is false.
  def get(server, trust_root: true)
    http_client = Twilio::HTTP::Client.new
    if trust_root
      store = OpenSSL::X509::Store.new
      store.add_cert(DistrustTestCerts::ROOT)
      http_client.configure_connection { |f| f.ssl.cert_store = store }
    end
    http_client.request('https://127.0.0.1', server.port, 'GET', "https://127.0.0.1:#{server.port}/", nil, nil, {},
                        ['a', 'b'])
  end

  # These specs make real connections to a local server. FakeWeb blocks them, and its Net::BufferedIO patch predates
  # the keyword arguments newer Ruby passes, so restore the original while they run.
  before do
    FakeWeb.allow_net_connect = true
    Net::BufferedIO.send(:alias_method, :initialize, :initialize_without_fakeweb)
    @server = DistrustTestServer.new(DistrustTestCerts::LEAF, DistrustTestCerts::LEAF_KEY,
                                     DistrustTestCerts::INTERMEDIATE)
  end

  after do
    @server.stop
    Net::BufferedIO.send(:alias_method, :initialize, :initialize_with_fakeweb)
    FakeWeb.allow_net_connect = false
  end

  it 'connects when the chain is clean' do
    expect(get(@server).status_code).to eq(200)
    expect(@server.request_count).to eq(1)
  end

  it 'refuses a chain with a distrusted intermediate' do
    distrust(DistrustTestCerts::INTERMEDIATE)

    expect { get(@server) }.to raise_error(Twilio::REST::TwilioError, /certificate rejected/)
    expect(@server.request_count).to eq(0)
  end

  it 'refuses a chain with a distrusted root' do
    distrust(DistrustTestCerts::ROOT)

    expect { get(@server) }.to raise_error(Twilio::REST::TwilioError, /certificate rejected/)
    expect(@server.request_count).to eq(0)
  end

  # The verify callback must not replace OpenSSL's hostname verification: a trusted, non-distrusted chain issued for
  # another host must still be refused.
  it 'rejects a hostname mismatch' do
    other_host = DistrustTestServer.new(DistrustTestCerts::OTHER_HOST_LEAF, DistrustTestCerts::LEAF_KEY,
                                        DistrustTestCerts::INTERMEDIATE)
    begin
      expect { get(other_host) }.to raise_error(Twilio::REST::TwilioError) { |error|
        expect(error.message).to match(/hostname/)
        expect(error.message).not_to match(/certificate rejected/)
      }
      expect(other_host.request_count).to eq(0)
    ensure
      other_host.stop
    end
  end

  it 'keeps the default trust store' do
    # The test root isn't in the system trust store, so the default validation must still refuse it.
    expect { get(@server, trust_root: false) }.to raise_error(Twilio::REST::TwilioError, /certificate verify failed/)
    expect(@server.request_count).to eq(0)
  end

  it 'leaves other adapters unchanged' do
    connection = Faraday::Connection.new
    http_client = Twilio::HTTP::Client.new
    http_client.adapter = :test
    expect(Faraday).to receive(:new).and_yield(connection).and_return(connection)
    allow(connection).to receive(:send).and_return(double('response', status: 200, body: {}, headers: {}))

    http_client.request('host', 'port', 'GET', 'url', nil, nil, {}, ['a', 'b'])

    expect(connection.builder.adapter.klass).to eq(Faraday::Adapter::Test)
  end

  it 'hashes the SubjectPublicKeyInfo as it appears in the certificate' do
    [DistrustTestCerts::ROOT, DistrustTestCerts::INTERMEDIATE, DistrustTestCerts::LEAF].each do |cert|
      expect(hash(cert)).to eq(OpenSSL::Digest::SHA256.hexdigest(cert.public_key.public_to_der))
    end
  end

  it 'distrusts the eight intermediates' do
    list = described_class.send(:const_get, :SPKI_SHA256)
    expect(list.size).to eq(8)
    expect(list).to all(match(/\A[0-9a-f]{64}\z/))
  end
end
