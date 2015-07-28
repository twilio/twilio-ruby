module Twilio
  module REST
    class AuthorizedConnectApps < ListResource
      def initialize(path, client)
        super
        @instance_id_key = 'connect_app_sid'
      end
    end

    class AuthorizedConnectApp < InstanceResource; end
  end
end
