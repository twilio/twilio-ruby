module Twilio
  module REST
    module TaskRouter
      class Workers < Twilio::REST::NextGenListResource; end
      class Worker < InstanceResource; end
    end
  end
end
