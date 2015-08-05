module Twilio
  module Resources
    module V2010
      class AccountInstance
        class SipList < ListResource
          command_alias :sips
          
          def initialize(client, inheritance={})
            super
            path "/Accounts/#{@account_sid}/SIP.json"
            instance_id_key 'sid'
            instance_class SipInstance
            components Twilio::Resources::V2010::AccountInstance::SipList::DomainList,
                       Twilio::Resources::V2010::AccountInstance::SipList::IpAccessControlListList,
                       Twilio::Resources::V2010::AccountInstance::SipList::CredentialListList
          end
        end
      
        class SipInstance < InstanceResource
          def initialize(client, inheritance={}, params={})
            super
            instance_id_key 'sid'
          end
        end
      end
    end
  end
end