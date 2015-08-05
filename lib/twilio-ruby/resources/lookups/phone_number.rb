module Twilio
  module Resources
    module Lookups
      class PhoneNumberList < ListResource
        can :get
        command_alias :phone_numbers
        
        def initialize(client, inheritance={})
          super
          instance_id_key 'sid'
          instance_class PhoneNumberInstance
        end
      end
    
      class PhoneNumberInstance < InstanceResource
        def initialize(client, inheritance={}, params={})
          super
          path "PhoneNumbers/#{@phone_number}"
          instance_id_key 'sid'
        end
      end
    end
  end
end