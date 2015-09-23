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
    def initialize(app, auth_token, *paths, &auth_token_lookup)
      @app = app
      if block_given?
        @auth_token_lookup = auth_token_lookup
      else
        @validator = Twilio::Util::RequestValidator.new(auth_token)
      end
      @path_regex = Regexp.union(paths)
    end

    def call(env)
      return @app.call(env) unless env["PATH_INFO"].match(@path_regex)
      request = Rack::Request.new(env)
      url = request.url
      params = request.post? ? request.POST : {}
      signature = env['HTTP_X_TWILIO_SIGNATURE'] || ""
      if validator(params['AccountSid']).validate(url, params, signature)
        @app.call(env)
      else
        [
          403,
          {'Content-Type' => 'text/plain'},
          ["Twilio Request Validation Failed."]
        ]
      end
    end

    def validator account_sid
      @validator ||
        Twilio::Util::RequestValidator.new(@auth_token_lookup[account_sid])
    end

  end

end
