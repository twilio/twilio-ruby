module Twilio
  module Resources
    module V2010
      class AccountInstance < Twilio::REST::InstanceResource
        class SipList < Twilio::REST::ListResource
          class CredentialListInstance < Twilio::REST::InstanceResource
            class CredentialList < Twilio::REST::ListResource
              can :list, :get, :create
              command_alias :credentials
              
              def initialize(client, inheritance={})
                super
                path "/Accounts/#{@account_sid}/SIP/CredentialLists/#{@sip_credential_list_sid}/Credentials.json"
                instance_id_key 'sid'
                instance_class CredentialInstance
                list_key 'credentials'
              end
            end
          
            class CredentialInstance < Twilio::REST::InstanceResource
              can :update, :delete
              
              def initialize(client, inheritance={}, params={}, query_params={})
                super
                path "/Accounts/#{@account_sid}/SIP/CredentialLists/#{@sip_credential_list_sid}/Credentials/#{@sid}.json"
                instance_id_key 'sid'
              end
            end
          end
        end
      end
    end
  end
end