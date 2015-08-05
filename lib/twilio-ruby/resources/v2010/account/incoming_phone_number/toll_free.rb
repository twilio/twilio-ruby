module Twilio
  module Resources
    module V2010
      class AccountInstance
        class IncomingPhoneNumberList
          class TollFreeList < ListResource
            can :list, :create
            command_alias :toll_free
            
            def initialize(client, inheritance={})
              super
              path "/Accounts/#{@account_sid}/IncomingPhoneNumbers/TollFree.json"
              instance_id_key 'sid'
              instance_class TollFreeInstance
              list_key 'incoming_phone_numbers'
            end
          end
        
          class TollFreeInstance < InstanceResource
            def initialize(client, inheritance={}, params={})
              super
              instance_id_key 'sid'
            end
          end
        end
      end
    end
  end
end