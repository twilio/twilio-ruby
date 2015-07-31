module Twilio
  module REST
    class Conversations
      class Completed < ListResource
        can :list, :get

        def initialize(client, inheritance={})
          super
          path "/Conversations/Completed.json"
          instance_class CompletedInstance
          instance_id_key 'sid'
        end
      end

      class CompletedInstance < InstanceResource
        def initialize(client, inheritance={}, params={})
          super
          path "/Conversations/#{@sid}"
          dependents Participants
        end
      end
    end
  end
end
