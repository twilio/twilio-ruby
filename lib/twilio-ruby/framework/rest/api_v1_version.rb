# frozen_string_literal: true

require_relative 'version'
require_relative 'error'

module Twilio
  module REST
    class ApiV1Version < Version
      attr_accessor :api_version

      def initialize(domain, version)
        super(domain)
        @version = version.version
        @api_version = 'v1'
      end

      def exception(response, _)
        RestErrorV10.new(response.body)
      end
    end
  end
end
