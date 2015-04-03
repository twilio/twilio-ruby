module Twilio
  module REST
    module TaskRouter
      class TaskQueues < Twilio::REST::NextGenListResource
        def statistics(args={})
          path = "#{@path}/Statistics"
          stats = Twilio::REST::TaskRouter::TaskQueuesStatistics.new path, @client
          stats.list args, true
        end
      end

      class TaskQueue < InstanceResource
        include Statistics
      end
    end
  end
end
