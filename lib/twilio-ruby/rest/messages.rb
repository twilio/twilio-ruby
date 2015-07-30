module Twilio
  module REST
    class Messages < ListResource
      def initialize(client)
        super
        path "/Accounts/#{@account_sid}/Messages.json"
      end
    end

    class Message < InstanceResource
      def initialize(client, params={})
        super
        path "/Accounts/#{@account_sid}/Messages/#{@sid}.json"
      end

      def redact
        update body: ''
      end
    end
  end
end
