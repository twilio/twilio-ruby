# frozen_string_literal: true

module Twilio
  module Security
    class RequestValidator
      ##
      # Initialize a Request Validator. auth_token will either be grabbed from the global Twilio object or you can
      # pass it in here.
      #
      # @param [String] auth_token Your account auth token, used to sign requests
      def initialize(auth_token = nil)
        @auth_token = auth_token || Twilio.auth_token
        raise ArgumentError, 'Auth token is required' if @auth_token.nil?
      end

      ##
      # Validates that after hashing a request with Twilio's request-signing algorithm
      # (https://www.twilio.com/docs/usage/security#validating-requests), the hash matches the signature parameter
      #
      # @param [String] url The url sent to your server, including any query parameters
      # @param [String, Hash, #to_unsafe_h] params In most cases, this is the POST parameters as a hash. If you received
      #   a bodySHA256 parameter in the query string, this parameter can instead be the POST body as a string to
      #   validate JSON or other text-based payloads that aren't x-www-form-urlencoded.
      # @param [String] signature The expected signature, from the X-Twilio-Signature header of the request
      #
      # @return [Boolean] whether or not the computed signature matches the signature parameter
      def validate(url, params, signature)
        params_hash = body_or_hash(params)
        if params_hash.is_a? Enumerable
          expected = build_signature_for(url, params_hash)
          secure_compare(expected, signature)
        else
          expected_signature = build_signature_for(url, {})
          body_hash = URI.decode_www_form(URI(url).query).to_h['bodySHA256']
          expected_hash = build_hash_for(params)
          secure_compare(expected_signature, signature) && secure_compare(expected_hash, body_hash)
        end
      end

      ##
      # Build a SHA256 hash for a body string
      #
      # @param [String] body String to hash
      #
      # @return [String] A hex-encoded SHA256 of the body string
      def build_hash_for(body)
        hasher = OpenSSL::Digest.new('sha256')
        hasher.hexdigest(body)
      end

      ##
      # Build a SHA1-HMAC signature for a url and parameter hash
      #
      # @param [String] url The request url, including any query parameters
      # @param [#join] params The POST parameters
      #
      # @return [String] A base64 encoded SHA1-HMAC
      def build_signature_for(url, params)
        data = url + params.sort.join
        digest = OpenSSL::Digest.new('sha1')
        Base64.encode64(OpenSSL::HMAC.digest(digest, @auth_token, data)).strip
      end

      private

      # Compares two strings in constant time to avoid timing attacks.
      # Borrowed from ActiveSupport::MessageVerifier.
      # https://github.com/rails/rails/blob/master/activesupport/lib/active_support/message_verifier.rb
      def secure_compare(a, b)
        return false unless a.bytesize == b.bytesize

        l = a.unpack("C#{a.bytesize}")

        res = 0
        b.each_byte { |byte| res |= byte ^ l.shift }
        res.zero?
      end

      # `ActionController::Parameters` no longer, as of Rails 5, inherits
      # from `Hash` so the `sort` method, used above in `build_signature_for`
      # is deprecated.
      #
      # `to_unsafe_h` was introduced in Rails 4.2.1, before then it is still
      # possible to sort on an ActionController::Parameters object.
      #
      # We use `to_unsafe_h` as `to_h` returns a hash of the permitted
      # parameters only and we need all the parameters to create the signature.
      def body_or_hash(params_or_body)
        if params_or_body.respond_to?(:to_unsafe_h)
          params_or_body.to_unsafe_h
        else
          params_or_body
        end
      end
    end
  end
end
