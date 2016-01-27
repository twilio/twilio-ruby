module Twilio
  module REST
    module IpMessaging
      class Credentials < NextGenListResource
        def initialize(path, client)
          @path, @client = path, client
          @submodule = :IpMessaging
        end
      end

      class Credential < InstanceResource
        def initialize(path, client, params={})
          super
          @submodule = :IpMessaging
        end
      end
    end
  end
end
