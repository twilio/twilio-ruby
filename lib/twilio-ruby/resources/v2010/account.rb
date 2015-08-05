module Twilio
  module Resources
    module V2010
      class AccountList < ListResource
        can :list, :get, :create
        command_alias :accounts
        
        def initialize(client, inheritance={})
          super
          path "/Accounts.json"
          instance_id_key 'sid'
          instance_class AccountInstance
          list_key 'accounts'
        end
      end
    
      class AccountInstance < InstanceResource
        can :update
        
        def initialize(client, inheritance={}, params={})
          super
          path "/Accounts/#{@sid}.json"
          instance_id_key 'sid'
          dependent Twilio::Resources::V2010::AccountInstance::AddressList, {
            account_sid: @sid
          }
          dependent Twilio::Resources::V2010::AccountInstance::ApplicationList, {
            account_sid: @sid
          }
          dependent Twilio::Resources::V2010::AccountInstance::AuthorizedConnectAppList, {
            account_sid: @sid
          }
          dependent Twilio::Resources::V2010::AccountInstance::AvailablePhoneNumberCountryList, {
            account_sid: @sid
          }
          dependent Twilio::Resources::V2010::AccountInstance::CallList, {
            account_sid: @sid
          }
          dependent Twilio::Resources::V2010::AccountInstance::ConferenceList, {
            account_sid: @sid
          }
          dependent Twilio::Resources::V2010::AccountInstance::ConnectAppList, {
            account_sid: @sid
          }
          dependent Twilio::Resources::V2010::AccountInstance::IncomingPhoneNumberList, {
            account_sid: @sid
          }
          dependent Twilio::Resources::V2010::AccountInstance::MessageList, {
            account_sid: @sid
          }
          dependent Twilio::Resources::V2010::AccountInstance::NotificationList, {
            account_sid: @sid
          }
          dependent Twilio::Resources::V2010::AccountInstance::OutgoingCallerIdList, {
            account_sid: @sid
          }
          dependent Twilio::Resources::V2010::AccountInstance::QueueList, {
            account_sid: @sid
          }
          dependent Twilio::Resources::V2010::AccountInstance::RecordingList, {
            account_sid: @sid
          }
          dependent Twilio::Resources::V2010::AccountInstance::SandboxList, {
            account_sid: @sid
          }
          dependent Twilio::Resources::V2010::AccountInstance::SipList, {
            account_sid: @sid
          }
          dependent Twilio::Resources::V2010::AccountInstance::SmsList, {
            account_sid: @sid
          }
          dependent Twilio::Resources::V2010::AccountInstance::TokenList, {
            account_sid: @sid
          }
          dependent Twilio::Resources::V2010::AccountInstance::TranscriptionList, {
            account_sid: @sid
          }
          dependent Twilio::Resources::V2010::AccountInstance::UsageList, {
            account_sid: @sid
          }
        end
      end
    end
  end
end