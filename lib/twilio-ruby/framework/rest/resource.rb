# frozen_string_literal: true

module Twilio
  module REST
    class ListResource
      def initialize(version)
        @version = version
      end
    end

    class InstanceContext
      def initialize(version)
        @version = version
      end
    end

    class InstanceResource
      def initialize(version)
        @version = version
      end
    end

    class InstanceResourceMetadata
      def initialize(payload, headers, status_code)
        @payload = payload
        @headers = headers
        @status_code = status_code
      end
    end

    class InstanceListResource
      def initialize(version, headers, status_code)
        @version = version
        @headers = headers
        @status_code = status_code
      end
    end
  end
end
