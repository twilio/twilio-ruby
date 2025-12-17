# frozen_string_literal: true

module Twilio
  module REST
    class TwilioError < StandardError
    end

    class RestError < TwilioError
      attr_reader :message, :response, :code, :status_code, :details, :more_info, :error_message

      def initialize(message, response)
        @status_code = response.status_code
        @code = response.body.fetch('code', @status_code)
        @details = response.body.fetch('details', nil)
        @error_message = response.body.fetch('message', nil)
        @more_info = response.body.fetch('more_info', nil)
        @message = format_message(message)
        @response = response
      end

      def to_s
        message
      end

      private

      def format_message(initial_message)
        message = "[HTTP #{status_code}] #{code} : #{initial_message}"
        message += "\n#{error_message}" if error_message
        message += "\n#{details}" if details
        message += "\n#{more_info}" if more_info
        message + "\n\n"
      end
    end

    class ObsoleteError < StandardError
    end

    class RestErrorV10 < TwilioError
      attr_accessor :code, :message, :http_status_code, :params, :user_error

      def initialize(response)
        @code = response['code']
        @message = response['message']
        @http_status_code = response['httpsStatusCode']
        @params = response['params']
        @user_error = response['userError']
      end

      def to_s
        message
      end

      private

      def format_message(initial_message)
        message_response = "[HTTP #{status_code}] #{code} : #{initial_message}"
        message_response += "\n#{message}" if message
        message_response += "\n#{http_status_code}" if http_status_code
        message_response += "\n#{params}" if params
        message_response += "\n#{user_error}" if user_error
        message_response + "\n\n"
      end
    end
  end
end
