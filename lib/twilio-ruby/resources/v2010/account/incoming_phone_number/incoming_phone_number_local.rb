module Twilio
  module Resources
    module V2010
      class AccountInstance
        class IncomingPhoneNumberList
          class IncomingPhoneNumberLocalList < ListResource
            can :list, :create
            command_alias :incoming_phone_number_locals
            
            def initialize(client, inheritance={})
              super
              path "/Accounts/#{@account_sid}/IncomingPhoneNumbers/Local.json"
              instance_id_key 'sid'
              instance_class IncomingPhoneNumberLocalInstance
            end
          end
        
          class IncomingPhoneNumberLocalInstance < InstanceResource
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