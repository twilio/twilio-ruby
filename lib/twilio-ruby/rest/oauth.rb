module Twilio
  module REST
    class Oauth < OauthBase
      ##
      # @return [Twilio::REST::Oauth::V1::OauthInstance]
      def oauth
        warn "oauth is deprecated. Use v1.oauth instead."
        self.v1.oauth()
      end

      ##
      # @return [Twilio::REST::Oauth::V1::OpenidDiscoveryInstance]
      def openid_discovery
        warn "openid_discovery is deprecated. Use v1.openid_discovery instead."
        self.v1.openid_discovery()
      end

      ##
      # @return [Twilio::REST::Oauth::V1::TokenInstance]
      def token
        warn "token is deprecated. Use v1.token instead."
        self.v1.token()
      end

      ##
      # @return [Twilio::REST::Oauth::V1::UserInfoInstance]
      def user_info
        warn "user_info is deprecated. Use v1.user_info instead."
        self.v1.user_info()
      end
    end
  end
end
