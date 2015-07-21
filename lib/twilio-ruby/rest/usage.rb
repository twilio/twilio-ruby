module Twilio
  module REST
    class Usage < ListResource
      def initialize(path, client)
        @path, @client = path, client
        resource :record_list,
                 :triggers
      end

      def records
        record_list
      end
    end
  end
end
