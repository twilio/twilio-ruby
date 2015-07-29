module Twilio
  module REST
    class Usage
      class Records < ListResource
        def initialize(client)
          super
          path "/Accounts/#{@account_sid}/Usage/Records"
          list_key 'usage_records'
        end
      end

      class Record < InstanceResource; end
    end
  end
end
