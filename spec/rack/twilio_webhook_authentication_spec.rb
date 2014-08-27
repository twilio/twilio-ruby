require 'spec_helper'
require 'rack/mock'

describe Rack::TwilioWebhookAuthentication do
  before do
    @app = lambda {|env| [200, {'Content-Type' => 'text/plain'}, ['Hello']] }
  end

  describe 'new' do
    it 'should initialize with an app, auth token and a path' do
      expect {
        Rack::TwilioWebhookAuthentication.new(@app, 'ABC', /\/voice/)
      }.not_to raise_error
    end

    it 'should initialize with an app, auth token and paths' do
      expect {
        Rack::TwilioWebhookAuthentication.new(@app, 'ABC', /\/voice/, /\/sms/)
      }.not_to raise_error
    end
  end

  describe 'calling against one path' do
    before do
      @middleware = Rack::TwilioWebhookAuthentication.new(
        @app, 'ABC', /\/voice/
      )
    end

    it 'should not intercept when the path doesn\'t match' do
      expect(Twilio::Util::RequestValidator).to_not receive(:validate)
      request = Rack::MockRequest.env_for('/sms')
      status, headers, body = @middleware.call(request)
      expect(status).to be(200)
    end

    it 'should allow a request through if it validates' do
      expect_any_instance_of(Twilio::Util::RequestValidator).to(
        receive(:validate).and_return(true)
      )
      request = Rack::MockRequest.env_for('/voice')
      status, headers, body = @middleware.call(request)
      expect(status).to be(200)
    end

    it 'should short circuit a request to 403 if it does not validate' do
      expect_any_instance_of(Twilio::Util::RequestValidator).to(
        receive(:validate).and_return(false)
      )
      request = Rack::MockRequest.env_for('/voice')
      status, headers, body = @middleware.call(request)
      expect(status).to be(403)
    end
  end

  describe 'calling against many paths' do
    before do
      @middleware = Rack::TwilioWebhookAuthentication.new(
        @app, 'ABC', /\/voice/, /\/sms/
      )
    end

    it 'should not intercept when the path doesn\'t match' do
      expect(Twilio::Util::RequestValidator).to_not receive(:validate)
      request = Rack::MockRequest.env_for('icesms')
      status, headers, body = @middleware.call(request)
      expect(status).to be(200)
    end

    it 'shold allow a request through if it validates' do
      expect_any_instance_of(Twilio::Util::RequestValidator).to(
        receive(:validate).and_return(true)
      )
      request = Rack::MockRequest.env_for('/sms')
      status, headers, body = @middleware.call(request)
      expect(status).to be(200)
    end

    it 'should short circuit a request to 403 if it does not validate' do
      expect_any_instance_of(Twilio::Util::RequestValidator).to(
        receive(:validate).and_return(false)
      )
      request = Rack::MockRequest.env_for('/sms')
      status, headers, body = @middleware.call(request)
      expect(status).to be(403)
    end
  end
end
