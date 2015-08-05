module Twilio
  module Resources
    module V2010
      class AccountInstance < Twilio::REST::InstanceResource
        class OutgoingCallerIdList < Twilio::REST::ListResource
          can :list, :get, :create
          command_alias :outgoing_caller_ids
          
          def initialize(client, inheritance={})
            super
            path "/Accounts/#{@account_sid}/OutgoingCallerIds.json"
            instance_id_key 'sid'
            instance_class OutgoingCallerIdInstance
            list_key 'outgoing_caller_ids'
          end
          
          def add(phone_number)
            create phone_number: phone_number
          end
          
          def verify(phone_number)
            create phone_number: phone_number
          end
        end
      
        class OutgoingCallerIdInstance < Twilio::REST::InstanceResource
          can :update, :delete
          
          def initialize(client, inheritance={}, params={})
            super
            path "/Accounts/#{@account_sid}/OutgoingCallerIds/#{@sid}.json"
            instance_id_key 'sid'
          end
        end
      end
    end
  end
end