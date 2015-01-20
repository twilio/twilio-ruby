module Twilio
  module REST
    class Addresses < ListResource; end

    class Address < InstanceResource
      def initialize(path, client, params={})
        super path, client, params
        resource :dependent_phone_numbers
      end
    end
  end
end
