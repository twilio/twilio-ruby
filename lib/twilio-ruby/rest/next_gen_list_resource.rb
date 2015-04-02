module Twilio
  module REST
    class NextGenListResource < Twilio::REST::ListResource
      def list(params={}, full_path=false)
        raise "Can't get a resource list without a REST Client" unless @client
        response = @client.get @path, params, full_path
        list_key = response['meta']['key']
        raise "Couldn't find a list key in response meta" unless list_key
        resources = response[list_key]
        resource_list = resources.map do |resource|
          @instance_class.new "#{@path}/#{resource[@instance_id_key]}", @client,
                              resource
        end
        client, list_class = @client, self.class
        resource_list.instance_eval do
          eigenclass = class << self; self; end
          eigenclass.send :define_method, :next_page, &lambda {
            if response['meta']['next_page_url']
              list_class.new(response['meta']['next_page_url'], client).list({})
            else
              []
            end
          }
          eigenclass.send :define_method, :previous_page, &lambda {
            if response['meta']['previous_page_url']
              list_class.new(response['meta']['previous_page_url'], client).list({})
            else
              []
            end
          }
        end
        resource_list
      end
    end
  end
end
