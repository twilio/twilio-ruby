module Twilio
  module REST
    class Records
      class LastMonth < ListResource
        def initialize(path, client)
          super
          path "/Accounts/#{@account_sid}/Usage/Records/LastMonth.json"
          list_key 'usage_records'
        end
      end
    end
  end
end
