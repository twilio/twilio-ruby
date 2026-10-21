# frozen_string_literal: true

require 'spec_helper'
require 'socket'

describe Twilio::HTTP::DistrustedIntermediates do
  def build_cert(subject, key, issuer: nil, issuer_key: nil, ca: false, san: nil) # rubocop:disable Naming/MethodParameterName
    cert = OpenSSL::X509::Certificate.new
    cert.version = 2
    cert.serial = rand(1..1_000_000)
    cert.subject = OpenSSL::X509::Name.parse("/CN=#{subject}")
    cert.issuer = issuer ? issuer.subject : cert.subject
    cert.public_key = key.public_key
    cert.not_before = Time.now - 60
    cert.not_after = Time.now + 3600
    ef = OpenSSL::X509::ExtensionFactory.new
    ef.subject_certificate = cert
    ef.issuer_certificate = issuer || cert
    cert.add_extension(ef.create_extension('basicConstraints', ca ? 'CA:TRUE' : 'CA:FALSE', true))
    cert.add_extension(ef.create_extension('subjectAltName', san)) if san
    cert.sign(issuer_key || key, OpenSSL::Digest.new('SHA256'))
    cert
  end

  let(:root_key) { OpenSSL::PKey::RSA.new(2048) }
  let(:intermediate_key) { OpenSSL::PKey::RSA.new(2048) }
  let(:leaf_key) { OpenSSL::PKey::RSA.new(2048) }
  let(:root) { build_cert('Test Root', root_key, ca: true) }
  let(:intermediate) do
    build_cert('Test Intermediate', intermediate_key, issuer: root, issuer_key: root_key, ca: true)
  end
  let(:leaf) do
    build_cert('127.0.0.1', leaf_key, issuer: intermediate, issuer_key: intermediate_key, san: 'IP:127.0.0.1')
  end

  def trusting_root
    OpenSSL::X509::Store.new.tap { |store| store.add_cert(root) }
  end

  describe 'the distrusted list' do
    it 'contains the eight compromised intermediates' do
      expect(described_class::DISTRUSTED_SPKI_SHA256.size).to eq(8)
      expect(described_class::DISTRUSTED_SPKI_SHA256).to all(match(/\A\h{64}\z/))
    end
  end

  describe '.spki_sha256_hex' do
    it 'hashes the SubjectPublicKeyInfo as encoded in the certificate' do
      expected = OpenSSL::Digest::SHA256.hexdigest(intermediate_key.public_key.to_der)
      expect(described_class.spki_sha256_hex(intermediate)).to eq(expected)
    end
  end

  describe 'TLS handshake' do
    def serve
      tcp = TCPServer.new('127.0.0.1', 0)
      context = OpenSSL::SSL::SSLContext.new
      context.cert = leaf
      context.key = leaf_key
      context.extra_chain_cert = [intermediate]
      server = OpenSSL::SSL::SSLServer.new(tcp, context)
      thread = Thread.new do
        loop do
          socket = server.accept
          socket.gets("\r\n\r\n")
          socket.write("HTTP/1.1 200 OK\r\nContent-Length: 2\r\nConnection: close\r\n\r\nok")
          socket.close
        rescue OpenSSL::SSL::SSLError, IOError, SystemCallError
          next
        end
      end
      yield tcp.addr[1]
    ensure
      thread&.kill
      tcp&.close
    end

    # Net::HTTP configures its SSLContext with the same cert_store Faraday hands it, so handshake directly.
    def handshake(port, callback)
      context = OpenSSL::SSL::SSLContext.new
      context.verify_mode = OpenSSL::SSL::VERIFY_PEER
      context.cert_store = trusting_root
      context.verify_callback = callback
      socket = OpenSSL::SSL::SSLSocket.new(TCPSocket.new('127.0.0.1', port), context)
      socket.hostname = '127.0.0.1'
      socket.connect
      socket.post_connection_check('127.0.0.1')
      true
    ensure
      socket&.close
    end

    it 'accepts a chain with no distrusted intermediate' do
      serve do |port|
        expect(handshake(port, described_class.verify_callback)).to be(true)
      end
    end

    it 'refuses a chain containing a distrusted intermediate' do
      serve do |port|
        distrusted = Set[described_class.spki_sha256_hex(intermediate)]
        callback = described_class.verify_callback(distrusted)
        expect { handshake(port, callback) }.to raise_error(OpenSSL::SSL::SSLError, /rejected/)
      end
    end
  end

  describe 'the default HTTP client' do
    def verify_callback_for(client)
      allow_any_instance_of(Faraday::Connection).to receive(:send)
        .and_return(double('response', status: 301, body: {}, headers: {}))
      client.request('host', 'port', 'GET', 'url', nil, nil, {}, ['a', 'b'])
      http = Net::HTTP.new('example.com', 443)
      client.connection.builder.adapter.build.instance_variable_get(:@config_block)&.call(http)
      http.verify_callback
    end

    it 'checks for distrusted intermediates with the net_http adapter' do
      client = Twilio::HTTP::Client.new
      client.adapter = :net_http
      expect(verify_callback_for(client)).to respond_to(:call)
    end

    it 'leaves other adapters alone' do
      client = Twilio::HTTP::Client.new
      client.adapter = :test
      expect(verify_callback_for(client)).to be_nil
    end
  end
end
