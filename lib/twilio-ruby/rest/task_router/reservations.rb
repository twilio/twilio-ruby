module Twilio
  module REST
    module TaskRouter
      class Reservations < Twilio::REST::NextGenListResource; end
      class Reservation < InstanceResource; end
    end
  end
end
