module Twilio
  module REST
    class AvailablePhoneNumbers < ListResource
      def initialize(path, client)
        super
        @instance_class = Twilio::REST::Country
        @list_key = 'countries'
        @instance_id_key = 'country_code'
      end
    end

    class AvailablePhoneNumber < InstanceResource; end
  end
end
