module Twilio
  module REST
    module Records
      class Monthly < Twilio::REST::RecordList
        def initialize(path, client)
          @path, @client = path, client
          @instance_class = Twilio::REST::Record
          @list_key = 'usage_records'
        end
      end
    end
  end
end
