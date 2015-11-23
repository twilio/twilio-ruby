module Twilio
  module REST
    module IpMessaging
      class Channels < NextGenListResource; end
      class Channel < InstanceResource
        def initialize(path, client, params={})
          super
          resource :messages,
                   :members
        end
      end
    end
  end
end
