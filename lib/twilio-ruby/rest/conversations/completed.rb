module Twilio
  module REST
    class Conversations
      class Completed < ListResource
        can :list, :get

        def initialize(client, inheritance={})
          super
          path "/Conversations/Completed.json"
          instance_id_key 'sid'
        end
      end
    end
  end
end
