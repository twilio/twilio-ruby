module Twilio
  module Resources
    module Pricing
      class PhoneNumberList < Twilio::REST::ListResource
        can :get
        command_alias :phone_numbers
        
        def initialize(client, inheritance={})
          super
          path "/PhoneNumbers"
          instance_id_key 'sid'
          instance_class PhoneNumberInstance
          components Twilio::Resources::Pricing::PhoneNumberInstance::CountryList
        end
      end
    
      class PhoneNumberInstance < Twilio::REST::InstanceResource
        def initialize(client, inheritance={}, params={})
          super
          instance_id_key 'sid'
        end
      end
    end
  end
end