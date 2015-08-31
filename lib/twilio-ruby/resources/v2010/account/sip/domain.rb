module Twilio
  module Resources
    module V2010
      class AccountInstance < Twilio::REST::InstanceResource
        class SipList < Twilio::REST::ListResource
          class DomainList < Twilio::REST::ListResource
            can :list, :get, :create
            command_alias :domains
            
            def initialize(client, inheritance={})
              super
              path "/Accounts/#{@account_sid}/SIP/Domains.json"
              instance_id_key 'sid'
              instance_class DomainInstance
              list_key 'domains'
            end
          end
        
          class DomainInstance < Twilio::REST::InstanceResource
            can :update, :delete
            
            def initialize(client, inheritance={}, params={}, query_params={})
              super
              path "/Accounts/#{@account_sid}/SIP/Domains/#{@sid}.json"
              instance_id_key 'sid'
              dependent Twilio::Resources::V2010::AccountInstance::SipList::DomainInstance::IpAccessControlListMappingList, {
                account_sid: @account_sid,
                domain_sid: @sid
              }
              dependent Twilio::Resources::V2010::AccountInstance::SipList::DomainInstance::CredentialListMappingList, {
                account_sid: @account_sid,
                domain_sid: @sid
              }
            end
          end
        end
      end
    end
  end
end