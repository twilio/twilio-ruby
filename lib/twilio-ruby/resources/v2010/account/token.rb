module Twilio
  module Resources
    module V2010
      class AccountInstance
        class TokenList < ListResource
          can :create
          command_alias :tokens
          
          def initialize(client, inheritance={})
            super
            instance_id_key 'sid'
            instance_class TokenInstance
          end
        end
      
        class TokenInstance < InstanceResource
          def initialize(client, inheritance={}, params={})
            super
            path "/Accounts/#{@account_sid}/Tokens.json"
            instance_id_key 'sid'
          end
        end
      end
    end
  end
end