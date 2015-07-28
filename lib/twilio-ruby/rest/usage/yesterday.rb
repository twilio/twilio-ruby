module Twilio
  module REST
    class Records
      class Yesterday < ListResource
        def initialize(path, client)
          super
          path "/Accounts/#{@account_sid}/Usage/Records/Yesterday.json"
          list_key 'usage_records'
        end
      end
    end
  end
end
