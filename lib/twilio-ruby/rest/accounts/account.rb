module Twilio
  module REST
    class Account < InstanceResource
      def initialize(uri, client, params={})
        super uri, client, params
        resource :sandbox, :available_phone_numbers, :incoming_phone_numbers,
          :calls, :outgoing_caller_ids, :conferences, :sms, :recordings,
          :transcriptions, :notifications, :applications
      end
    end
  end
end
