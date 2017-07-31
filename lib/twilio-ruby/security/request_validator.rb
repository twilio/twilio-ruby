module Twilio
  module Security
    class RequestValidator
      ## Create a new RequestValidator
      # @param [String] auth_token the associated Twilio Auth Token
      def initialize(auth_token = nil)
        @auth_token = auth_token || Twilio.auth_token
        raise ArgumentError, 'Auth token is required' if @auth_token.nil?
      end

      ## Validate a request from Twilio
      # @param [String] url for full url that Twilio requested on your server
      # @param [Hash] params POST values that Twilio sent with the request
      # @param [String] signature expected signature the X-Twilio-Signature header attached to the request
      # @return [Boolean] true if the signature validations passes, false otherwise
      def validate(url, params, signature)
        params_hash = params_to_hash(params)
        expected = build_signature_for(url, params_hash)
        secure_compare(expected, signature)
      end

      ## Determine the signature for a request
      # @param [String] url for full url that Twilio requested on your server
      # @param [Hash] params POST values that Twilio sent with the request
      # @return [String] the calculated signature
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
      def params_to_hash(params)
        if params.respond_to?(:to_unsafe_h)
          params.to_unsafe_h
        else
          params
        end
      end
    end
  end
end
