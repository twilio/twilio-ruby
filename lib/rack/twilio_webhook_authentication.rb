# frozen_string_literal: true

require 'rack/media_type'
require 'rack/utils'

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
  #
  # Webhooks signed with a SharedKey (see the Webhooks Rules API) carry an
  # X-Twilio-Webhooks-Signature-Settings header naming the signing algorithm, and
  # are signed with the SharedKey secret instead of the auth token. Pass it with
  # the shared_key_secret option:
  #
  # use Rack::TwilioWebhookAuthentication, ENV['AUTH_TOKEN'], /\/voice/, shared_key_secret: ENV['SHARED_KEY_SECRET']
  #
  # Requests without that header are still validated with the auth token and
  # HMAC-SHA1. A request with the header but no shared_key_secret configured gets
  # a 500, as the middleware cannot validate it.

  class TwilioWebhookAuthentication
    # Rack's FORM_DATA_MEDIA_TYPES can be modified to taste, so we're slightly
    # more conservative in what we consider form data.
    FORM_URLENCODED_MEDIA_TYPE = Rack::MediaType.type('application/x-www-form-urlencoded')
    SIGNATURE_SETTINGS_ENV_KEY = 'HTTP_X_TWILIO_WEBHOOKS_SIGNATURE_SETTINGS'

    def initialize(app, auth_token, *paths, shared_key_secret: nil, &auth_token_lookup)
      @app = app
      @auth_token = auth_token
      @shared_key_secret = shared_key_secret
      define_singleton_method(:get_auth_token, auth_token_lookup) if block_given?
      @path_regex = Regexp.union(paths)
    end

    def call(env)
      return @app.call(env) unless protected_path?(env['PATH_INFO'])
      request = Rack::Request.new(env)
      original_url = request.url
      params = extract_params!(request)
      signature_settings = env[SIGNATURE_SETTINGS_ENV_KEY]
      secret = signature_settings ? @shared_key_secret : (@auth_token || get_auth_token(params['AccountSid']))
      return missing_shared_key_secret_response if secret.nil?

      validator = Twilio::Security::RequestValidator.new(secret)
      signature = env['HTTP_X_TWILIO_SIGNATURE'] || ''
      algorithm = Twilio::Security::RequestValidator.signature_algorithm(signature_settings)
      if validator.validate(original_url, params, signature, algorithm)
        @app.call(env)
      else
        [
          403,
          { 'Content-Type' => 'text/plain' },
          ['Twilio Request Validation Failed.']
        ]
      end
    end

    def missing_shared_key_secret_response
      [
        500,
        { 'Content-Type' => 'text/plain' },
        ['Twilio Request Validation Failed: no SharedKey secret configured for a SharedKey-signed request.']
      ]
    end

    # Decide whether a request path needs its signature validated.
    #
    # PATH_INFO arrives percent-encoded, but the routers we sit in front of
    # (Rails, Sinatra) decode and normalize the path before matching it against
    # their routes. Comparing the configured patterns against the raw PATH_INFO
    # alone therefore lets a request like `/%76oice` slip past this middleware
    # unvalidated and still reach the `/voice` action.
    #
    # We compare against every form the path could take downstream and validate
    # if any of them matches. Erring towards validating means a path we can't
    # make sense of is still checked rather than waved through.
    def protected_path?(path)
      path = path.to_s
      candidates = [path, decode(path)]
      candidates << remove_dot_segments(candidates.last)
      candidates.uniq.any? { |candidate| candidate.match(@path_regex) }
    end

    # Percent-decode a path the way a downstream router would. `unescape_path`
    # (rather than `unescape`) leaves `+` alone, since a plus is a literal plus
    # in a path and only means a space in a query string. Undecodable bytes are
    # scrubbed, as matching a Regexp against invalid UTF-8 raises.
    def decode(path)
      decoded = Rack::Utils.unescape_path(path)
      decoded.valid_encoding? ? decoded : decoded.scrub
    rescue ArgumentError
      path
    end

    # Collapse `.`, `..` and repeated slashes, so an anchored pattern such as
    # %r{\A/voice\z} still recognizes `/sms/../voice`.
    def remove_dot_segments(path)
      segments = path.split('/').each_with_object([]) do |segment, resolved|
        case segment
        when '', '.' then next
        when '..' then resolved.pop
        else resolved << segment
        end
      end
      "/#{segments.join('/')}"
    end

    # Extract the params from the the request that we can use to determine the
    # signature. This _may_ modify the passed in request since it may read/rewind
    # the body.
    def extract_params!(request)
      return {} unless request.post?

      if request.media_type == FORM_URLENCODED_MEDIA_TYPE
        request.POST
      else
        request.body.rewind
        body = request.body.read
        request.body.rewind
        body
      end
    end

    private :missing_shared_key_secret_response, :extract_params!, :protected_path?, :decode, :remove_dot_segments
  end
end
