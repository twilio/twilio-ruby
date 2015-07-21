module Twilio
  module REST
    class Usage < ListResource
      def initialize(path, client)
        @path, @client = path, client
        resource :records,
                 :triggers
      end
    end
  end
end
