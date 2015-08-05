module Twilio
  module Resources
    module V2010
      class AccountInstance
        class IncomingPhoneNumberList
          class LocalList < ListResource
            can :list, :create
            command_alias :local
            
            def initialize(client, inheritance={})
              super
              path "/Accounts/#{@account_sid}/IncomingPhoneNumbers/Local.json"
              instance_id_key 'sid'
              instance_class LocalInstance
              list_key 'incoming_phone_numbers'
            end
          end
        
          class LocalInstance < InstanceResource
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