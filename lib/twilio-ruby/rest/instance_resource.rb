module Twilio
  module REST
    class InstanceResource
      include Utils

      def initialize(uri, client, params = {})
        @uri, @client = uri, client
        set_up_properties_from params
      end

      def update(params = {})
        raise "Can't update a resource without a REST Client" unless @client
        response = @client.post @uri, params
        set_up_properties_from response
        self
      end

      def refresh
        raise "Can't refresh a resource without a REST Client" unless @client
        @updated = false
        response = @client.get @uri
        set_up_properties_from response
      end

      def delete
        raise "Can't delete a resource without a REST Client" unless @client
        @client.delete @uri
      end

      def method_missing(method, *args)
        super if @updated
        response = @client.get @uri
        set_up_properties_from response
        self.send method, *args
      end

      protected

      def set_up_properties_from(hash)
        eigenclass = class << self; self; end
        hash.each do |p,v|
          property = detwilify p
          unless ['uri', 'client', 'updated'].include? property
            eigenclass.send :define_method, property.to_sym, &lambda {v}
          end
        end
        @updated = !hash.keys.empty?
      end

      def resource(*resources)
        resources.each do |r|
          resource = twilify r
          relative_uri = r == :sms ? 'SMS' : resource
          uri = "#{@uri}/#{relative_uri}"
          resource_class = Twilio::REST.const_get resource
          instance_variable_set("@#{r}", resource_class.new(uri, @client))
        end
        self.class.instance_eval {attr_reader *resources}
      end

    end
  end
end
