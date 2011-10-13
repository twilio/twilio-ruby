module Twilio
  module REST
    class Calls < ListResource
      def make(from, to, url)
        create :from => from, :to => to, :url => url
      end
    end

    class Call < InstanceResource
      def initialize(uri, client, params={})
        super uri, client, params
        resource :recordings, :notifications
      end

      def redirect_to(url)
        update :url => url
      end

      def cancel
        update :status => 'canceled'
      end

      def hangup
        update :status => 'completed'
      end
    end
  end
end
