module Twilio
  module REST
    module Pricing
      class Voice < NextGenListResource
        def initialize(path, client, params={})
          super
          @submodule = :Pricing
          resource :countries, :numbers
        end
      end
    end
  end
end
