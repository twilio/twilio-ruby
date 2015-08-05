module Twilio
  module Resources
    module Pricing
      class VoiceList < ListResource
        can :get
        command_alias :voice
        
        def initialize(client, inheritance={})
          super
          path "/Voice"
          instance_id_key 'sid'
          instance_class VoiceInstance
          components Twilio::Resources::Pricing::VoiceList::NumberList,
                     Twilio::Resources::Pricing::VoiceList::CountryList
        end
      end
    
      class VoiceInstance < InstanceResource
        def initialize(client, inheritance={}, params={})
          super
          instance_id_key 'sid'
        end
      end
    end
  end
end