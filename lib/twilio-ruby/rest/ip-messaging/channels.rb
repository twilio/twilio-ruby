module Twilio
  module REST
    module IpMessaging
      class Channels < NextGenListResource; end
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
