module Twilio
  module REST
    module TaskRouter
      class TaskQueues < Twilio::REST::NextGenListResource; end
      class TaskQueue < InstanceResource; end
    end
  end
end
