module Twilio
  module REST
    class Sip < ListResource
      def initialize(path, client)
        @path, @client = path, client
        resource :domains,
                 :ip_access_control_lists,
                 :credential_lists
      end
    end
  end
end
