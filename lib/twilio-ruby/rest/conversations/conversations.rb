module Twilio
  module REST
    class Conversations < ListResource
      def initialize(client, inheritance={})
        super
        components :in_progress,
                   :completed
      end
    end

    class Conversation < InstanceResource
      can :update, :delete

      def initialize(client, inheritance={}, params={})
        super
        path "/Conversations/#{@sid}.json"
        dependents :participants
      end
    end
  end
end
