module Twilio
  module Util
    class Configuration
      attr_accessor :account_sid, :auth_token

      def account_sid=value
        warn "'Twilio::Util::Configuration.account_sid' has been deprecated. Please do not use the configure block."
        @account_sid=value
      end

      def auth_token=value
        warn "'Twilio::Util::Configuration.auth_token' has been deprecated. Please do not use the configure block."
        @auth_token=value
      end
    end
  end
end
