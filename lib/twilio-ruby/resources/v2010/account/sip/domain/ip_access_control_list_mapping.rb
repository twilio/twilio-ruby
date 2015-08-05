module Twilio
  module Resources
    module V2010
      class AccountInstance
        class SipList
          class DomainInstance
            class IpAccessControlListMappingList < ListResource
              can :list, :create
              command_alias :ip_access_control_list_mappings
              
              def initialize(client, inheritance={})
                super
                path "/Accounts/#{@account_sid}/SIP/Domains/#{@domain_sid}/IpAccessControlListMappings.json"
                instance_id_key 'sid'
                instance_class IpAccessControlListMappingInstance
                list_key 'ip_access_control_list_mappings'
              end
            end
          
            class IpAccessControlListMappingInstance < InstanceResource
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