module Twilio
  module REST
    module Pricing
      class Numbers < NextGenListResource
        def initialize(path, client)
          super
          @submodule = :Pricing
        end
      end

      class Number < InstanceResource
        def initialize(path, client)
          super
          @submodule = :Pricing
        end
      end
    end
  end
end
