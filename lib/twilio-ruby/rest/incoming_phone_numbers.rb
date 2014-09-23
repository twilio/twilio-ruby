module Twilio
  module REST
    class IncomingPhoneNumbers < ListResource
      def initialize(path, client)
        super
        @submodule = :NumberType
        resource :mobile, :local, :toll_free
      end

      def buy(phone_number)
        create phone_number: phone_number
      end
    end

    class IncomingPhoneNumber < InstanceResource; end
  end
end
