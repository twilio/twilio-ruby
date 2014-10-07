module Twilio
  module REST
    module Utils

      def twilify(something)
        return key_map(something, :twilify) if something.is_a? Hash
        string = something.to_s
        string.split('_').map do |string_part|
          string_part[0,1].capitalize + string_part[1..-1]
        end.join
      end

      def detwilify(something)
        return key_map(something, :detwilify) if something.is_a? Hash
        string = something.to_s
        string = string[0,1].downcase + string[1..-1]
        string.gsub(/[A-Z][a-z]*/) { |s| "_#{s.downcase}" }
      end

      protected

      def resource(*resources)
        custom_resource_names = { sms: 'SMS', sip: 'SIP' }
        resources.each do |r|
          resource = twilify r
          relative_path = custom_resource_names.fetch(r, resource)
          path = "#{@path}/#{relative_path}"
          enclosing_module = if @submodule == nil
            Twilio::REST
          else
            Twilio::REST.const_get(@submodule)
          end
          resource_class = enclosing_module.const_get resource
          instance_variable_set("@#{r}", resource_class.new(path, @client))
        end
        self.class.instance_eval { attr_reader *resources }
      end

      private

      def key_map(something, method)
        something = something.to_a.flat_map do |pair|
          [send(method, pair[0]).to_sym, pair[1]]
        end
        Hash[*something]
      end
    end
  end
end
