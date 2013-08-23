module Twilio
  module REST
    class Media < ListResource

      SUBRESOURCES = [:images]

      def initialize(path, client)
        super
        @list_key = 'media'
      end

      def method_missing(method, *args)
        super unless SUBRESOURCES.include? method
        self.class.new "#{@path}/#{twilify(method)}", @client
      end
    end

    class MediaInstance < InstanceResource; end
  end
end
