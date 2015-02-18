module Twilio
  module REST
    module TaskRouter
      class Tasks < Twilio::REST::NextGenListResource; end

      class Task < InstanceResource
        def initialize(path, client, params={})
          super path, client, params
          @submodule = :TaskRouter
          resource :reservations
        end
      end
    end
  end
end
