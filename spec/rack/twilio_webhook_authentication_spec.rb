require 'spec_helper'
require 'rack/mock'

describe Rack::TwilioWebhookAuthentication do
  before do
    @app = ->(_env) { [200, { 'Content-Type' => 'text/plain' }, ['Hello']] }
  end

  describe 'new' do
    it 'should initialize with an app, auth token and a path' do
      expect do
        Rack::TwilioWebhookAuthentication.new(@app, 'ABC', /\/voice/)
      end.not_to raise_error
    end

    it 'should initialize with an app, auth token and paths' do
      expect do
        Rack::TwilioWebhookAuthentication.new(@app, 'ABC', /\/voice/, /\/sms/)
      end.not_to raise_error
    end

    it 'should initialize with an app, dynamic token and paths' do
      expect do
        Rack::TwilioWebhookAuthentication.new(@app, nil, /\/voice/, /\/sms/)
      end.not_to raise_error
    end
  end

  describe 'calling against one path with dynamic auth token' do
    it 'should allow a request through if it validates' do
      auth_token = 'qwerty'
      account_sid = 12_345
      expect_any_instance_of(Rack::Request).to receive(:post?).and_return(true)
      expect_any_instance_of(Rack::Request).to receive(:media_type).and_return(Rack::MediaType.type('application/x-www-form-urlencoded'))
      expect_any_instance_of(Rack::Request).to receive(:POST).and_return({ 'AccountSid' => account_sid })
      @middleware = Rack::TwilioWebhookAuthentication.new(@app, nil, /\/voice/) { |asid| auth_token }
      request_validator = double('RequestValidator')
      expect(Twilio::Security::RequestValidator).to receive(:new).with(auth_token).and_return(request_validator)
      expect(request_validator).to receive(:validate).and_return(true)
      request = Rack::MockRequest.env_for('/voice')
      status, headers, body = @middleware.call(request)
      expect(status).to be(200)
    end
  end

  describe 'calling against one path' do
    before do
      @middleware = Rack::TwilioWebhookAuthentication.new(@app, 'ABC', /\/voice/)
    end

    it 'should not intercept when the path doesn\'t match' do
      expect(Twilio::Security::RequestValidator).to_not receive(:validate)
      request = Rack::MockRequest.env_for('/sms')
      status, headers, body = @middleware.call(request)
      expect(status).to be(200)
    end

    it 'should allow a request through if it validates' do
      expect_any_instance_of(Twilio::Security::RequestValidator).to(
        receive(:validate).and_return(true)
      )
      request = Rack::MockRequest.env_for('/voice')
      status, headers, body = @middleware.call(request)
      expect(status).to be(200)
    end

    it 'should short circuit a request to 403 if it does not validate' do
      expect_any_instance_of(Twilio::Security::RequestValidator).to(
        receive(:validate).and_return(false)
      )
      request = Rack::MockRequest.env_for('/voice')
      status, headers, body = @middleware.call(request)
      expect(status).to be(403)
    end
  end

  describe 'calling against many paths' do
    before do
      @middleware = Rack::TwilioWebhookAuthentication.new(@app, 'ABC', /\/voice/, /\/sms/)
    end

    it 'should not intercept when the path doesn\'t match' do
      expect(Twilio::Security::RequestValidator).to_not receive(:validate)
      request = Rack::MockRequest.env_for('icesms')
      status, headers, body = @middleware.call(request)
      expect(status).to be(200)
    end

    it 'shold allow a request through if it validates' do
      expect_any_instance_of(Twilio::Security::RequestValidator).to(
        receive(:validate).and_return(true)
      )
      request = Rack::MockRequest.env_for('/sms')
      status, headers, body = @middleware.call(request)
      expect(status).to be(200)
    end

    it 'should short circuit a request to 403 if it does not validate' do
      expect_any_instance_of(Twilio::Security::RequestValidator).to(
        receive(:validate).and_return(false)
      )
      request = Rack::MockRequest.env_for('/sms')
      status, headers, body = @middleware.call(request)
      expect(status).to be(403)
    end
  end

  describe 'validating non-form-data POST payloads' do
    it 'should fail if the body does not validate' do
      middleware = Rack::TwilioWebhookAuthentication.new(@app, 'qwerty', /\/test/)
      input = StringIO.new('{"message": "a post body that does not match the bodySHA256"}')

      request = Rack::MockRequest.env_for(
        'https://example.com/test?bodySHA256=79bfb0acaf0045fd30f13d48d4fe296b393d85a3bfbee881a0172b2bd574b11e',
        method: 'POST',
        input: input
      )
      request['HTTP_X_TWILIO_SIGNATURE'] = '+LYlbGr/VmN84YPJQCuWs+9UA7E='
      request['CONTENT_TYPE'] = 'application/json'

      status, headers, body = middleware.call(request)

      expect(status).not_to be(200)
    end

    it 'should validate if the body signature is correct' do
      middleware = Rack::TwilioWebhookAuthentication.new(@app, 'qwerty', /\/test/)
      input = StringIO.new('{"message": "a post body"}')

      request = Rack::MockRequest.env_for(
        'https://example.com/test?bodySHA256=8d90d640c6ba47d595ac56203d7f5c6b511be80fdf44a2055acca75a119b9fd2',
        method: 'POST',
        input: input
      )
      request['HTTP_X_TWILIO_SIGNATURE'] = 'zR5Oq4f6cijN5oz5bisiVuxYnTU='
      request['CONTENT_TYPE'] = 'application/json'

      status, headers, body = middleware.call(request)

      expect(status).to be(200)
    end

    it 'should validate even if a previous middleware read the body first' do
      middleware = Rack::TwilioWebhookAuthentication.new(@app, 'qwerty', /\/test/)
      input = StringIO.new('{"message": "a post body"}')

      request = Rack::MockRequest.env_for(
        'https://example.com/test?bodySHA256=8d90d640c6ba47d595ac56203d7f5c6b511be80fdf44a2055acca75a119b9fd2',
        method: 'POST',
        input: input
      )
      request['HTTP_X_TWILIO_SIGNATURE'] = 'zR5Oq4f6cijN5oz5bisiVuxYnTU='
      request['CONTENT_TYPE'] = 'application/json'
      request['rack.input'].read

      status, headers, body = middleware.call(request)

      expect(status).to be(200)
    end
  end

  describe 'validating application/x-www-form-urlencoded POST payloads' do
    it 'should fail if the body does not validate' do
      middleware = Rack::TwilioWebhookAuthentication.new(@app, 'qwerty', /\/test/)

      request = Rack::MockRequest.env_for(
        'https://example.com/test',
        method: 'POST',
        params: {'foo' => 'bar'}
      )
      request['HTTP_X_TWILIO_SIGNATURE'] = 'foobarbaz'
      expect(request['CONTENT_TYPE']).to eq('application/x-www-form-urlencoded')

      status, headers, body = middleware.call(request)

      expect(status).not_to be(200)
    end

    it 'should validate if the body signature is correct' do
      middleware = Rack::TwilioWebhookAuthentication.new(@app, 'qwerty', /\/test/)

      request = Rack::MockRequest.env_for(
        'https://example.com/test',
        method: 'POST',
        params: {'foo' => 'bar'}
      )
      request['HTTP_X_TWILIO_SIGNATURE'] = 'TR9Skm9jiF4WVRJznU5glK5I83k='
      expect(request['CONTENT_TYPE']).to eq('application/x-www-form-urlencoded')

      status, headers, body = middleware.call(request)

      expect(status).to be(200)
    end
  end
end
