module Twilio
  module Resources
    module V2010
      class AccountInstance
        class SipList
          class CredentialListInstance
            class CredentialList < ListResource
              can :list, :get, :create
              command_alias :credentials
              
              def initialize(client, inheritance={})
                super
                path "/Accounts/#{@account_sid}/SIP/CredentialLists/#{@sip_credential_list_sid}/Credentials.json"
                instance_id_key 'sid'
                instance_class CredentialInstance
              end
            end
          
            class CredentialInstance < InstanceResource
              can :update, :delete
              
              def initialize(client, inheritance={}, params={})
                super
                path "/Accounts/#{@account_sid}/SIP/CredentialList/#{@sip_credential_list_sid}/Credentials/#{@sid}.json"
                instance_id_key 'sid'
              end
            end
          end
        end
      end
    end
  end
end