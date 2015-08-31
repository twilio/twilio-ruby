module Twilio
  module Resources
    module Lookups
      class PhoneNumberList < Twilio::REST::ListResource
        can :get
        command_alias :phone_numbers
        
        def initialize(client, inheritance={})
          super
          path "/PhoneNumbers/#{@phone_number}.json"
          instance_id_key 'phone_number'
          instance_class PhoneNumberInstance
        end
      end
    
      class PhoneNumberInstance < Twilio::REST::InstanceResource
        def initialize(client, inheritance={}, params={}, query_params={})
          super
          path "/PhoneNumbers/#{@phone_number}.json"
          instance_id_key 'phone_number'
        end
      end
    end
  end
end