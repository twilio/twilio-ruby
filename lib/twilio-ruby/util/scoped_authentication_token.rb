module Twilio
  module Util
    class ScopedAuthenticationToken
      def initialize(signing_key_id, account_sid, token_id=nil, ttl=3600, grants=[])
        @signing_key_sid = signing_key_id
        @account_sid = account_sid
        if token_id.nil?
          @token_id = "#{signing_key_id} - #{Time.now.to_i}"
        else
          @token_id = token_id
        end
        @ttl = ttl
        @grants = grants
      end

      def add_grant(grant)
        @grants.push(grant)
      end

      def generate_token(secret)
        headers = {
            'cty' => 'twilio-sat;v=1'
        }
        payload = {
            'jti' => @token_id,
            'iss' => @signing_key_sid,
            'sub' => @account_sid,
            'nbf' => Time.now.to_i,
            'exp' => Time.now.to_i + @ttl,
            'grants' => @grants
        }
        JWT.encode payload, secret, 'HS256', headers
      end
    end

    class Action
      ALL='*'
      DELETE='DELETE'
      GET='GET'
      POST='POST'
      PUT='PUT'
    end

    class Grant
      def initialize(resource, actions=[Action::ALL])
        @resource = resource
        @actions = actions
      end

      def to_json(*a)
        {'res' => @resource, 'act' => @actions}.to_json(*a)
      end
    end
  end
end
