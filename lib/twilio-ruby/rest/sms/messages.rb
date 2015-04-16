module Twilio
  module REST
    module SMS
      
      module Deprecation
        def deprecate(method_name)
          old_method = "_deprecated_#{method_name}"
          alias_method old_method, method_name
          define_method method_name do |*args, &block|
            warn "[DEPRECATED] SMS Resource is deprecated. Please use Messages (https://www.twilio.com/docs/api/rest/message)"
            send old_method, *args, &block
          end
        end
      end

      class Messages < ListResource
        extend Deprecation
         
        deprecate :list
        deprecate :get
        deprecate :create

        def initialize(path, client)
          super
          @list_key = 'sms_messages'
        end
      end

      class Message < InstanceResource
        extend Deprecation

        deprecate :update
        deprecate :refresh
        deprecate :delete
      end
    end
  end
end
