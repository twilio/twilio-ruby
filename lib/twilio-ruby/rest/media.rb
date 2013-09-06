module Twilio
  module REST
    class Media < ListResource

      def initialize(path, client)
        super
        @list_key = 'media'
      end

    end

    class MediaInstance < InstanceResource; end
  end
end
