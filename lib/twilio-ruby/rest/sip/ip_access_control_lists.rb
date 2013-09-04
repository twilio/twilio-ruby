module Twilio
  module REST
    class IpAccessControlLists < ListResource; end
    class IpAccessControlList < InstanceResource
      def initialize(path, client, params={})
        super
        resource :ip_addresses
      end
    end
  end
end
