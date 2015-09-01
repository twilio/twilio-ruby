module Twilio
  module Resources
    module Pricing
      class VoiceList < Twilio::REST::ListResource
        class CountryList < Twilio::REST::ListResource
          can :list, :get
          command_alias :countries
          
          def initialize(client, inheritance={})
            super
            path "/Voice/Countries.json"
            instance_id_key 'iso_country'
            instance_class CountryInstance
            list_key 'countries'
          end
        end
      
        class CountryInstance < Twilio::REST::InstanceResource
          def initialize(client, inheritance={}, params={}, query_params={})
            super
            path "/Voice/Countries/#{@iso_country}.json"
            instance_id_key 'iso_country'
          end
        end
      end
    end
  end
end