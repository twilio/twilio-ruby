require 'spec_helper'

describe Twilio::Util::RequestValidator do
  describe 'configuration' do
    after(:each) do
      Twilio.instance_variable_set('@configuration', nil)
    end

    it 'should set the auth token from a configuration block' do
      Twilio.configure do |config|
        config.auth_token = 'someToken'
      end

      validator = Twilio::Util::RequestValidator.new
      expect(validator.instance_variable_get('@auth_token')).to eq('someToken')
    end

    it 'should overwrite the auth token if passed to initializer' do
      Twilio.configure do |config|
        config.auth_token = 'someToken'
      end

      validator = Twilio::Util::RequestValidator.new 'otherToken'
      expect(validator.instance_variable_get('@auth_token')).to eq('otherToken')
    end

    it 'should throw an argument error if the auth token isn\'t set' do
      expect { Twilio::Util::RequestValidator.new }.to raise_error(ArgumentError)
    end
  end

  it 'should properly validate a Twilio Voice request' do
    token = '2bd9e9638872de601313dc77410d3b23'
    validator = Twilio::Util::RequestValidator.new token
    url = 'http://twiliotests.heroku.com/validate/voice'
    params = {
      'ToState' => 'California',
      'CalledState' => 'California',
      'Direction' => 'inbound',
      'FromState' => 'CA',
      'AccountSid' => 'ACba8bc05eacf94afdae398e642c9cc32d',
      'Caller' => '+14153595711',
      'CallerZip' => '94108',
      'CallerCountry' => 'US',
      'From' => '+14153595711',
      'FromCity' => 'SAN FRANCISCO',
      'CallerCity' => 'SAN FRANCISCO',
      'To' => '+14157669926',
      'FromZip' => '94108',
      'FromCountry' => 'US',
      'ToCity' => '',
      'CallStatus' => 'ringing',
      'CalledCity' => '',
      'CallerState' => 'CA',
      'CalledZip' => '',
      'ToZip' => '',
      'ToCountry' => 'US',
      'CallSid' => 'CA136d09cd59a3c0ec8dbff44da5c03f31',
      'CalledCountry' => 'US',
      'Called' => '+14157669926',
      'ApiVersion' => '2010-04-01',
      'ApplicationSid' => 'AP44efecad51364e80b133bb7c07eb8204'
    }
    signature = 'oVb2kXoVy8GEfwBDjR8bk/ZZ6eA='
    expect(validator.validate(url, params, signature)).to eq(true)
  end

  it 'should properly validate a Twilio SMS request' do
    token = '2bd9e9638872de601313dc77410d3b23'
    validator = Twilio::Util::RequestValidator.new token
    url = 'http://twiliotests.heroku.com/validate/sms'
    params = {
      'ToState' => 'CA',
      'FromState' => 'CA',
      'AccountSid' => 'ACba8bc05eacf94afdae398e642c9cc32d',
      'SmsMessageSid' => 'SM2003cbd5e6a3701999aa3e5f20ff2787',
      'Body' => 'Orly',
      'From' => '+14159354345',
      'FromCity' => 'SAN FRANCISCO',
      'SmsStatus' => 'received',
      'FromZip' => '94107',
      'FromCountry' => 'US',
      'To' => '+14158141819',
      'ToCity' => 'SAN FRANCISCO',
      'ToZip' => '94105',
      'ToCountry' => 'US',
      'ApiVersion' => '2010-04-01',
      'SmsSid' => 'SM2003cbd5e6a3701999aa3e5f20ff2787'
    }
    signature = 'mxeiv65lEe0b8L6LdVw2jgJi8yw='
    expect(validator.validate(url, params, signature)).to eq(true)
  end
end
