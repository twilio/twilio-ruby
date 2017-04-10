require 'spec_helper'

describe Twilio::REST::IpMessaging::Services do
  it 'sets up a channels resources object' do
    client = Twilio::REST::IpMessagingClient.new 'otherSid', 'otherToken'

    user = Twilio::REST::IpMessaging::User.new '/v1/Services/1/Users/1', client
    expect(user).to respond_to(:channels)
    expect(user.channels.instance_variable_get('@path')).to eq(
      '/v1/Services/1/Users/1/Channels'
    )
  end
end
