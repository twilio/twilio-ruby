module Twilio
  module JWT
    class BaseJWT
      # Base class for creating JWTs.
      # @param [String] secret_key The secret to encode the JWT.
      # @param [String] issuer The issuer of the JWT.
      # @param [String] subject The subject of the JWT, omitted by default
      # @param [String] nbf The epoch time in seconds before which the token is valid.
      # @param [String] ttl Time to live in seconds for which the JWT is valid, default one hour (3600)
      # @param [String] valid_until The epoch time in seconds for which the JWT is valid , overrides ttl if specified
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

      # @return [Hash] Additional headers to include in the JWT, defaults to empty Hash.
      def _generate_headers
        {}
      end

      # @return [Hash] Payload of the JWT.
      def _generate_payload
        raise NotImplementedError
      end

      def headers
        headers = _generate_headers.clone
        headers['typ'] = 'JWT'
        headers['alg'] = @algorithm
        headers
      end

      def payload
        payload = _generate_payload.clone

        payload[:iss] = @issuer
        payload[:nbf] = @nbf || Time.now.to_i
        payload[:exp] = @valid_until.nil? ? Time.now.to_i + @ttl : @valid_until
        payload[:sub] = @subject unless @subject.nil?
        
        payload
      end

      def to_jwt
        ::JWT.encode payload, @secret_key, @algorithm, headers
      end
    end
  end
end
