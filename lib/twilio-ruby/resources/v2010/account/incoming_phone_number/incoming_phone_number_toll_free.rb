module Twilio
  module Resources
    module V2010
      class AccountInstance
        class IncomingPhoneNumberList
          class IncomingPhoneNumberTollFreeList < ListResource
            can :list, :create
            command_alias :incoming_phone_number_toll_frees
            
            def initialize(client, inheritance={})
              super
              path "/Accounts/#{@account_sid}/IncomingPhoneNumbers/TollFree.json"
              instance_id_key 'sid'
              instance_class IncomingPhoneNumberTollFreeInstance
            end
          end
        
          class IncomingPhoneNumberTollFreeInstance < InstanceResource
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