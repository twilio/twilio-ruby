module Twilio
  module Resources
    module V2010
      class AccountInstance < Twilio::REST::InstanceResource
        class SipList < Twilio::REST::ListResource
          class CredentialListList < Twilio::REST::ListResource
            can :list, :get, :create
            command_alias :credential_lists
            
            def initialize(client, inheritance={})
              super
              path "/Accounts/#{@account_sid}/SIP/CredentialLists.json"
              instance_id_key 'sid'
              instance_class CredentialListInstance
              list_key 'credential_lists'
            end
          end
        
          class CredentialListInstance < Twilio::REST::InstanceResource
            can :update, :delete
            
            def initialize(client, inheritance={}, params={}, query_params={})
              super
              path "/Accounts/#{@account_sid}/SIP/CredentialLists/#{@sid}.json"
              instance_id_key 'sid'
              dependent Twilio::Resources::V2010::AccountInstance::SipList::CredentialListInstance::CredentialList, {
                account_sid: @account_sid,
                credential_list_sid: @sid
              }
            end
          end
        end
      end
    end
  end
end