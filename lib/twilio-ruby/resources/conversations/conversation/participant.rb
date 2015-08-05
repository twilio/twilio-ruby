module Twilio
  module Resources
    module Conversations
      class ConversationInstance
        class ParticipantList < ListResource
          can :list, :get, :create
          command_alias :participants
          
          def initialize(client, inheritance={})
            super
            path "/Conversations/#{@conversation_sid}/Participants.json"
            instance_id_key 'sid'
            instance_class ParticipantInstance
            list_key 'participants'
          end
        end
      
        class ParticipantInstance < InstanceResource
          def initialize(client, inheritance={}, params={})
            super
            path "/Conversations/#{@conversation_sid}/Participants/#{@sid}.json"
            instance_id_key 'sid'
          end
        end
      end
    end
  end
end