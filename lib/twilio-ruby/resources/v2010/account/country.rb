module Twilio
  module Resources
    module V2010
      class AccountInstance
        class CountryList < ListResource
          can :list, :get
          command_alias :countries
          
          def initialize(client, inheritance={})
            super
            path "/Accounts/#{@account_sid}/AvailablePhoneNumbers.json"
            instance_id_key 'country_code'
            instance_class CountryInstance
          end
        end
      
        class CountryInstance < InstanceResource
          def initialize(client, inheritance={}, params={})
            super
            path "/Accounts/#{@account_sid}/AvailablePhoneNumbers/#{@country_code}.json"
            instance_id_key 'country_code'
            dependent Twilio::Resources::V2010::AccountInstance::CountryInstance::AvailablePhoneNumberList, {
              account_sid: @account_sid,
              country_code: @country_code
            }
            dependent Twilio::Resources::V2010::AccountInstance::CountryInstance::AvailablePhoneNumberList, {
              account_sid: @account_sid,
              country_code: @country_code
            }
            dependent Twilio::Resources::V2010::AccountInstance::CountryInstance::AvailablePhoneNumberList, {
              account_sid: @account_sid,
              country_code: @country_code
            }
          end
        end
      end
    end
  end
end