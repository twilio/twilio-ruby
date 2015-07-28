module Twilio
  module REST
    module Pricing
      class PhoneNumbers < NextGenListResource
        def initialize(path, client, params={})
          super
          @submodule = :Pricing
          resource :countries
        end
      end
    end
  end
end
