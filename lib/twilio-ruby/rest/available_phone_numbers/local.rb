module Twilio
  module REST
    module AvailablePhoneNumbers
      class Local < ListResource
        def initialize(path, client)
          super
          path "/Accounts/#{@account_sid}/AvailablePhoneNumbers/Local.json"
          list_key 'available_phone_numbers'
          instance_id_key 'sid'
        end
      end
    end
  end
end
