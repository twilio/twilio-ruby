module Twilio
  module REST
    class AvailablePhoneNumbers < ListResource
      def initialize(path, client)
        @path, @client = path, client
        @instance_class = Twilio::REST::Country
        @list_key, @instance_id_key = 'countries', 'country_code'
      end
    end

    class AvailablePhoneNumber < InstanceResource; end
  end
end
