module Twilio
  module Resources
    module V2010
      class AccountInstance
        class SipList
          class IpAccessControlListInstance
            class IpAddressList < ListResource
              can :list, :get, :create
              command_alias :ip_addresses
              
              def initialize(client, inheritance={})
                super
                path "/Accounts/#{@account_sid}/SIP/IpAccessControlLists/#{@ip_control_list_sid}/IpAddresses.json"
                instance_id_key 'sid'
                instance_class IpAddressInstance
                list_key 'ip_addresses'
              end
            end
          
            class IpAddressInstance < InstanceResource
              can :update, :delete
              
              def initialize(client, inheritance={}, params={})
                super
                path "/Accounts/#{@account_sid}/SIP/IpAccessControlLists/#{@ip_control_list_sid}/IpAddresses/#{@sid}.json"
                instance_id_key 'sid'
              end
            end
          end
        end
      end
    end
  end
end