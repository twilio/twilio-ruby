module Twilio
  module Util
    class RequestValidator

      def initialize(auth_token)
        @auth_token = auth_token
      end

      def validate(url, params, signature)
        expected = build_signature_for url, params
        expected == signature
      end

      def build_signature_for(url, params)
        data = url + params.sort.join
        digest = OpenSSL::Digest::Digest.new('sha1')
        Base64.encode64(OpenSSL::HMAC.digest(digest, @auth_token, data)).strip
      end

    end
  end
end
