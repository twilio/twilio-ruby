module Twilio
  module REST
    class Feedback < ListResource;
      ##
      # Get this feedback object.
      #
      # Overridden because GETS to /Feedback
      # returns an instance, not a list.
      def get
        @instance_class.new @path, @client
      end

      ##
      # Creates a new Feedback object.
      def create(params={})
        raise "Can't create feedback without a REST Client" unless @client
        response = @client.post @path, params
        @instance_class.new @path, @client, response
      end
    end

    class FeedbackInstance < InstanceResource; end
  end
end
