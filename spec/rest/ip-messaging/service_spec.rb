require 'spec_helper'

describe Twilio::REST::IpMessaging::Services do
  it 'sets up a channels resources object' do
    client = Twilio::REST::IpMessagingClient.new 'otherSid', 'otherToken'
    service = Twilio::REST::IpMessaging::Service.new '/v1/Services', client
    expect(service).to respond_to(:channels)
    expect(service.channels.instance_variable_get('@path')).to eq(
      '/v1/Services/Channels'
    )
  end

  it 'sets up a roles resources object' do
    client = Twilio::REST::IpMessagingClient.new 'otherSid', 'otherToken'
    service = Twilio::REST::IpMessaging::Service.new '/v1/Services', client
    expect(service).to respond_to(:roles)
    expect(service.roles.instance_variable_get('@path')).to eq(
      '/v1/Services/Roles'
    )
  end

  it 'sets up a users resources object' do
    client = Twilio::REST::IpMessagingClient.new 'otherSid', 'otherToken'
    service = Twilio::REST::IpMessaging::Service.new '/v1/Services', client
    expect(service).to respond_to(:users)
    expect(service.users.instance_variable_get('@path')).to eq(
      '/v1/Services/Users'
    )
  end
end
