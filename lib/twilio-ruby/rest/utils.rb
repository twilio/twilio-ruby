module Twilio
  module REST
    module Utils

      def twilify(something)
        if something.is_a? Hash
          Hash[*something.to_a.map! {|a| [twilify(a[0]).to_sym, a[1]]}.flatten(1)]
        else
          something.to_s.split('_').map! do |s|
            [s[0,1].capitalize, s[1..-1]].join
          end.join
        end
      end

      def detwilify(something)
        if something.is_a? Hash
          Hash[*something.to_a.map! {|pair| [detwilify(pair[0]).to_sym, pair[1]]}.flatten]
        else
          something.to_s.gsub(/[A-Z][a-z]*/) {|s| "_#{s.downcase}"}.gsub(/^_/, '')
        end
      end

      protected

      def resource(*resources)
        custom_resource_names = {
          :sms => 'SMS',
          :sip => 'SIP'
        }
        resources.each do |r|
          resource = twilify r
          relative_path = custom_resource_names.fetch(r, resource)
          path = "#{@path}/#{relative_path}"
          enclosing_module = @submodule == nil ? (Twilio::REST) : (Twilio::REST.const_get(@submodule))
          resource_class = enclosing_module.const_get resource
          instance_variable_set("@#{r}", resource_class.new(path, @client))
        end
        self.class.instance_eval {attr_reader *resources}
      end
    end
  end
end
