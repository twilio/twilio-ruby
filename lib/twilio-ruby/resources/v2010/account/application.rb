module Twilio
  module Resources
    module V2010
      class AccountInstance < Twilio::REST::InstanceResource
        class ApplicationList < Twilio::REST::ListResource
          can :list, :get, :create
          command_alias :applications
          
          def initialize(client, inheritance={})
            super
            path "/Accounts/#{@account_sid}/Applications.json"
            instance_id_key 'sid'
            instance_class ApplicationInstance
            list_key 'applications'
          end
        end
      
        class ApplicationInstance < Twilio::REST::InstanceResource
          can :update, :delete
          
          def initialize(client, inheritance={}, params={})
            super
            path "/Accounts/#{@account_sid}/Applications/#{@sid}.json"
            instance_id_key 'sid'
          end
        end
      end
    end
  end
end