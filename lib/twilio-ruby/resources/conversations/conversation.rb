module Twilio
  module Resources
    module Conversations
      class ConversationList < Twilio::REST::ListResource
        can :get
        command_alias :conversations
        
        def initialize(client, inheritance={})
          super
          path "/Conversations/#{@sid}.json"
          instance_id_key 'sid'
          instance_class ConversationInstance
          components Twilio::Resources::Conversations::ConversationList::InProgressList,
                     Twilio::Resources::Conversations::ConversationList::CompletedList
        end
      end
    
      class ConversationInstance < Twilio::REST::InstanceResource
        def initialize(client, inheritance={}, params={}, query_params={})
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