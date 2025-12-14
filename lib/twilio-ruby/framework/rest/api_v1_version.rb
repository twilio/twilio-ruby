# frozen_string_literal: true
require_relative 'version'
module Twilio
  module REST
    class ApiV1Version < Version
      attr_accessor :api_version

      def initialize(domain, version)
        super(domain)
        @version = version
        @api_version = 'v1'
      end

      def exception(response, header)
        message = "[HTTP #{response.status_code}] #{header}"

        content = response.content
        if content.is_a?(Hash)
          message += ": #{content['message']}" if content.key?('message')
          code = content['code'] || response.status_code
          http_status_code = content['httpStatusCode'] || response.status_code
          params = content['params'] || {}
          user_error = content['userError'] || false
          return RestExceptionV1.new(code, message, http_status_code, params, user_error)
        end

        RestExceptionV1.new(response.status_code, message, response.status_code)
      end
    end
  end
end
