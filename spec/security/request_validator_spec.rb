require 'spec_helper'

describe Twilio::Security::RequestValidator do
  describe 'configuration' do
    after(:each) do
      Twilio.instance_variable_set('@configuration', nil)
    end

    it 'should set the auth token from a configuration block' do
      Twilio.configure do |config|
        config.auth_token = 'someToken'
      end

      validator = Twilio::Security::RequestValidator.new
      expect(validator.instance_variable_get('@auth_token')).to eq('someToken')
    end

    it 'should overwrite the auth token if passed to initializer' do
      Twilio.configure do |config|
        config.auth_token = 'someToken'
      end

      validator = Twilio::Security::RequestValidator.new 'otherToken'
      expect(validator.instance_variable_get('@auth_token')).to eq('otherToken')
    end

    it 'should throw an argument error if the auth token isn\'t set' do
      expect { Twilio::Security::RequestValidator.new }.to raise_error(ArgumentError)
    end
  end

  describe 'validations' do
    let(:token) { '12345' }

    let(:validator) { Twilio::Security::RequestValidator.new token }

    let(:url) { 'https://mycompany.com/myapp.php?foo=1&bar=2' }

    let(:default_signature) { 'RSOYDt4T1cUTdK1PDd93/VVr8B8=' }

    let(:body) { '{"property": "value", "boolean": true}' }

    let(:body_hash) { '0a1ff7634d9ab3b95db5c9a2dfe9416e41502b283a80c7cf19632632f96e6620' }

    let(:params) do
      {
        'From' => '+14158675309',
        'To' => '+18005551212',
        'CallSid' => 'CA1234567890ABCDE',
        'Caller' => '+14158675309',
        'Digits' => '1234'
      }
    end

    it 'should build a correct signature' do
      expect(validator.build_signature_for(url, params)).to eq(default_signature)
    end
    it 'should validate an authentic Twilio request' do
      expect(validator.validate(url, params, default_signature)).to eq(true)
    end

    it 'should not validate a request with wrong signature' do
      expect(validator.validate(url, params, 'fake_signature')).to eq(false)
    end

    it 'should hash body correctly' do
      expect(validator.build_hash_for(body)).to eq(body_hash)
    end

    it 'should validate requests with body correctly' do
      url_with_hash = "#{url}&bodySHA256=#{body_hash}"
      expect(validator.validate(url_with_hash, body, 'a9nBmqA0ju/hNViExpshrM61xv4=')).to eq(true)
    end

    it 'should validate with no other GET parameters' do
      url_with_hash = "https://mycompany.com/myapp.php?bodySHA256=#{body_hash}"
      expect(validator.validate(url_with_hash, body, 'y77kIzt2vzLz71DgmJGsen2scGs=')).to eq(true)
    end

    it 'should fail validation with body but no signature' do
      expect(validator.validate(url, body, default_signature)).to eq(false)
    end
  end
end
