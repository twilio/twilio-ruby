describe Twilio do
  after(:each) do
    Twilio.instance_variable_set('@configuration', nil)
  end

  it 'should set the configuration with a config block' do
    Twilio.configure do |config|
      config.account_sid = 'someSid'
      config.auth_token = 'someToken'
      config.http_client = 'someClient'
    end

    expect(Twilio.account_sid).to eq('someSid')
    expect(Twilio.auth_token).to eq('someToken')
    expect(Twilio.http_client).to eq('someClient')
  end
end
