module Twilio
  module Resources
    module Conversations
      class ConversationList
        class InProgressList < ListResource
          can :list
          command_alias :in_progresses
          
          def initialize(client, inheritance={})
            super
            path "/Conversations/InProgress.json"
            instance_id_key 'sid'
            instance_class InProgressInstance
          end
        end
      
        class InProgressInstance < InstanceResource
          def initialize(client, inheritance={}, params={})
            super
            path "/Conversations/#{@sid}.json"
            instance_id_key 'sid'
            dependent Twilio::Resources::Conversations::ConversationInstance::ParticipantList, {
              conversation_sid: @sid
            }
          end
        end
      end
    end
  end
end