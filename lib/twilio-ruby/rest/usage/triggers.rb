module Twilio
  module REST
    class Triggers < ListResource
      def initialize(uri, client)
        super
        @list_key = 'usage_triggers'
      end
    end

    class Trigger < InstanceResource; end
  end
end
