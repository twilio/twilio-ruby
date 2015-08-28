module Twilio
  module REST
    class ListResource
      include Utils
      attr_accessor :path, :instance_id_key
      VERBS = [:list, :get, :create]

      class << self
        def can(*allowed_verbs)
          allowed_verbs.each do |v|
            unless VERBS.include?(v)
              raise "ListResource has no verb named #{v.to_s}"
            end

            self.send :define_method, v,
              &lambda {|*args| self.send 'internal_'+v.to_s, *args}
          end
        end

        def command_alias(a)
          self.instance_eval do
            define_method :get_command_alias,
                          &lambda {a}
          end
        end
      end

      def initialize(client, inheritance={})
        @client = client

        @inheritance = inheritance
        @inheritance.each do |k, v|
          instance_variable_set("@#{k}", v)
        end

        @list_key = self.class.name.demodulize.underscore
        @instance_id_key = 'sid'
      end

      def path(new_path)
        @path = new_path
      end

      def get_list_key
        @list_key ||= detwilify(self.class.name.demodulize)
      end

      def list_key(key)
        @list_key = key
      end

      def instance_class(c)
        @instance_class = c
      end

      def instance_id_key(key)
        @instance_id_key = key
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

      protected

      def internal_list(params={}, full_path=false)
        raise "Can't get a resource list without a REST Client" unless @client
        response = @client.get @path, params, full_path
        response = @client.get @path, params, full_path
        meta_list_key = response['meta']['key'] if response['meta']
        resources = response[meta_list_key || get_list_key]
        resource_list = resources.map do |resource|
          @instance_class.new @client, @inheritance, resource
        end
        # set the +previous_page+ and +next_page+ properties on the array
        client, list_class = @client, self.class
        resource_list.instance_eval do
          eigenclass = class << self; self; end
          eigenclass.send :define_method, :previous_page, &lambda {
            if response['previous_page_uri']
              list_class.new.path(response['previous_page_uri'], client).list({}, true)
            elsif response['meta']['previous_page_url']
              list_class.new(response['meta']['previous_page_url'], client).list({})
            else
              []
            end
          }
          eigenclass.send :define_method, :next_page, &lambda {
            if response['next_page_uri']
              list_class.new.path(response['next_page_uri'], client).list({}, true)
            elsif response['meta']['next_page_url']
              list_class.new(response['meta']['next_page_url'], client).list({})
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
      def internal_get(sid = nil)
        inheritance = @inheritance
        inheritance = inheritance.merge("#{@instance_id_key}" => sid) if sid
        i = @instance_class.new @client, inheritance
        i.instance_id_key @instance_id_key
        i
      end

      ##
      # Return a newly created resource. Some +params+ may be required. Consult
      # the Twilio REST API documentation related to the kind of resource you
      # are attempting to create for details. Calling this method makes an HTTP
      # POST request to <tt>@path</tt> with the given params
      def internal_create(params={})
        raise "Can't create a resource without a REST Client" unless @client
        response = @client.post @path, params
        @instance_class.new @client, @inheritance, response
      end

      def components(*comps)
        comps.each do |comp|
          comp_instance = comp.new(@client, @inheritance)
          self.define_singleton_method comp_instance.get_command_alias,
            &lambda {comp_instance}
        end
      end

      def nesting
        name = self.class.name
        mod_parts = name.split('::')
        mod_parts.each_with_index.map do |m, i|
          Twilio.const_get(mod_parts[0..i].join('::'))
        end.reverse
      end
    end
  end
end
