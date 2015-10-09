module Twilio
  module REST
    module IpMessaging
      class Services < NextGenListResource
        def initialize(path, client)
          @path, @client = path, client
          @submodule = :IpMessaging
        end
      end

      class Service < InstanceResource
        def initialize(path, client, params={})
          super
          @submodule = :IpMessaging
          resource :channels,
                   :users,
                   :roles
        end
      end
    end
  end
end
