module Twilio
  module Resources
    module V2010
      class AccountInstance
        class SmsList
          class ShortCodeList < ListResource
            can :list, :get
            command_alias :short_codes
            
            def initialize(client, inheritance={})
              super
              path "/Accounts/#{@account_sid}/SMS/ShortCodes"
              instance_id_key 'sid'
              instance_class ShortCodeInstance
              list_key 'short_codes'
            end
          end
        
          class ShortCodeInstance < InstanceResource
            can :update
            
            def initialize(client, inheritance={}, params={})
              super
              path "/Accounts/#{@account_sid}/SMS/ShortCodes/#{@sid}.json"
              instance_id_key 'sid'
            end
          end
        end
      end
    end
  end
end