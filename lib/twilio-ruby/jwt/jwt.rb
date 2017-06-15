module Twilio
  module JWT
    class BaseJWT
      # valid_until overrides ttl if specified
      def initialize(secret_key: nil, issuer: nil, subject: nil, nbf: nil, ttl: 3600, valid_until: nil)
        if secret_key.nil?
          raise ArgumentError, 'JWT does not have a signing key'
        end

        @secret_key = secret_key
        @issuer = issuer
        @subject = subject
        @algorithm = 'HS256'
        @nbf = nbf
        @ttl = ttl
        @valid_until = valid_until
      end

      def _generate_headers
        {}
      end

      def _generate_payload
        fail NotImplementedError
      end

      def headers
        headers = self._generate_headers.clone()
        headers[:typ] = 'JWT'
        headers[:alg] = @algorithm
        headers
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
        payload
      end

      def to_jwt
        ::JWT.encode self.payload, @secret_key, @algorithm, self.headers
      end

    end
  end
end