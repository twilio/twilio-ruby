require 'spec_helper'

describe Twilio::Util::Configuration do
  it 'should have an account sid attribute' do
    config = Twilio::Util::Configuration.new
    config.account_sid = 'someSid'
    expect(config.account_sid).to eq('someSid')
  end

  it 'should have an auth token attribute' do
    config = Twilio::Util::Configuration.new
    config.auth_token = 'someToken'
    expect(config.auth_token).to eq('someToken')
  end

  it 'should have an api sid attribute' do
    config = Twilio::Util::Configuration.new
    config.api_sid = 'someApiSid'
    expect(config.api_sid).to eq('someApiSid')
  end

  it 'should have an api secret attribute' do
    config = Twilio::Util::Configuration.new
    config.api_secret = 'someApiSecret'
    expect(config.api_secret).to eq('someApiSecret')
  end
end
