module Twilio
  module Resources
    module Pricing
      class VoiceList
        class NumberList < ListResource
          can :get
          command_alias :numbers
          
          def initialize(client, inheritance={})
            super
            instance_id_key 'number'
            instance_class NumberInstance
          end
        end
      
        class NumberInstance < InstanceResource
          def initialize(client, inheritance={}, params={})
            super
            path "/Voice/Numbers/#{@number}"
            instance_id_key 'number'
          end
        end
      end
    end
  end
end