module Twilio
  module REST
    module TaskRouter
      class Workers < Twilio::REST::NextGenListResource
        include Twilio::REST::TaskRouter::Statistics
      end

      class Worker < InstanceResource
        include Twilio::REST::TaskRouter::Statistics

        def initialize(path, client, params={})
          super path, client, params
          @submodule = :TaskRouter
          resource :reservations
        end
      end
    end
  end
end
