module Twilio
  module Resources
    module Pricing
      class VoiceList < Twilio::REST::ListResource
        class NumberList < Twilio::REST::ListResource
          can :get
          command_alias :numbers
          
          def initialize(client, inheritance={})
            super
            path "/Voice/Numbers/#{@number}"
            instance_id_key 'number'
            instance_class NumberInstance
          end
        end
      
        class NumberInstance < Twilio::REST::InstanceResource
          def initialize(client, inheritance={}, params={}, query_params={})
            super
            path "/Voice/Numbers/#{@number}"
            instance_id_key 'number'
          end
        end
      end
    end
  end
end