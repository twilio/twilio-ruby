module Twilio
  module REST
    module Wds
      class Tasks < ListResource; end

      class Task < InstanceResource
        def initialize(path, client, params={})
          super path, client, params
          @submodule = :Wds
          resource :reservations
        end
      end
    end
  end
end
