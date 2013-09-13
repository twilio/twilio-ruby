module Twilio
  module REST
    class Media < ListResource

      def initialize(path, client)
        super
        @list_key = 'media_list'
      end

    end

    class MediaInstance < InstanceResource; end
  end
end
