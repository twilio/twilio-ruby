module Twilio
  module JWT
    class AccessToken < BaseJWT
      attr_accessor :account_sid,
                    :signing_key_id,
                    :secret,
                    :identity,
                    :grants,
                    :nbf,
                    :ttl,
                    :valid_until

      def initialize(account_sid, signing_key_sid, secret, grants=[], identity: nil, nbf: nil, ttl: 3600, valid_until: nil)
        super(secret_key: secret,
              issuer: signing_key_sid,
              subject: account_sid,
              nbf: nbf,
              ttl: ttl,
              valid_until: valid_until)
        @account_sid = account_sid
        @signing_key_sid = signing_key_sid
        @secret = secret
        @identity = identity
        @nbf = nbf
        @grants = grants
        @ttl = ttl
        @valid_until = valid_until
      end

      def add_grant(grant)
        @grants.push(grant)
      end

      def to_s
        to_jwt
      end

      protected
      def _generate_payload
        now = Time.now.to_i
        grants = {}
        if @identity
          grants[:identity] = @identity
        end

        @grants.each { |grant| grants[grant._key] = grant._generate_payload } unless @grants.empty?

        payload = {
            jti: "#{@signing_key_sid}-#{now}",
            grants: grants
        }

        payload
      end

      protected
      def _generate_headers
        headers = {
            cty: 'twilio-fpa;v=1'
        }

        headers
      end
    end

    module AccessTokenGrant
      def _key
        fail NotImplementedError
      end

      def _generate_payload
        fail NotImplementedError
      end

    end

    class IpMessagingGrant
      include AccessTokenGrant
      attr_accessor :service_sid,
                    :endpoint_id,
                    :deployment_role_sid,
                    :push_credential_sid


      def _key
        'ip_messaging'
      end

      def _generate_payload
        payload = {}

        if service_sid
          payload[:service_sid] = service_sid
        end

        if endpoint_id
          payload[:endpoint_id] = endpoint_id
        end

        if deployment_role_sid
          payload[:deployment_role_sid] = deployment_role_sid
        end

        if push_credential_sid
          payload[:push_credential_sid] = push_credential_sid
        end

        payload
      end

    end

    class VoiceGrant
      include AccessTokenGrant
      attr_accessor :outgoing_application_sid,
                    :outgoing_application_params,
                    :push_credential_sid,
                    :endpoint_id

      def _key
        'voice'
      end

      def _generate_payload
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

    class SyncGrant
      include AccessTokenGrant
      attr_accessor :service_sid,
                    :endpoint_id

      def _key
        'data_sync'

      end

      def _generate_payload
        payload = {}

        if service_sid
          payload['service_sid'] = service_sid
        end
        if endpoint_id
          payload['endpoint_id'] = endpoint_id
        end

        payload
      end
    end

    class ConversationsGrant
      include AccessTokenGrant
      attr_accessor :configuration_profile_sid

      def _key
        'rtc'
      end

      def _generate_payload
        payload = {}

        if configuration_profile_sid
          payload[:configuration_profile_sid] = configuration_profile_sid
        end

        payload
      end

     class << self
       extend Gem::Deprecate
       deprecate :new, 'VideoGrant.new', 2017, 5
     end


    end

    class VideoGrant
      include AccessTokenGrant
      attr_accessor :room

      def _key
        'video'
      end

      def _generate_payload
        payload = {}

        if room
          payload[:room] = room
        end

        payload
      end
    end

    class TaskRouterGrant
      include AccessTokenGrant
      attr_accessor :workspace_sid,
                    :worker_sid,
                    :role

      def _key
        'task_router'
      end

      def _generate_payload
        payload = {}

        if workspace_sid
          payload[:workspace_sid] = workspace_sid
        end

        if worker_sid
          payload[:worker_sid] = worker_sid
        end

        if role
          payload[:role] = role
        end

        payload
      end
    end
  end
end
