module Twilio
  module REST
    class Conversations
      class InProgress < ListResource
        can :list, :get
        
        def initialize(client, inheritance={})
          super
          path "/Conversations/InProgress.json"
          instance_id_key 'sid'
        end
      end
    end
  end
end
