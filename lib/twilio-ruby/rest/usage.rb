module Twilio
  module REST
    class Usage < ListResource
      def initialize(path, client)
        super
        components :records,
                   :triggers
      end

      def records
        record_list
      end
    end
  end
end
