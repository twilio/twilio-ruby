module Twilio
  module REST
    class Calls < ListResource
      def initialize(path, client)
        super
        resource :feedback_summary
      end

      def make(from, to, url)
        create from: from, to: to, url: url
      end
    end

    class Call < InstanceResource
      def initialize(path, client, params={})
        super path, client, params
        resource :recordings, :notifications, :feedback
      end

      def redirect_to(url)
        update url: url
      end

      def cancel
        update status: 'canceled'
      end

      def hangup
        update status: 'completed'
      end
    end
  end
end
