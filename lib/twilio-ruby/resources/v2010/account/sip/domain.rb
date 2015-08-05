module Twilio
  module Resources
    module V2010
      class AccountInstance
        class SipList
          class DomainList < ListResource
            can :list, :get, :create
            command_alias :domains
            
            def initialize(client, inheritance={})
              super
              path "/Accounts/#{@account_sid}/SIP/Domains.json"
              instance_id_key 'sid'
              instance_class DomainInstance
            end
          end
        
          class DomainInstance < InstanceResource
            can :update, :delete
            
            def initialize(client, inheritance={}, params={})
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