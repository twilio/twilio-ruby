module Twilio
  module Resources
    module Pricing
      class VoiceList < Twilio::REST::ListResource
        can :get
        command_alias :voice
        
        def initialize(client, inheritance={})
          super
          path "/Voice.json"
          instance_id_key 'sid'
          instance_class VoiceInstance
          components Twilio::Resources::Pricing::VoiceList::NumberList,
                     Twilio::Resources::Pricing::VoiceList::CountryList
        end
      end
    
      class VoiceInstance < Twilio::REST::InstanceResource
        def initialize(client, inheritance={}, params={}, query_params={})
          super
          instance_id_key 'sid'
        end
      end
    end
  end
end