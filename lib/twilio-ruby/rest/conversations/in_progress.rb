module Twilio
  module REST
    module Conversations
      class InProgress < NextGenListResource
        def initialize(path, client)
          @path, @client = path, client
          @instance_class = Twilio::REST::Conversations::Conversation
          @instance_id_key = 'sid'
        end
      end
    end
  end
end
