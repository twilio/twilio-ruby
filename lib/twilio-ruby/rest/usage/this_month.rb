module Twilio
  module REST
    class Records
      class ThisMonth < ListResource
        def initialize(path, client)
          super
          path "/Accounts/#{@account_sid}/Usage/Records/ThisMonth.json"
          list_key 'usage_records'
        end
      end
    end
  end
end
