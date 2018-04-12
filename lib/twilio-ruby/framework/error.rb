module Twilio
  module REST
    class TwilioError < StandardError
      attr_reader :message, :body

      def initialize(message, body = nil)
        @message = message
        @body = body
      end

      def to_s
        "#{@message}: #{@body || 'no body'}"
      end
    end

    class RestError < TwilioError
      attr_reader :message, :response, :code, :status_code, :detail, :more_info, :error_message

      def initialize(message, response)
        @status_code = response.status_code
        @code = response.body.fetch('code', @status_code)
        @detail = response.body.fetch('detail', nil)
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
        message += "\n#{detail}" if detail
        message += "\n#{more_info}" if more_info
        message += "\n\n"
      end
    end

    class ObsoleteError < StandardError
    end
  end
end
