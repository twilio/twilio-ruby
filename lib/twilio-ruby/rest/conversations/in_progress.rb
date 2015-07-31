module Twilio
  module REST
    class Conversations
      class InProgress < ListResource
        can :list, :get

        def initialize(client, inheritance={})
          super
          path "/Conversations/InProgress.json"
          instance_class InProgressInstance
          instance_id_key 'sid'
        end
      end

      class InProgressInstance < InstanceResource
        def initialize(client, inheritance={}, params={})
          super
          path "/Conversations/#{@sid}"
          dependents Participants
        end
      end
    end
  end
end
