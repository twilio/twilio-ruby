module Twilio
  module REST
    class ListResource
      include Utils

      def initialize(uri, client)
        @resource_name = self.class.name.split('::')[-1]
        @instance_class = Twilio::REST.const_get @resource_name.chop
        @uri, @client = uri, client
      end
    
      # Grab a list of this kind of resource and return it as an array.
      def list(params = {})
        raise "Can't get a resource list without a REST Client" unless @client
        response = @client.get @uri, params
        resources = response[detwilify(@resource_name)]
        resources.map do |resource|
          @instance_class.new "#{@uri}/#{resource['sid']}", @client, resource
        end
      end

      # Return an empty instance resource object with the proper URI.
      def get(sid)
        @instance_class.new "#{@uri}/#{sid}", @client
      end
    
      # Return a newly created resource.
      def create(params = {})
        raise "Can't create a resource without a REST Client" unless @client
        response = @client.post @uri, params
        @instance_class.new "#{@uri}/#{response['sid']}", @client, response
      end
    end
  end
end
