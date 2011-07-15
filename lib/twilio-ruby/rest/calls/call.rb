module Twilio
  module REST
    class Call < InstanceResource
      def initialize(uri, client, params={})
        super uri, client, params
        resource :recordings, :transcriptions
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
