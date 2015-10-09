module Twilio
  module REST
    module IpMessaging
      class Channels < NextGenListResource
        def initialize(path, client)
          @path, client = path, client
          @submodule = :IpMessaging
        end
      end
      class Channel < InstanceResource
        def initialize(path, client, params={})
          super
          @submodule = :IpMessaging

          resource :messages,
                   :members
        end
      end
    end
  end
end
