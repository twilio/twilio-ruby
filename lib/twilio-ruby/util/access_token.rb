module Twilio
  module Util
    class AccessToken
      def initialize(signing_key_id, account_sid, secret, ttl=3600, identity=nil)
        @signing_key_sid = signing_key_id
        @account_sid = account_sid
        @secret = secret
        @ttl = ttl
        @identity = identity
        @grants = []
      end

      def add_grant(grant)
        @grants.push(grant)
      end

      def to_jwt(algorithm='HS256')
        now = Time.now.to_i - 1
        headers = {
            'cty' => 'twilio-sat;v=2',
            'typ' => 'JWT'
        }

        grants = {}
        if @identity
          grants['identity'] = @identity
        end

        @grants.each { |grant| grants[grant.key] = grant.payload }

        payload = {
            'jti' => "#{@signing_key_sid}-#{now}",
            'iss' => @signing_key_sid,
            'sub' => @account_sid,
            'nbf' => now,
            'exp' => now + @ttl,
            'grants' => grants
        }
        JWT.encode payload, @secret, algorithm, headers
      end

      def to_s
        to_jwt
      end

      class ConversationGrant
        attr_writer :configuration_profile_sid

        def key
          'rtc'
        end

        def payload
          payload = {}
          if @configuration_profile_sid
            payload['configuration_profile_sid'] = @configuration_profile_sid
          end

          payload
        end

      end

      class IpMessagingGrant
        attr_writer :service_sid
        attr_writer :endpoint_id
        attr_writer :role_sid
        attr_writer :credential_sid

        def key
          'ip_messaging'
        end

        def payload
          payload = {}
          if @service_sid
            payload['service_sid'] = @service_sid
          end
          if @endpoint_id
            payload['endpoint_id'] = @endpoint_id
          end
          if @role_sid
            payload['deployment_role_sid'] = @role_sid
          end
          if @credential_sid
            payload['push_credential_sid'] = @credential_sid
          end

          payload
        end

      end

    end
  end
end
