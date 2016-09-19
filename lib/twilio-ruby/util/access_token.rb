module Twilio
  module Util
    class AccessToken
      attr_accessor :account_sid,
                    :signing_key_id,
                    :secret,
                    :ttl,
                    :identity,
                    :nbf

      def initialize(account_sid, signing_key_id, secret, ttl=3600, identity=nil, nbf=nil)
        @account_sid = account_sid
        @signing_key_sid = signing_key_id
        @secret = secret
        @ttl = ttl
        @identity = identity
        @nbf = nbf
        @grants = []
      end

      def add_grant(grant)
        @grants.push(grant)
      end

      def to_jwt(algorithm='HS256')
        now = Time.now.to_i - 1
        headers = {
            'cty' => 'twilio-fpa;v=1',
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
            'exp' => now + @ttl,
            'grants' => grants
        }

        payload['nbf'] = @nbf unless @nbf.nil?

        JWT.encode payload, @secret, algorithm, headers
      end

      def to_s
        to_jwt
      end

      class ConversationsGrant
        attr_accessor :configuration_profile_sid

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
        attr_accessor :service_sid,
                      :endpoint_id,
                      :deployment_role_sid,
                      :push_credential_sid

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
          if @deployment_role_sid
            payload['deployment_role_sid'] = @deployment_role_sid
          end
          if @push_credential_sid
            payload['push_credential_sid'] = @push_credential_sid
          end

          payload
        end

      end

      class VoiceGrant
        attr_accessor :outgoing_application_sid,
                      :outgoing_application_params,
                      :push_credential_sid,
                      :endpoint_id

        def key
          'voice'
        end

        def payload
          payload = {}

          if outgoing_application_sid
            outgoing = {}
            outgoing[:application_sid] = outgoing_application_sid
            if outgoing_application_params
              outgoing[:params] = outgoing_application_params
            end

            payload[:outgoing] = outgoing
          end

          if push_credential_sid
            payload[:push_credential_sid] = push_credential_sid
          end

          if endpoint_id
            payload[:endpoint_id] = endpoint_id
          end

          payload
        end
      end

      class VideoGrant
        attr_accessor :configuration_profile_sid

        def key
          'video'
        end

        def payload
          payload = {}

          if configuration_profile_sid
            payload[:configuration_profile_sid] = configuration_profile_sid
          end

          payload
        end
      end

    end
  end
end
