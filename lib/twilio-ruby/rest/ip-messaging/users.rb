module Twilio
  module REST
    module IpMessaging
      class Users < NextGenListResource; end
      class User < InstanceResource
        def initialize(path, client, params={})
          super
          @submodule = :IpMessaging
          resource :channels
        end
      end
    end
  end
end
