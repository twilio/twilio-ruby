module Twilio
  module Resources
    module V2010
      class AccountInstance
        class SipList
          class IpAccessControlListList < ListResource
            can :list, :get, :create
            command_alias :ip_access_control_lists
            
            def initialize(client, inheritance={})
              super
              path "/Accounts/#{@account_sid}/SIP/IpAccessControlLists.json"
              instance_id_key 'sid'
              instance_class IpAccessControlListInstance
              list_key 'ip_access_control_lists'
            end
          end
        
          class IpAccessControlListInstance < InstanceResource
            can :update, :delete
            
            def initialize(client, inheritance={}, params={})
              super
              path "/Accounts/#{@account_sid}/SIP/IpAccessControlLists/#{@sid}.json"
              instance_id_key 'sid'
              dependent Twilio::Resources::V2010::AccountInstance::SipList::IpAccessControlListInstance::IpAddressList, {
                account_sid: @account_sid,
                ip_access_control_list_sid: @sid
              }
            end
          end
        end
      end
    end
  end
end