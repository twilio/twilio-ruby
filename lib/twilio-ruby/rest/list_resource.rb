module Twilio
  module REST
    class ListResource
      include Utils

      def initialize(path, client)
        custom_names = {
          'Activities' => 'Activity',
          'Addresses' => 'Address',
          'Countries' => 'Country',
          'Feedback' => 'FeedbackInstance',
          'IpAddresses' => 'IpAddress',
          'Media' => 'MediaInstance',
        }
        @path, @client = path, client
        resource_name = self.class.name.split('::')[-1]
        instance_name = custom_names.fetch(resource_name, resource_name.chop)

        # The next line grabs the enclosing module. Necessary for resources
        # contained in their own submodule like /SMS/Messages
        parent_module = self.class.to_s.split('::')[-2]
        full_module_path = if parent_module == "REST"
          Twilio::REST
        else
          Twilio::REST.const_get parent_module
        end

        @instance_class = full_module_path.const_get instance_name
        @list_key, @instance_id_key = detwilify(resource_name), 'sid'
      end

      def inspect # :nodoc:
        "<#{self.class} @path=#{@path}>"
      end

      ##
      # Grab a list of this kind of resource and return it as an array. The
      # array includes a special attribute named +total+ which will return the
      # total number of items in the list on Twilio's server. This may differ
      # from the +size+ and +length+ attributes of the returned array since
      # by default Twilio will only return 50 resources, and the maximum number
      # of resources you can request is 1000.
      #
      # The optional +params+ hash allows you to filter the list returned. The
      # filters for each list resource type are defined by Twilio.
      def list(params={}, full_path=false)
        raise "Can't get a resource list without a REST Client" unless @client
        response = @client.get @path, params, full_path
        resources = response[@list_key]
        path = full_path ? @path.split('.')[0] : @path
        resource_list = resources.map do |resource|
          @instance_class.new "#{path}/#{resource[@instance_id_key]}", @client,
            resource
        end
        # set the +previous_page+ and +next_page+ properties on the array
        client, list_class = @client, self.class
        resource_list.instance_eval do
          eigenclass = class << self; self; end
          eigenclass.send :define_method, :previous_page, &lambda {
            if response['previous_page_uri']
              list_class.new(response['previous_page_uri'], client).list({}, true)
            else
              []
            end
          }
          eigenclass.send :define_method, :next_page, &lambda {
            if response['next_page_uri']
              list_class.new(response['next_page_uri'], client).list({}, true)
            else
              []
            end
          }
        end
        resource_list
      end

      ##
      # Return an empty instance resource object with the proper path. Note that
      # this will never raise a Twilio::REST::RequestError on 404 since no HTTP
      # request is made. The HTTP request is made when attempting to access an
      # attribute of the returned instance resource object, such as
      # its #date_created or #voice_url attributes.
      def get(sid)
        @instance_class.new "#{@path}/#{sid}", @client
      end
      alias :find :get # for the ActiveRecord lovers

      ##
      # Return a newly created resource. Some +params+ may be required. Consult
      # the Twilio REST API documentation related to the kind of resource you
      # are attempting to create for details. Calling this method makes an HTTP
      # POST request to <tt>@path</tt> with the given params
      def create(params={})
        raise "Can't create a resource without a REST Client" unless @client
        response = @client.post @path, params
        @instance_class.new "#{@path}/#{response[@instance_id_key]}", @client,
          response
      end
    end
  end
end
