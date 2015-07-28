module Twilio
  module REST
    class Records
      class Today < ListResource
        def initialize(path, client)
          super
          path "/Accounts/#{@account_sid}/Usage/Records/Today.json"
          list_key 'usage_records'
        end
      end
    end
  end
end
