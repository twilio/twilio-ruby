module Twilio
  module REST
    class OutgoingCallerIds < ListResource
      def add(phone_number)
        create phone_number: phone_number
      end
      alias :verify :add

      ##
      # Override ListResource#create to instantiate the proper instance class.
      # This doesn't actually matter since all properties are lazily loaded into
      # whatever object is instantiated. But it might matter in the future.
      def create(params={}) # :nodoc:
        old_instance_class = @instance_class
        @instance_class = Twilio::REST::PhoneNumberVerificationRequest
        verification_request = super
        @instance_class = old_instance_class
        verification_request
      end
    end

    class OutgoingCallerId < InstanceResource; end
    class PhoneNumberVerificationRequest < InstanceResource; end
  end
end
