module Twilio
  module REST
    module TaskRouter
      class Workflows < Twilio::REST::NextGenListResource; end

      class Workflow < InstanceResource
        include Twilio::REST::TaskRouter::Statistics
      end
    end
  end
end
