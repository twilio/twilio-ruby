module Twilio
  module REST
    class Feedback < ListResource
      def get
        @instance_class.new @path, @client
      end

      def create(params={})
        raise "Can't create feedback without a REST Client" unless @client
        response = @client.post @path, params
        @instance_class.new @path, @client, response
      end
    end

    class FeedbackInstance < InstanceResource; end
  end
end
