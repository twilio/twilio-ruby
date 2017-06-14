module Twilio
  module JWT
    class BaseJWT
      def initialize(secret_key: nil, issuer: nil, subject: nil, algorithm: 'HS256', nbf: nil, ttl: 3600, valid_until: nil)
        @secret_key = secret_key
        @issuer = issuer
        @subject = subject
        @algorithm = algorithm
        @nbf = nbf
        @ttl = ttl
        @valid_until = valid_until
      end

      def _generate_headers
        return {}
      end

      def _generate_payload
        fail NotImplementedError
      end

      def headers
        headers = self._generate_headers.clone()
        headers[:typ] = 'JWT'
        headers[:alg] = @algorithm
        return headers
      end

      def payload
        payload = self._generate_payload.clone()

        payload[:iss] = @issuer
        payload[:nbf] = @nbf || Time.now.to_i

        if @valid_until.nil?
          payload[:exp] = Time.now.to_i + @ttl
        else
          payload[:exp] = @valid_until
        end

        payload[:sub] = @subject unless @subject.nil?

        return payload
      end

      def to_jwt
        if @secret_key.nil?
          raise ArgumentError, 'JWT does not have a signing key'
        end
        return ::JWT.encode self.payload, @secret_key, @algorithm, self.headers
      end

    end
  end
end