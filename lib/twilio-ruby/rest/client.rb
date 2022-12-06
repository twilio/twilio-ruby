##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true
require 'twilio-ruby/base/client_base'

module Twilio
  module REST
    ##
    # A client for accessing the Twilio API.
    class Client < ClientBase
      
      ##
      # Access the Accounts Twilio Domain
      def accounts
        @accounts ||= Accounts.new self
      end

      ##
      # Access the Api Twilio Domain
      def api
        @api ||= Api.new self
      end

      ##
      # Access the Autopilot Twilio Domain
      def autopilot
        @autopilot ||= Autopilot.new self
      end

      ##
      # Access the Chat Twilio Domain
      def chat
        @chat ||= Chat.new self
      end

      ##
      # Access the Content Twilio Domain
      def content
        @content ||= Content.new self
      end

      ##
      # Access the Conversations Twilio Domain
      def conversations
        @conversations ||= Conversations.new self
      end

      ##
      # Access the Events Twilio Domain
      def events
        @events ||= Events.new self
      end

      ##
      # Access the FlexApi Twilio Domain
      def flex_api
        @flex_api ||= FlexApi.new self
      end

      ##
      # Access the FrontlineApi Twilio Domain
      def frontline_api
        @frontline_api ||= FrontlineApi.new self
      end

      ##
      # Access the Insights Twilio Domain
      def insights
        @insights ||= Insights.new self
      end

      ##
      # Access the IpMessaging Twilio Domain
      def ip_messaging
        @ip_messaging ||= IpMessaging.new self
      end

      ##
      # Access the Lookups Twilio Domain
      def lookups
        @lookups ||= Lookups.new self
      end

      ##
      # Access the Media Twilio Domain
      def media
        @media ||= Media.new self
      end

      ##
      # Access the Messaging Twilio Domain
      def messaging
        @messaging ||= Messaging.new self
      end

      ##
      # Access the Monitor Twilio Domain
      def monitor
        @monitor ||= Monitor.new self
      end

      ##
      # Access the Notify Twilio Domain
      def notify
        @notify ||= Notify.new self
      end

      ##
      # Access the Numbers Twilio Domain
      def numbers
        @numbers ||= Numbers.new self
      end

      ##
      # Access the Oauth Twilio Domain
      def oauth
        @oauth ||= Oauth.new self
      end

      ##
      # Access the Preview Twilio Domain
      def preview
        @preview ||= Preview.new self
      end

      ##
      # Access the Pricing Twilio Domain
      def pricing
        @pricing ||= Pricing.new self
      end

      ##
      # Access the Proxy Twilio Domain
      def proxy
        @proxy ||= Proxy.new self
      end

      ##
      # Access the Routes Twilio Domain
      def routes
        @routes ||= Routes.new self
      end

      ##
      # Access the Serverless Twilio Domain
      def serverless
        @serverless ||= Serverless.new self
      end

      ##
      # Access the Studio Twilio Domain
      def studio
        @studio ||= Studio.new self
      end

      ##
      # Access the Sync Twilio Domain
      def sync
        @sync ||= Sync.new self
      end

      ##
      # Access the Taskrouter Twilio Domain
      def taskrouter
        @taskrouter ||= Taskrouter.new self
      end

      ##
      # Access the Trunking Twilio Domain
      def trunking
        @trunking ||= Trunking.new self
      end

      ##
      # Access the Trusthub Twilio Domain
      def trusthub
        @trusthub ||= Trusthub.new self
      end

      ##
      # Access the Verify Twilio Domain
      def verify
        @verify ||= Verify.new self
      end

      ##
      # Access the Video Twilio Domain
      def video
        @video ||= Video.new self
      end

      ##
      # Access the Voice Twilio Domain
      def voice
        @voice ||= Voice.new self
      end

      ##
      # Access the Wireless Twilio Domain
      def wireless
        @wireless ||= Wireless.new self
      end

      ##
      # Access the Supersim Twilio Domain
      def supersim
        @supersim ||= Supersim.new self
      end

      ##
      # Access the Bulkexports Twilio Domain
      def bulkexports
        @bulkexports ||= Bulkexports.new self
      end

      ##
      # Access the Microvisor Twilio Domain
      def microvisor
        @microvisor ||= Microvisor.new self
      end

      ##
      # @param [String] sid The unique string that that we created to identify the
      #   Address resource.
      # @return [Twilio::REST::Api::V2010::AccountContext::AddressInstance] if sid was passed.
      # @return [Twilio::REST::Api::V2010::AccountContext::AddressList]
      def addresses(sid=:unset)
        self.api.v2010.account.addresses(sid)
      end

      ##
      # @param [String] sid The unique string that that we created to identify the
      #   Application resource.
      # @return [Twilio::REST::Api::V2010::AccountContext::ApplicationInstance] if sid was passed.
      # @return [Twilio::REST::Api::V2010::AccountContext::ApplicationList]
      def applications(sid=:unset)
        self.api.v2010.account.applications(sid)
      end

      ##
      # @param [String] connect_app_sid The SID that we assigned to the Connect App.
      # @return [Twilio::REST::Api::V2010::AccountContext::AuthorizedConnectAppInstance] if connect_app_sid was passed.
      # @return [Twilio::REST::Api::V2010::AccountContext::AuthorizedConnectAppList]
      def authorized_connect_apps(connect_app_sid=:unset)
        self.api.v2010.account.authorized_connect_apps(connect_app_sid)
      end

      ##
      # @param [String] country_code The
      #   {ISO-3166-1}[https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2] country code of
      #   the country.
      # @return [Twilio::REST::Api::V2010::AccountContext::AvailablePhoneNumberCountryInstance] if country_code was passed.
      # @return [Twilio::REST::Api::V2010::AccountContext::AvailablePhoneNumberCountryList]
      def available_phone_numbers(country_code=:unset)
        self.api.v2010.account.available_phone_numbers(country_code)
      end

      ##
      # @return [Twilio::REST::Api::V2010::AccountContext::BalanceInstance]
      def balance
        self.api.v2010.account.balance
      end

      ##
      # @param [String] sid The unique string that we created to identify this Call
      #   resource.
      # @return [Twilio::REST::Api::V2010::AccountContext::CallInstance] if sid was passed.
      # @return [Twilio::REST::Api::V2010::AccountContext::CallList]
      def calls(sid=:unset)
        self.api.v2010.account.calls(sid)
      end

      ##
      # @param [String] sid The unique string that that we created to identify this
      #   Conference resource.
      # @return [Twilio::REST::Api::V2010::AccountContext::ConferenceInstance] if sid was passed.
      # @return [Twilio::REST::Api::V2010::AccountContext::ConferenceList]
      def conferences(sid=:unset)
        self.api.v2010.account.conferences(sid)
      end

      ##
      # @param [String] sid The unique string that that we created to identify the
      #   ConnectApp resource.
      # @return [Twilio::REST::Api::V2010::AccountContext::ConnectAppInstance] if sid was passed.
      # @return [Twilio::REST::Api::V2010::AccountContext::ConnectAppList]
      def connect_apps(sid=:unset)
        self.api.v2010.account.connect_apps(sid)
      end

      ##
      # @param [String] sid The unique string that that we created to identify this
      #   IncomingPhoneNumber resource.
      # @return [Twilio::REST::Api::V2010::AccountContext::IncomingPhoneNumberInstance] if sid was passed.
      # @return [Twilio::REST::Api::V2010::AccountContext::IncomingPhoneNumberList]
      def incoming_phone_numbers(sid=:unset)
        self.api.v2010.account.incoming_phone_numbers(sid)
      end

      ##
      # @param [String] sid The unique string that that we created to identify the Key
      #   resource.
      # @return [Twilio::REST::Api::V2010::AccountContext::KeyInstance] if sid was passed.
      # @return [Twilio::REST::Api::V2010::AccountContext::KeyList]
      def keys(sid=:unset)
        self.api.v2010.account.keys(sid)
      end

      ##
      # @param [String] sid The unique string that that we created to identify the
      #   Message resource.
      # @return [Twilio::REST::Api::V2010::AccountContext::MessageInstance] if sid was passed.
      # @return [Twilio::REST::Api::V2010::AccountContext::MessageList]
      def messages(sid=:unset)
        self.api.v2010.account.messages(sid)
      end

      ##
      # @return [Twilio::REST::Api::V2010::AccountContext::NewKeyInstance]
      def new_keys
        self.api.v2010.account.new_keys
      end

      ##
      # @return [Twilio::REST::Api::V2010::AccountContext::NewSigningKeyInstance]
      def new_signing_keys
        self.api.v2010.account.new_signing_keys
      end

      ##
      # @param [String] sid The unique string that that we created to identify the
      #   Notification resource.
      # @return [Twilio::REST::Api::V2010::AccountContext::NotificationInstance] if sid was passed.
      # @return [Twilio::REST::Api::V2010::AccountContext::NotificationList]
      def notifications(sid=:unset)
        self.api.v2010.account.notifications(sid)
      end

      ##
      # @param [String] sid The unique string that that we created to identify the
      #   OutgoingCallerId resource.
      # @return [Twilio::REST::Api::V2010::AccountContext::OutgoingCallerIdInstance] if sid was passed.
      # @return [Twilio::REST::Api::V2010::AccountContext::OutgoingCallerIdList]
      def outgoing_caller_ids(sid=:unset)
        self.api.v2010.account.outgoing_caller_ids(sid)
      end

      ##
      # @param [String] sid The unique string that that we created to identify this
      #   Queue resource.
      # @return [Twilio::REST::Api::V2010::AccountContext::QueueInstance] if sid was passed.
      # @return [Twilio::REST::Api::V2010::AccountContext::QueueList]
      def queues(sid=:unset)
        self.api.v2010.account.queues(sid)
      end

      ##
      # @param [String] sid The unique string that that we created to identify the
      #   Recording resource.
      # @return [Twilio::REST::Api::V2010::AccountContext::RecordingInstance] if sid was passed.
      # @return [Twilio::REST::Api::V2010::AccountContext::RecordingList]
      def recordings(sid=:unset)
        self.api.v2010.account.recordings(sid)
      end

      ##
      # @param [String] sid The sid
      # @return [Twilio::REST::Api::V2010::AccountContext::SigningKeyInstance] if sid was passed.
      # @return [Twilio::REST::Api::V2010::AccountContext::SigningKeyList]
      def signing_keys(sid=:unset)
        self.api.v2010.account.signing_keys(sid)
      end

      ##
      # @return [Twilio::REST::Api::V2010::AccountContext::SipInstance]
      def sip
        self.api.v2010.account.sip
      end

      ##
      # @param [String] sid The unique string that that we created to identify this
      #   ShortCode resource.
      # @return [Twilio::REST::Api::V2010::AccountContext::ShortCodeInstance] if sid was passed.
      # @return [Twilio::REST::Api::V2010::AccountContext::ShortCodeList]
      def short_codes(sid=:unset)
        self.api.v2010.account.short_codes(sid)
      end

      ##
      # @return [Twilio::REST::Api::V2010::AccountContext::TokenInstance]
      def tokens
        self.api.v2010.account.tokens
      end

      ##
      # @param [String] sid The unique string that that we created to identify the
      #   Transcription resource.
      # @return [Twilio::REST::Api::V2010::AccountContext::TranscriptionInstance] if sid was passed.
      # @return [Twilio::REST::Api::V2010::AccountContext::TranscriptionList]
      def transcriptions(sid=:unset)
        self.api.v2010.account.transcriptions(sid)
      end

      ##
      # @return [Twilio::REST::Api::V2010::AccountContext::UsageInstance]
      def usage
        self.api.v2010.account.usage
      end

      ##
      # @return [Twilio::REST::Api::V2010::AccountContext::ValidationRequestInstance]
      def validation_requests
        self.api.v2010.account.validation_requests
      end

      ##
      # Provide a user friendly representation
      def to_s
        "#<Twilio::REST::Client #{@account_sid}>"
      end
    end

    ##
    # Dummy client which provides no functionality. Please use Twilio::REST::Client instead.
    class BaseClient < ObsoleteClient; end

    ##
    # Dummy client which provides no functionality. Please use Twilio::REST::Client instead.
    class IpMessagingClient < ObsoleteClient; end

    ##
    # Dummy client which provides no functionality. Please use Twilio::REST::Client instead.
    class LookupsClient < ObsoleteClient; end

    ##
    # Dummy client which provides no functionality. Please use Twilio::REST::Client instead.
    class MonitorClient < ObsoleteClient; end

    ##
    # Dummy client which provides no functionality. Please use Twilio::REST::Client instead.
    class PricingClient < ObsoleteClient; end

    ##
    # Dummy client which provides no functionality. Please use Twilio::REST::Client instead.
    class TaskRouterClient < ObsoleteClient; end

    ##
    # Dummy client which provides no functionality. Please use Twilio::REST::Client instead.
    class TrunkingClient < ObsoleteClient; end
  end
end