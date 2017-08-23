require 'spec_helper'
require 'rack/mock'

describe Twilio::HTTP::Client do
  before do
    @client = Twilio::HTTP::Client.new
  end

  it 'should contain a last response' do
    expect(Faraday).to receive(:new).and_return(Faraday::Connection.new)
    allow_any_instance_of(Faraday::Connection).to receive(:send).and_return(double('response', status: 301, body: {}))

    @client.request('host', 'port', 'GET', 'url', nil, nil, {}, ['a', 'b'])

    expect(@client.last_response).to_not be_nil
    expect(@client.last_response.is_a?(Twilio::Response)).to be(true)
    expect(@client.last_response.status_code).to eq(301)
  end

  it 'should contain a last request' do
    expect(Faraday).to receive(:new).and_return(Faraday::Connection.new)
    allow_any_instance_of(Faraday::Connection).to receive(:send).and_return(double('response', status: 301, body: {}))

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
end
