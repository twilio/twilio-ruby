module Twilio
  module REST
    module Utils

      def twilify(something)
        if something.is_a? Hash
          something = something.to_a
          something = something.map { |a| [twilify(a[0]).to_sym, a[1]] }
          something = something.flatten(1)
          Hash[*something]
        else
          something.to_s.split('_').map! do |s|
            [s[0,1].capitalize, s[1..-1]].join
          end.join
        end
      end

      def detwilify(something)
        if something.is_a? Hash
          something = *something.to_a
          something.map! { |pair| [detwilify(pair[0]).to_sym, pair[1]] }
          something = something.flatten
          Hash[something]
        else
          something = something.to_s
          something = something.gsub(/[A-Z][a-z]*/) { |s| "_#{s.downcase}" }
          something.gsub(/^_/, '')
        end
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
    end
  end
end
