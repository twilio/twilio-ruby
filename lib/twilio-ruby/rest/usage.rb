module Twilio
  module REST
    class Usage < ListResource
      def initialize(path, client)
        super
        resource :records,
                 :triggers
      end
    end
  end
end
