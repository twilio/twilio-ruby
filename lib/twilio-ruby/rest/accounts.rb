module Twilio
  module REST
    class Accounts < ListResource; end

    class Account < InstanceResource
      def initialize(path, client, params={})
        super
        resource :addresses,
                 :applications,
                 :authorized_connect_apps,
                 :available_phone_numbers,
                 :calls,
                 :conferences,
                 :connect_apps,
                 :incoming_phone_numbers,
                 :messages,
                 :notifications,
                 :outgoing_caller_ids,
                 :queues,
                 :recordings,
                 :sandbox,
                 :sip,
                 :sms,
                 :tokens,
                 :transcriptions,
                 :usage
      end
    end
  end
end
