module Twilio
  module Resources
    module V2010
      class AccountInstance
        class AvailablePhoneNumberCountryList < ListResource
          can :list, :get
          command_alias :available_phone_numbers
          
          def initialize(client, inheritance={})
            super
            path "/Accounts/#{@account_sid}/AvailablePhoneNumbers.json"
            instance_id_key 'country_code'
            instance_class AvailablePhoneNumberCountryInstance
            list_key 'countries'
          end
        end
      
        class AvailablePhoneNumberCountryInstance < InstanceResource
          def initialize(client, inheritance={}, params={})
            super
            path "/Accounts/#{@account_sid}/AvailablePhoneNumbers/#{@country_code}.json"
            instance_id_key 'country_code'
            dependent Twilio::Resources::V2010::AccountInstance::AvailablePhoneNumberCountryInstance::LocalList, {
              account_sid: @account_sid,
              country_code: @country_code
            }
            dependent Twilio::Resources::V2010::AccountInstance::AvailablePhoneNumberCountryInstance::TollFreeList, {
              account_sid: @account_sid,
              country_code: @country_code
            }
            dependent Twilio::Resources::V2010::AccountInstance::AvailablePhoneNumberCountryInstance::MobileList, {
              account_sid: @account_sid,
              country_code: @country_code
            }
          end
        end
      end
    end
  end
end