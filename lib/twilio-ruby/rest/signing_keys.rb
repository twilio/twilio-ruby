module Twilio
  module REST
    class SigningKeys < ListResource;
      private :list
    end
    class SigningKey < InstanceResource; end
  end
end
