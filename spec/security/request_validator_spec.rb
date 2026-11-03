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

    it 'should fail validation with body but no query parameters' do
      url_without_params = url.split('?').first
      expect(validator.validate(url_without_params, body, default_signature)).to eq(false)
    end

    it 'should validate https urls with ports by stripping them' do
      url_with_port = url.sub('.com', '.com:1234')
      expect(validator.validate(url_with_port, params, default_signature)).to eq(true)
    end

    it 'should validate http urls with ports' do
      http_url_with_port = url.sub('.com', '.com:1234')
      http_url_with_port = http_url_with_port.sub('https', 'http')
      signature = 'Zmvh+3yNM1Phv2jhDCwEM3q5ebU=' # hash of http url with port 1234
      expect(validator.validate(http_url_with_port, params, signature)).to eq(true)
    end

    it 'should validate https urls without ports by adding standard port 443' do
      signature = 'kvajT1Ptam85bY51eRf/AJRuM3w=' # hash of https url with port 443
      expect(validator.validate(url, params, signature)).to eq(true)
    end

    it 'should validate http urls without ports by adding standard port 80' do
      http_url = url.sub('https', 'http')
      signature = '0ZXoZLH/DfblKGATFgpif+LLRf4=' # hash of http url with port 80
      expect(validator.validate(http_url, params, signature)).to eq(true)
    end

    it 'should validate urls with credentials' do
      url_with_creds = 'https://user:pass@mycompany.com/myapp.php?foo=1&bar=2'
      signature = 'ZQFR1PTIZXF2MXB8ZnKCvnnA+rI=' # expected hash of the url
      expect(validator.validate(url_with_creds, params, signature)).to eq(true)
    end

    it 'should validate urls with just username' do
      url_with_creds = 'https://user@mycompany.com/myapp.php?foo=1&bar=2'
      signature = 'aZfj4hyX1MLZhSS6QIL18Vn2/RA=' # expected hash of the url
      expect(validator.validate(url_with_creds, params, signature)).to eq(true)
    end

    it 'should validate urls with credentials by adding port' do
      url_with_creds = 'https://user:pass@mycompany.com/myapp.php?foo=1&bar=2'
      signature = 'ZQFR1PTIZXF2MXB8ZnKCvnnA+rI=' # expected hash of the url with port 443
      expect(validator.validate(url_with_creds, params, signature)).to eq(true)
    end

    describe 'HMAC-SHA256' do
      let(:sha256_signature) do
        data = url + params.sort.join
        Base64.strict_encode64(OpenSSL::HMAC.digest(OpenSSL::Digest.new('sha256'), token, data))
      end

      it 'should compute a signature matching an independently computed HMAC-SHA256' do
        expect(validator.build_signature_for(url, params, 'HMAC_SHA256')).to eq(sha256_signature)
      end

      it 'should validate an HMAC-SHA256 signature when the algorithm is passed' do
        expect(validator.validate(url, params, sha256_signature, 'HMAC_SHA256')).to eq(true)
        expect(validator.validate(url, params, sha256_signature, 'hmac_sha256')).to eq(true)
      end

      it 'should not treat SHA1 and SHA256 signatures as interchangeable' do
        expect(validator.validate(url, params, sha256_signature)).to eq(false)
        expect(validator.validate(url, params, default_signature, 'HMAC_SHA256')).to eq(false)
      end

      it 'should default to HMAC-SHA1 when the algorithm is nil or empty' do
        expect(validator.validate(url, params, default_signature, nil)).to eq(true)
        expect(validator.validate(url, params, default_signature, '')).to eq(true)
        expect(validator.validate(url, params, default_signature, 'HMAC_SHA1')).to eq(true)
      end

      it 'should return false and warn for an unsupported algorithm' do
        result = nil
        expect { result = validator.validate(url, params, default_signature, 'HMAC_SHA512') }
          .to output(/HMAC_SHA512/).to_stderr
        expect(result).to eq(false)
      end

      it 'should raise from build_signature_for for an unsupported algorithm' do
        expect { validator.build_signature_for(url, params, 'MD5') }.to raise_error(ArgumentError)
      end

      it 'should validate a JSON body signed with HMAC-SHA256' do
        body_url = "#{url}&bodySHA256=#{body_hash}"
        signature = validator.build_signature_for(body_url, {}, 'HMAC_SHA256')

        expect(validator.validate(body_url, body, signature, 'HMAC_SHA256')).to eq(true)
        expect(validator.validate(body_url, '{}', signature, 'HMAC_SHA256')).to eq(false)
        expect(validator.validate(body_url, body, signature)).to eq(false)
      end
    end

    describe '.signature_algorithm' do
      let(:klass) { Twilio::Security::RequestValidator }

      it 'should read the algorithm from the settings header' do
        expect(klass.signature_algorithm('key=webhooks_sharedkey_1,algorithm=HMAC_SHA256')).to eq('HMAC_SHA256')
        expect(klass.signature_algorithm('algorithm=HMAC_SHA1,key=k')).to eq('HMAC_SHA1')
        expect(klass.signature_algorithm(' key=k , algorithm = HMAC_SHA256 ')).to eq('HMAC_SHA256')
      end

      it 'should default to HMAC_SHA1 when the header is missing, empty or has no algorithm' do
        [nil, '', 'key=k', 'key=k,algorithm='].each do |header|
          expect(klass.signature_algorithm(header)).to eq('HMAC_SHA1')
        end
      end

      it 'should expose the header names' do
        expect(klass::SIGNATURE_HEADER).to eq('X-Twilio-Signature')
        expect(klass::SIGNATURE_SETTINGS_HEADER).to eq('X-Twilio-Webhooks-Signature-Settings')
      end
    end
  end
end
