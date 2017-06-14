module Twilio
  module JWT
    class ClientCapability < BaseJWT
      attr_accessor :account_sid,
                    :auth_token,
                    :client_name,
                    :capabilities

      def initialize(account_sid, auth_token, nbf: nil, ttl: 3600, valid_until: nil)
        super(secret_key: auth_token, issuer: account_sid, algorithm: 'HS256', nbf: nbf, ttl: ttl, valid_until: valid_until)
        @account_sid = account_sid
        @auth_token = auth_token
        @client_name = nil
        @capabilities = {}
      end

      def allow_client_outgoing(application_sid, params={})
        scope = ScopeURI.new('client', 'outgoing', appSid: application_sid)

        unless params.empty?
          params.each { |k, v| scope.add_param(k, CGI.escape(v))}
        end

        @capabilities['outgoing'] = scope
      end

      def allow_client_incoming(client_name)
        @client_name = client_name
        @capabilities['incoming'] = ScopeURI.new('client', 'incoming', clientName: client_name)
      end

      def allow_event_stream(filters={})
        scope = ScopeURI.new('stream', 'subscribe', path: '/2010-04-01/Events')

        unless filters.empty?
          filters.each{ |k, v| scope.add_param(k, CGI.escape(v))}
        end

        @capabilities['events'] = scope
      end

      def to_s
        return self.to_jwt
      end

      protected
      def _generate_payload
        if capabilities.include?('outgoing') and !@client_name.nil?
          @capabilities['outgoing'].add_param('clientName', @client_name)
        end

        payload = {
          scope: @capabilities.map{|_, v| v.payload}.join(' '),
        }

        return payload
      end
    end

    class ScopeURI
      def initialize(service, privilege, **params)
        @service = service
        @privilege = privilege
        @params = params
      end

      def add_param(key, value)
        @params[key] = value
      end

      def payload
        param_string = ''
        unless @params.empty?
          param_string = @params.map{|k, v| "?#{k}=#{v}"}.join('')
        end

        return "scope:#{@service}:#{@privilege}#{param_string}"
      end
    end
  end
end
