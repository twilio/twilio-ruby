module Twilio
  module REST
    module Records
      class ThisMonth < ListResource
        def initialize(path, client)
          super
          list_key 'usage_records'
        end
      end
    end
  end
end
