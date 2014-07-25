module Twilio
  module TwiML
    class Response

      attr_reader :text
      alias_method :to_xml , :text

      def initialize(&block)
        xml = Builder::XmlMarkup.new
        xml.instruct!
        @text = xml.Response &block
      end

    end
  end
end
