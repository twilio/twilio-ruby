module Twilio
  module REST
    class Records
      class Monthly < ListResource
        def initialize(path, client)
          super
          path "/Accounts/#{@account_sid}/Usage/Records/Monthly.json"
          list_key 'usage_records'
        end
      end
    end
  end
end
