module Twilio
  module REST
    class AvailablePhoneNumbers < ListResource
      def initialize(uri, client)
        @resource_name = 'countries'
        @instance_class = Twilio::REST.const_get 'Country'
        @uri, @client = uri, client
      end
    end

    class AvailablePhoneNumber < InstanceResource; end
  end
end
