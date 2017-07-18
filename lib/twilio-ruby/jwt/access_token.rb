module Twilio
  module JWT
    module AccessTokenGrant
      def _key
        raise NotImplementedError
      end

      def _generate_payload
        raise NotImplementedError
      end
    end

    # A Grant which gives access to a Twilio Resource
    class AccessToken < BaseJWT
      attr_accessor :account_sid,
                    :signing_key_id,
                    :secret,
                    :identity,
                    :grants,
                    :nbf,
                    :ttl,
                    :valid_until

      # @param [String] account_sid The account_sid for which the token is generated.
      # @param [String] signing_key_sid The API Key sid used to sign the token.
      # @param [String] secret The secret associated with signing_key_sid to sign the token.
      # @param [Array] grants An array of Grants to be added to the token.
      # @param [String] identity The identifier for the client of the token.
      # @param [String] nbf The epoch time in seconds before which the token is valid.
      # @param [String] ttl Time to live in seconds for which the JWT is valid, default one hour (3600)
      # @param [String] valid_until The epoch time in seconds for which the JWT is valid , overrides ttl if specified
      def initialize(
        account_sid,
        signing_key_sid,
        secret,
        grants = [],
        identity: nil,
        nbf: nil,
        ttl: 3600,
        valid_until: nil
      )
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

      # Adds a Grant to the AccessToken.
      # @param [Grant] grant to be added to the JWT.
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
        grants[:identity] = @identity if @identity

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

      # Grant to access Twilio IP Messaging
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

          payload[:service_sid] = service_sid if service_sid

          payload[:endpoint_id] = endpoint_id if endpoint_id

          if deployment_role_sid
            payload[:deployment_role_sid] = deployment_role_sid
          end

          if push_credential_sid
            payload[:push_credential_sid] = push_credential_sid
          end

          payload
        end
      end

      # Grant to access Twilio Voice
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

          payload[:endpoint_id] = endpoint_id if endpoint_id

          payload
        end
      end

      # Grant to access Twilio Sync
      class SyncGrant
        include AccessTokenGrant
        attr_accessor :service_sid,
                      :endpoint_id

        def _key
          'data_sync'
        end

        def _generate_payload
          payload = {}

          payload['service_sid'] = service_sid if service_sid
          payload['endpoint_id'] = endpoint_id if endpoint_id

          payload
        end
      end

      # Grant to access Twilio Conversations
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

      # Grant to access Twilio Video
      class VideoGrant
        include AccessTokenGrant
        attr_accessor :room

        def _key
          'video'
        end

        def _generate_payload
          payload = {}

          payload[:room] = room if room

          payload
        end
      end

      # Grant to access Twilio TaskRouter
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

          payload[:workspace_sid] = workspace_sid if workspace_sid

          payload[:worker_sid] = worker_sid if worker_sid

          payload[:role] = role if role

          payload
        end
      end
    end
  end
end
