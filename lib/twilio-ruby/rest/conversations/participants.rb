module Twilio
  module REST
    class Conversation
      class Participants < ListResource
        can :list, :get, :create

        def initialize(client, inheritance={})
          super
          path "/Conversations/#{@conversation_sid}/Participants.json"
        end
      end
      class Participant < InstanceResource
        can :update, :delete
        
        def initialize(client, inheritance={}, params={})
          super
          path "/Conversations/#{@conversation_sid}/Participants/#{@sid}.json"
        end
      end
    end
  end
end
