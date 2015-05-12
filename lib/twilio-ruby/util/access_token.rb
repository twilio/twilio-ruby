module Twilio
  module Util
    class AccessToken
      def initialize(signing_key_id, account_sid, secret, ttl=3600)
        @signing_key_sid = signing_key_id
        @account_sid = account_sid
        @secret = secret
        @ttl = ttl
        @grants = []
      end

      def add_grant(resource, actions=Action::ALL)
        actions = [*actions]
        @grants.push({"res" => resource, "act" => actions})
      end

      def add_endpoint_grant(endpoint, actions=[Action::Client::LISTEN, Action::Client::INVITE])
        resource = "sip:#{endpoint}@#{@account_sid}.endpoint.twilio.com"
        add_grant resource, actions
      end

      def as_jwt()
        now = Time.now.to_i - 1
        headers = {
            'cty' => 'twilio-sat;v=1'
        }
        payload = {
            'jti' => "#{@signing_key_sid}-#{now}",
            'iss' => @signing_key_sid,
            'sub' => @account_sid,
            'nbf' => now,
            'exp' => now + @ttl,
            'grants' => @grants
        }
        JWT.encode payload, @secret, 'HS256', headers
      end

      def to_s
        as_jwt
      end
    end

    class Action
      ALL='*'

      class HTTP
        DELETE='DELETE'
        GET='GET'
        POST='POST'
        PUT='PUT'
      end

      class Client
        LISTEN='listen'
        INVITE='invite'
      end
    end
  end
end
