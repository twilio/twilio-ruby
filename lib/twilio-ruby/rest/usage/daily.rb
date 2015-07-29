module Twilio
  module REST
    class Records
      class Daily < ListResource
        def initialize(path, client)
          super
          path "/Accounts/#{@account_sid}/Usage/Records/Daily.json"
          list_key 'usage_records'
        end
      end
    end
  end
end
