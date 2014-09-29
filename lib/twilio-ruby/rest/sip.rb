module Twilio
  module REST
    class Sip < InstanceResource
      def initialize(path, client, params={})
        super
        resource :domains, :ip_access_control_lists, :credential_lists
      end
    end
  end
end
