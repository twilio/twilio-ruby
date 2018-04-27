# frozen_string_literal: true

module Twilio
  module Util
    class Configuration
      attr_accessor :account_sid, :auth_token
      def account_sid=value
        @account_sid=value
      end

      def auth_token=value
        @auth_token=value
      end
    end
  end
end
