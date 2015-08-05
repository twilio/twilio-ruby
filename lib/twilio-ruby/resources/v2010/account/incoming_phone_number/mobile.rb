module Twilio
  module Resources
    module V2010
      class AccountInstance < Twilio::REST::InstanceResource
        class IncomingPhoneNumberList < Twilio::REST::ListResource
          class MobileList < Twilio::REST::ListResource
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
        
          class MobileInstance < Twilio::REST::InstanceResource
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