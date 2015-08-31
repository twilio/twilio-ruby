module Twilio
  module Resources
    module V2010
      class AccountInstance < Twilio::REST::InstanceResource
        class TokenList < Twilio::REST::ListResource
          can :create
          command_alias :tokens
          
          def initialize(client, inheritance={})
            super
            path "/Accounts/#{@account_sid}/Tokens.json"
            instance_id_key 'sid'
            instance_class TokenInstance
          end
        end
      
        class TokenInstance < Twilio::REST::InstanceResource
          def initialize(client, inheritance={}, params={}, query_params={})
            super
            instance_id_key 'sid'
          end
        end
      end
    end
  end
end