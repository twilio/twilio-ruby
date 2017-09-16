describe Twilio do
  after(:each) do
    Twilio.instance_variable_set('@configuration', nil)
  end

  it 'should set the account sid and auth token with a config block' do
    Twilio.configure do |config|
      config.account_sid = 'someSid'
      config.auth_token = 'someToken'
    end

    expect(Twilio.account_sid).to eq('someSid')
    expect(Twilio.auth_token).to eq('someToken')
  end

  it 'should set the account sid and api credentials with a config block' do
    Twilio.configure do |config|
      config.account_sid = 'someSid'
      config.api_sid = 'someApiSid'
      config.api_secret = 'someApiSecret'
    end

    expect(Twilio.account_sid).to eq('someSid')
    expect(Twilio.auth_token).to be_nil
    expect(Twilio.api_sid).to eq('someApiSid')
    expect(Twilio.api_secret).to eq('someApiSecret')
  end
end
