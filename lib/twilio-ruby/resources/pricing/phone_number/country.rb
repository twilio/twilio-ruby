module Twilio
  module Resources
    module Pricing
      class PhoneNumberInstance < Twilio::REST::InstanceResource
        class CountryList < Twilio::REST::ListResource
          can :list, :get
          command_alias :countries
          
          def initialize(client, inheritance={})
            super
            path "/PhoneNumbers/Countries"
            instance_id_key 'iso_country'
            instance_class CountryInstance
            list_key 'countries'
          end
        end
      
        class CountryInstance < Twilio::REST::InstanceResource
          def initialize(client, inheritance={}, params={})
            super
            path "/PhoneNumbers/Countries/#{@iso_country}"
            instance_id_key 'iso_country'
          end
        end
      end
    end
  end
end