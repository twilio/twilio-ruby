module Twilio
  module REST
    module IpMessaging
      class Services < NextGenListResource
        def initialize(path, client)
          @submodule = :IpMessaging
          super
        end
      end

      class Service < InstanceResource
        def initialize(path, client, params={})
          super

          resource :channels,
                   :users,
                   :roles
        end
      end
    end
  end
end
