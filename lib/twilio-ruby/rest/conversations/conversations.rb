module Twilio
  module REST
    module Conversations

      class InProgressConversations < NextGenListResource
        def initialize(path, client)
          super
          @path = "#{path}/InProgress"
          @list_key = "conversations"
        end
      end

      class CompletedConversations < NextGenListResource
        def initialize(path, client)
          super
          @path = "#{path}/Completed"
          @list_key = "conversations"
        end
      end

      class Conversations < NextGenListResource
        def initialize(path, client)
          super
          @in_progress = InProgressConversations.new path, self
          @completed = CompletedConversations.new path, self
        end
      end

      class Conversation < InstanceResource
        def initialize(path, client, params={})
          #path.gsub! '/InProgress', ''
          #path.gsub! '/Completed', ''
          super path, client, params
          @submodule = :Conversations
          resource :participants
        end
      end

    end
  end
end
