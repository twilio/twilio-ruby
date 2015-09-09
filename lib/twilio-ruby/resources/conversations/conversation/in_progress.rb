module Twilio
  module Resources
    module Conversations
      class ConversationList < Twilio::REST::ListResource
        class InProgressList < Twilio::REST::ListResource
          can :list
          command_alias :in_progress
          
          def initialize(client, inheritance={})
            super
            path "/Conversations/InProgress"
            instance_id_key 'sid'
            instance_class InProgressInstance
            list_key 'conversations'
          end
        end
      
        class InProgressInstance < Twilio::REST::InstanceResource
          def initialize(client, inheritance={}, params={}, query_params={})
            super
            path "/Conversations/#{@sid}"
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