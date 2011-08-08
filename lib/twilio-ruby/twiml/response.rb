module Twilio
  module TwiML
    class Response
      attr_reader :text

      def initialize(&block)
        xml = Builder::XmlMarkup.new
        xml.instruct!
        @text = xml.Response &block
      end

      def ==(other)
        @text == other.text
      end

      def eql(other)
        self == other
      end
    end
  end
end
