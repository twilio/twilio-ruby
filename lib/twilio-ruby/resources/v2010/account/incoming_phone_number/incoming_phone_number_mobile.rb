module Twilio
  module Resources
    module V2010
      class AccountInstance
        class IncomingPhoneNumberList
          class IncomingPhoneNumberMobileList < ListResource
            can :list, :create
            command_alias :incoming_phone_number_mobiles
            
            def initialize(client, inheritance={})
              super
              path "/Accounts/#{@account_sid}/IncomingPhoneNumbers/Mobile.json"
              instance_id_key 'sid'
              instance_class IncomingPhoneNumberMobileInstance
            end
          end
        
          class IncomingPhoneNumberMobileInstance < InstanceResource
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