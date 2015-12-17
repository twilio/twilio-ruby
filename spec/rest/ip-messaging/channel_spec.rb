require 'spec_helper'

describe Twilio::REST::IpMessaging::Channels do
  it 'sets up a members resources object' do
    client = Twilio::REST::IpMessagingClient.new 'otherSid', 'otherToken'
    service = Twilio::REST::IpMessaging::Channel.new '/v1/Services/1/Channels/1', client
    expect(service).to respond_to(:members)
    expect(service.members.instance_variable_get('@path')).to eq(
      '/v1/Services/1/Channels/1/Members'
    )
  end

  it 'sets up a messages resources object' do
    client = Twilio::REST::IpMessagingClient.new 'otherSid', 'otherToken'
    service = Twilio::REST::IpMessaging::Channel.new '/v1/Services/1/Channels/1', client
    expect(service).to respond_to(:messages)
    expect(service.messages.instance_variable_get('@path')).to eq(
      '/v1/Services/1/Channels/1/Messages'
    )
  end
end
