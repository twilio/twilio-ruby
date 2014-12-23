module Twilio
  module REST
    module Pricing
      class PhoneNumbers < InstanceResource

        def initialize(path, client, params={})
          super
          @submodule = :Pricing
          resource :countries
        end
      end
    end
  end
end
