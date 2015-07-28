module Twilio
  module REST
    module Records
      class Yearly < ListResource
        def initialize(path, client)
          @path, @client = path, client
          @instance_class = Twilio::REST::Record
          @list_key = 'usage_records'
        end
      end
    end
  end
end
