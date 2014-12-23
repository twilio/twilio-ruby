module Twilio
  module REST
    module Pricing
      class PhoneNumbers < ListResource
        def initialize(path, client)
          super
          @submodule = :Pricing
        end
      end

      class PhoneNumber < InstanceResource
        def initialize(path, client)
          super
          @submodule = :Pricing
        end
      end
    end
  end
end
