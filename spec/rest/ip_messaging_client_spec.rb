require 'spec_helper'

describe Twilio::REST::IpMessagingClient do
  before do
    @client = Twilio::REST::IpMessagingClient.new('AC123', 'foobar')
  end

  it 'should set up a services resources object' do
    expect(@client).to respond_to(:services)
    expect(@client.services.instance_variable_get('@path')).to eq(
      '/v1/Services'
    )
  end

  it 'should set up a credentials resources object' do
    expect(@client).to respond_to(:credentials)
    expect(@client.credentials.instance_variable_get('@path')).to eq(
      '/v1/Credentials'
    )
  end
end
