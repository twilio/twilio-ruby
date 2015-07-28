module Twilio
  module REST
    class Usage
      class Records
        class AllTime < ListResource
          def initialize(path, client)
            super
            path "/Accounts/#{@account_sid}/Usage/Records/AllTime.json"
            list_key 'usage_records'
          end
        end
      end
    end
  end
end
