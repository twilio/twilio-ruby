module Twilio
  module Resources
    module V2010
      class AccountInstance < Twilio::REST::InstanceResource
        class SipList < Twilio::REST::ListResource
          class DomainInstance < Twilio::REST::InstanceResource
            class CredentialListMappingList < Twilio::REST::ListResource
              can :list, :get, :create
              command_alias :credential_list_mappings
              
              def initialize(client, inheritance={})
                super
                path "/Accounts/#{@account_sid}/SIP/Domains/#{@domain_sid}/CredentialListMappings.json"
                instance_id_key 'sid'
                instance_class CredentialListMappingInstance
                list_key 'credential_list_mappings'
              end
            end
          
            class CredentialListMappingInstance < Twilio::REST::InstanceResource
              can :delete
              
              def initialize(client, inheritance={}, params={})
                super
                path "/Accounts/#{@account_sid}/SIP/Domains/#{@domain_sid}/CredentialListMappings/#{@sid}.json"
                instance_id_key 'sid'
              end
            end
          end
        end
      end
    end
  end
end