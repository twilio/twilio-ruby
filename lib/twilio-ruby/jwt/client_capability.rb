module Twilio
  module JWT
    module Scope
      def _generate_payload
        raise 'Not Implemented'
      end
    end

    ## A JWT of capabilities for Twilio Client
    class ClientCapability < BaseJWT
      attr_accessor :account_sid,
                    :auth_token,
                    :client_name,
                    :scopes

      alias to_s to_jwt

      # @param [String] account_sid The account_sid for which the token is generated
      # @param [String] auth_token The secret_key to sign the token
      # @param [Array] scopes An array of Scopes to be added to the token
      # @param [String] nbf The epoch time in seconds before which the token is valid.
      # @param [String] ttl Time to live in seconds for which the JWT is valid, default one hour (3600)
      # @param [String] valid_until The epoch time in seconds for which the JWT is valid , overrides ttl if specified
      def initialize(account_sid, auth_token, scopes: [], nbf: nil, ttl: 3600, valid_until: nil)
        super(secret_key: auth_token, issuer: account_sid, nbf: nbf, ttl: ttl, valid_until: valid_until)
        @account_sid = account_sid
        @auth_token = auth_token
        @client_name = nil
        @scopes = scopes
      end

      # Adds a Scope, permission, to the Client Capability Token
      # @param [Scope] scope Scope to be added to the JwT.
      def add_scope(scope)
        @scopes.push(scope)
      end

      protected

      # @return [Hash] Payload of the JWT.
      def _generate_payload
        scope = ''
        scope = @scopes.map(&:_generate_payload).join(' ') unless @scopes.empty?

        payload = {
          scope: scope
        }

        payload
      end

      # Allows for Client to accept incoming connections
      class IncomingClientScope
        include Scope

        # @param [String] client_name The client name to accept incoming calls
        def initialize(client_name)
          @client_name = client_name
        end

        def _generate_payload
          prefix = 'scope:client:incoming'
          suffix = 'clientName=' + CGI.escape(@client_name.to_s)

          [prefix, suffix].join('?')
        end
      end

      # Allows for making outgoing connections
      class OutgoingClientScope
        include Scope

        # @param [String] application_sid Associated application
        # @param [String] client_name to accept incoming calls
        # @param [Hash] params application params
        def initialize(application_sid, client_name = nil, params = {})
          @application_sid = application_sid
          @client_name = client_name
          @params = params
        end

        def _generate_payload
          prefix = 'scope:client:outgoing'
          application_sid = "appSid=#{CGI.escape(@application_sid)}"
          unless @client_name.nil?
            client_name = "clientName=#{CGI.escape(@client_name)}"
          end
          unless @params.empty?
            params = 'appParams=' + @params.map { |k, v| CGI.escape("#{k}=#{v}") }.join('&')
          end

          suffix = [application_sid, client_name, params].compact.join('&')
          [prefix, suffix].join('?')
        end
      end

      # Allows for access to event stream
      class EventStreamScope
        include Scope

        def initialize(filters = {})
          @filters = filters
          @path = '/2010-04-01/Events'
        end

        def _generate_payload
          prefix = 'scope:stream:subscribe'
          path = "path=#{CGI.escape(@path)}"
          unless @filters.empty?
            filters = 'params=' + @filters.map { |k, v| CGI.escape("#{k}=#{v}") }.join('&')
          end

          suffix = [path, filters].compact.join('&')
          [prefix, suffix].join('?')
        end
      end
    end
  end
end
