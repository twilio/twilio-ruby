module Twilio
  module Util
    class Capability

      include Twilio::Util

      def initialize(account_sid = nil, auth_token = nil)
        @account_sid = account_sid || Twilio.account_sid
        @auth_token = auth_token || Twilio.auth_token
        if @account_sid.nil? || @auth_token.nil?
          raise ArgumentError, 'Account SID and auth token are required'
        end
        @capabilities = []
      end

      def allow_client_incoming(client_name)
        @client_name = client_name # stash for use in outgoing
        scope_params = { 'clientName' => client_name }
        @capabilities << scope_uri_for('client', 'incoming', scope_params)
      end

      def allow_client_outgoing(app_sid, params = {})
        @allow_client_outgoing = true
        @outgoing_scope_params = { 'appSid' => app_sid }
        unless params.empty?
          @outgoing_scope_params['appParams'] = url_encode params
        end
      end

      def allow_event_stream(filters = {})
        scope_params = { 'path' => '/2010-04-01/Events' }
        scope_params['params'] = filters unless filters.empty?
        @capabilities << scope_uri_for('stream', 'subscribe', scope_params)
      end

      def scope_uri_for(service, privilege, params = {})
        scope_uri = "scope:#{service}:#{privilege}"
        scope_uri << "?#{url_encode(params)}" unless params.empty?
      end

      def generate(ttl = 3600)

        capabilities = @capabilities.clone # we need a local copy to work on

        # build the outgoing scope lazily so that we can use @client_name
        if @allow_client_outgoing
          params = @outgoing_scope_params
          params.merge!('clientName' => @client_name) if @client_name
          capabilities << scope_uri_for('client', 'outgoing', params)
        end

        payload = {
          'scope' => capabilities.join(' '),
          'iss' => @account_sid,
          'exp' => (Time.now.to_i + ttl),
        }

        JWT.encode payload, @auth_token

      end

    end
  end
end
