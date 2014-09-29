module Rack
  # Middleware that authenticates webhooks from Twilio using the request
  # validator.
  #
  # The middleware takes an auth token with which to set up the request
  # validator and any number of paths. When a path matches the incoming request
  # path, the request will be checked for authentication.
  #
  # Example:
  #
  # require 'rack'
  # use Rack::TwilioWebhookAuthentication, ENV['AUTH_TOKEN'], /\/messages/
  #
  # The above appends this middleware to the stack, using an auth token saved in
  # the ENV and only against paths that match /\/messages/. If the request
  # validates then it gets passed on to the action as normal. If the request
  # doesn't validate then the middleware responds immediately with a 403 status.

  class TwilioWebhookAuthentication
    def initialize(app, auth_token, *paths)
      @app = app
      @auth_token = auth_token
      @path_regex = Regexp.union(paths)
    end

    def call(env)
      return @app.call(env) unless env["PATH_INFO"].match(@path_regex)
      validator = Twilio::Util::RequestValidator.new(@auth_token)
      request = Rack::Request.new(env)
      original_url = request.url
      params = request.post? ? request.POST : {}
      signature = env['HTTP_X_TWILIO_SIGNATURE']
      if validator.validate(original_url, params, signature)
        @app.call(env)
      else
        [
          403,
          {'Content-Type' => 'text/plain'},
          ["Twilio Request Validation Failed."]
        ]
      end
    end
  end
end
