module Twilio
  module Resources
    module Conversations
      class ConversationList < Twilio::REST::ListResource
        class CompletedList < Twilio::REST::ListResource
          can :list
          command_alias :completed
          
          def initialize(client, inheritance={})
            super
            path "/Conversations/Completed.json"
            instance_id_key 'sid'
            instance_class CompletedInstance
            list_key 'conversations'
          end
        end
      
        class CompletedInstance < Twilio::REST::InstanceResource
          def initialize(client, inheritance={}, params={})
            super
            path "/Conversations/#{@sid}.json"
            instance_id_key 'sid'
            dependent Twilio::Resources::Conversations::ConversationInstance::ParticipantList, {}
          end
        end
      end
    end
  end
end