require 'spec_helper'
require 'rack/mock'

describe Twilio::HTTP::Client do
  before do
    @client = Twilio::HTTP::Client.new
  end

  it 'should allow adding a request configuration block' do
    @client = Twilio::HTTP::Client.new
    @connection = Faraday::Connection.new

    blocks_spy = spy('blocks')

    @client.configure_connection do |f|
      blocks_spy.first_block_called(f)
    end

    @client.configure_connection do |f|
      blocks_spy.second_block_called(f)
    end

    expect(Faraday).to receive(:new).and_yield(@connection).and_return(@connection)
    allow_any_instance_of(Faraday::Connection).to receive(:send).and_return(double('response', status: 301, body: {}, headers: {}))

    @client.request('host', 'port', 'GET', 'url', nil, nil, {}, ['a', 'b'])

    expect(blocks_spy).to have_received(:first_block_called).with(@connection)
    expect(blocks_spy).to have_received(:second_block_called).with(@connection)
  end

  it 'should allow setting a global timeout' do
    @client = Twilio::HTTP::Client.new(timeout: 10)
    @connection = Faraday::Connection.new

    expect(Faraday).to receive(:new).and_yield(@connection).and_return(@connection)
    allow_any_instance_of(Faraday::Connection).to receive(:send).and_return(double('response', status: 301, body: {}, headers: {}))

    @client.request('host', 'port', 'GET', 'url', nil, nil, {}, ['a', 'b'])

    expect(@client.timeout).to eq(10)
    expect(@connection.options.open_timeout).to eq(10)
    expect(@connection.options.timeout).to eq(10)
  end

  it 'should allow overriding timeout per request' do
    @client = Twilio::HTTP::Client.new(timeout: 10)
    @connection = Faraday::Connection.new

    expect(Faraday).to receive(:new).and_yield(@connection).and_return(@connection)
    allow_any_instance_of(Faraday::Connection).to receive(:send).and_return(double('response', status: 301, body: {}, headers: {}))

    @client.request('host', 'port', 'GET', 'url', nil, nil, {}, ['a', 'b'], 20)

    expect(@client.timeout).to eq(10)
    expect(@connection.options.open_timeout).to eq(20)
    expect(@connection.options.timeout).to eq(20)
  end

  it 'should contain a last response' do
    expect(Faraday).to receive(:new).and_return(Faraday::Connection.new)
    allow_any_instance_of(Faraday::Connection).to receive(:send).and_return(double('response', status: 301, body: {}, headers: { something: '1' }))

    @client.request('host', 'port', 'GET', 'url', nil, nil, {}, ['a', 'b'])

    expect(@client.last_response).to_not be_nil
    expect(@client.last_response.is_a?(Twilio::Response)).to be(true)
    expect(@client.last_response.status_code).to eq(301)
    expect(@client.last_response.headers).to eq(something: '1')
  end

  it 'should contain a last request' do
    expect(Faraday).to receive(:new).and_return(Faraday::Connection.new)
    allow_any_instance_of(Faraday::Connection).to receive(:send).and_return(double('response', status: 301, body: {}, headers: {}))

    @client.request('host',
                    'port',
                    'GET',
                    'url',
                    { 'param-key' => 'param-value' },
                    { 'data-key' => 'data-value' },
                    { 'header-key' => 'header-value' },
                    ['a', 'b'],
                    'timeout')

    expect(@client.last_request).to_not be_nil
    expect(@client.last_request.is_a?(Twilio::Request)).to be(true)
    expect(@client.last_request.host).to eq('host')
    expect(@client.last_request.port).to eq('port')
    expect(@client.last_request.method).to eq('GET')
    expect(@client.last_request.url).to eq('url')
    expect(@client.last_request.params).to eq('param-key' => 'param-value')
    expect(@client.last_request.data).to eq('data-key' => 'data-value')
    expect(@client.last_request.headers).to eq('header-key' => 'header-value')
    expect(@client.last_request.auth).to eq(['a', 'b'])
    expect(@client.last_request.timeout).to eq('timeout')
  end

  it 'should contain a last response for 5XX status classes' do
    expect(Faraday).to receive(:new).and_return(Faraday::Connection.new)
    allow_any_instance_of(Faraday::Connection).to receive(:send).and_return(double('response', status: 500, body: {}, headers: {}))

    @client.request('host', 'port', 'GET', 'url', nil, nil, {}, ['a', 'b'])
    expect(@client.last_response).to_not be_nil
    expect(@client.last_request.host).to eq('host')
    expect(@client.last_request.port).to eq('port')
    expect(@client.last_request.method).to eq('GET')
    expect(@client.last_request.url).to eq('url')
    expect(@client.last_request.params).to be_nil
    expect(@client.last_request.data).to be_nil
    expect(@client.last_request.headers).to eq({})
    expect(@client.last_request.auth).to eq(['a', 'b'])
    expect(@client.last_request.timeout).to be_nil
    expect(@client.last_response.is_a?(Twilio::Response)).to be(true)
    expect(@client.last_response.status_code).to eq(500)
  end

  it 'should contain a last_response but no response on a connection error' do
    expect(Faraday).to receive(:new).and_return(Faraday::Connection.new)
    allow_any_instance_of(Faraday::Connection).to receive(:send).and_raise(Faraday::ConnectionFailed.new('BOOM'))

    expect { @client.request('host', 'port', 'GET', 'url', nil, nil, {}, ['a', 'b']) }.to raise_exception(Twilio::REST::TwilioError)
    expect(@client.last_response).to be_nil
    expect(@client.last_request).to_not be_nil
    expect(@client.last_request.host).to eq('host')
    expect(@client.last_request.port).to eq('port')
    expect(@client.last_request.method).to eq('GET')
    expect(@client.last_request.url).to eq('url')
    expect(@client.last_request.params).to be_nil
    expect(@client.last_request.data).to be_nil
    expect(@client.last_request.headers).to eq({})
    expect(@client.last_request.auth).to eq(['a', 'b'])
    expect(@client.last_request.timeout).to be_nil
  end

  describe 'last_response' do
    let(:last_response) { Twilio::Response.new(200, 'body') }
  end
  it 'previous last_response should be cleared' do
    expect(Faraday).to receive(:new).and_return(Faraday::Connection.new)
    allow_any_instance_of(Faraday::Connection).to receive(:send).and_raise(Faraday::ConnectionFailed.new('BOOM'))
    expect { @client.request('host', 'port', 'GET', 'url', nil, nil, {}, ['a', 'b']) }.to raise_exception(Twilio::REST::TwilioError)
    expect(@client.last_response).to be_nil
  end

  context 'when the response returns a timeout' do
    let(:twilio_response) { @client.request('host', 'port', 'GET', 'url') }

    before do
      faraday_connection = Faraday::Connection.new

      allow(Faraday).to receive(:new).and_return(faraday_connection)
      allow(faraday_connection).to receive(:send).and_return(double('response', status: 504, body: { message: 'any message' }, headers: {}))
    end

    it 'adds a Request timeout message to the response and avoids non-JSON response to raise Json::ParserError' do
      expect(twilio_response.body).to eq({ 'message' => 'Request timeout', 'code' => 504 })
      expect(twilio_response.status_code).to eq 504
    end
  end
end
