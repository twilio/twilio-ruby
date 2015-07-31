module Twilio
  module REST
    class Conversations < ListResource
      def initialize(client, inheritance={})
        super
        components self.class::InProgress,
                   self.class::Completed
        instance_class Conversation
      end
    end

    class Conversation < InstanceResource
      can :update, :delete

      def initialize(client, inheritance={}, params={})
        super
        path "/Conversations/#{@sid}.json"
        dependents self.class::Participants
      end
    end
  end
end
