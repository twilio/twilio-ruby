module Twilio
  module REST
    class Records
      class Yearly < ListResource
        def initialize(path, client)
          super
          path "/Accounts/#{@account_sid}/Usage/Records/Yearly.json"
          list_key 'usage_records'
        end
      end
    end
  end
end
