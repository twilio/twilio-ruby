module Twilio
  module Resources
    module V2010
      class AccountInstance
        class IncomingPhoneNumberList
          class MobileList < ListResource
            can :list, :create
            command_alias :mobile
            
            def initialize(client, inheritance={})
              super
              path "/Accounts/#{@account_sid}/IncomingPhoneNumbers/Mobile.json"
              instance_id_key 'sid'
              instance_class MobileInstance
              list_key 'incoming_phone_numbers'
            end
          end
        
          class MobileInstance < InstanceResource
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