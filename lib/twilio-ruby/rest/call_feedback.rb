module Twilio
  module REST
      class Feedback < ListResource;
        def get(params={}, full_path=false)
          raise "Can't fetch feedback without a REST Client" unless @client
          response = @client.get @path, params, full_path
          path = full_path ? @path.split('.')[0] : @path
          @instance_class.new path, @client, response
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
