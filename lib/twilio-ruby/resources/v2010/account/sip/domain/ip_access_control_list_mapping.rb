module Twilio
  module Resources
    module V2010
      class AccountInstance < Twilio::REST::InstanceResource
        class SipList < Twilio::REST::ListResource
          class DomainInstance < Twilio::REST::InstanceResource
            class IpAccessControlListMappingList < Twilio::REST::ListResource
              can :list, :get, :create
              command_alias :ip_access_control_list_mappings
              
              def initialize(client, inheritance={})
                super
                path "/Accounts/#{@account_sid}/SIP/Domains/#{@domain_sid}/IpAccessControlListMappings.json"
                instance_id_key 'sid'
                instance_class IpAccessControlListMappingInstance
                list_key 'ip_access_control_list_mappings'
              end
            end
          
            class IpAccessControlListMappingInstance < Twilio::REST::InstanceResource
              can :delete
              
              def initialize(client, inheritance={}, params={})
                super
                path "/Accounts/#{@account_sid}/SIP/Domains/#{@domain_sid}/IpAccessControlListMappings/#{@sid}.json"
                instance_id_key 'sid'
              end
            end
          end
        end
      end
    end
  end
end