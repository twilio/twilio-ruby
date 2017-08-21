require 'spec_helper'
require 'rack/mock'

describe Twilio::HTTP::Client do
  before do
    @client = Twilio::HTTP::Client.new
  end

  it 'should contain a last response' do
    expect(Faraday).to receive(:new).and_return(Faraday::Connection.new)
    allow_any_instance_of(Faraday::Connection).to receive(:send).and_return(
        double("response", status: 301, body: {})
    )

    @client.request('host', 'post', 'GET', 'url', nil, nil, {}, ['a', 'b'])

    expect(@client.last_response).to_not be_nil
    expect(@client.last_response.status).to eq(301)
  end
end