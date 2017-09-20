require 'spec_helper'

describe Twilio::Security::RequestValidator do
  describe 'validations' do
    let(:token) { '2bd9e9638872de601313dc77410d3b23' }

    let(:validator) { Twilio::Security::RequestValidator.new token }

    let(:voice_url) { 'http://twiliotests.heroku.com/validate/voice' }

    let(:sms_url) { 'http://twiliotests.heroku.com/validate/sms' }

    let(:voice_params) do
      {
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
    end

    let(:sms_params) do
      {
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
    end

    it 'should validate an authentic Twilio Voice request' do
      signature = 'oVb2kXoVy8GEfwBDjR8bk/ZZ6eA='
      expect(validator.validate(voice_url, voice_params, signature)).to eq(true)
    end

    it 'should validate an authentic Twilio SMS request' do
      signature = 'mxeiv65lEe0b8L6LdVw2jgJi8yw='
      expect(validator.validate(sms_url, sms_params, signature)).to eq(true)
    end

    it 'should not validate a Twilio Voice request with wrong signature' do
      signature = 'foo'
      expect(validator.validate(voice_url, voice_params, signature)).to eq(false)
    end

    it 'should not validate a Twilio SMS request with wrong signature' do
      signature = 'bar'
      expect(validator.validate(sms_url, sms_params, signature)).to eq(false)
    end
  end
end
