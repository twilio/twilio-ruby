module Twilio
  module REST
    class Summary < ListResource

      ##
      # Gets this summary object.
      #
      # Overridden because GETs to /Summary
      # return an instance, not a list.
      def get(params={}, full_path=false)
        raise "Can't fetch feedback summary without a REST Client" unless @client
        response = @client.get @path, params, full_path
        path = full_path ? @path.split('.')[0] : @path
        @instance_class.new path, @client, response
      end
    end

    class SummaryInstance < InstanceResource; end
  end
end
