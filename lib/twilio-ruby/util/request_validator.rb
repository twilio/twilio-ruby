module Twilio
  module Util
    class RequestValidator

      def initialize(auth_token = nil)
        @auth_token = auth_token || Twilio.auth_token
        raise ArgumentError, 'Auth token is required' if @auth_token.nil?
      end

      def validate(url, params, signature)
        expected = build_signature_for url, params
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
        res == 0
      end
    end
  end
end
