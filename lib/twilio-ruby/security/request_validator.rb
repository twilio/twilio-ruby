module Twilio
  module Security
    class RequestValidator
      def initialize(auth_token = nil)
        @auth_token = auth_token || Twilio.auth_token
        raise ArgumentError, 'Auth token is required' if @auth_token.nil?
      end

      def validate(url, params, signature)
        params_hash = params_to_hash(params)
        expected = build_signature_for(url, params_hash)
        secure_compare(expected, signature)
      end

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
