module Twilio
  module Resources
    module Pricing
      class VoiceList
        class CountryList < ListResource
          can :list, :get
          command_alias :countries
          
          def initialize(client, inheritance={})
            super
            path "/Voice/Countries"
            instance_id_key 'iso_country'
            instance_class CountryInstance
          end
        end
      
        class CountryInstance < InstanceResource
          def initialize(client, inheritance={}, params={})
            super
            path "/Voice/Countries/#{@iso_country}"
            instance_id_key 'iso_country'
          end
        end
      end
    end
  end
end