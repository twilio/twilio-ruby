module Twilio
  module Resources
    module V2010
      class AccountInstance < Twilio::REST::InstanceResource
        class SipList < Twilio::REST::ListResource
          command_alias :sip
          
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
      
        class SipInstance < Twilio::REST::InstanceResource
          def initialize(client, inheritance={}, params={})
            super
            instance_id_key 'sid'
          end
        end
      end
    end
  end
end