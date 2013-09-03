module Twilio
  module REST
    class Domains < ListResource; end
    class Domain < InstanceResource
      def initialize(path, client, params={})
        super
        resource :ip_access_control_list_mappings,
            :credential_list_mappings
      end
    end
  end
end
