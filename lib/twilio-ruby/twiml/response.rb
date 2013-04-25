module Twilio
  module TwiML

    class TwiMLMarkup < Builder::XmlMarkup
      def method_missing(sym, *args, &block)
        s = sym.respond_to?('capitalize') ? sym.capitalize : sym
        super s, *args, &block
      end
    end

    class Response
      def initialize(&block)
        if block_given?
          xml = TwiMLMarkup.new
          xml.instruct!
          @text = xml.Response &block
        else
          @inner_xml = TwiMLMarkup.new
        end
      end

      def method_missing(sym, *args, &block)
        @inner_xml ? @inner_xml.method_missing(sym, *args, &block) : super
      end

      def text
        if @inner_xml
          wrap = Builder::XmlMarkup.new
          wrap.instruct!
          wrap.Response {
            wrap << @inner_xml.target!
          }
          wrap.target!
        else
          @text
        end
      end
    end

  end
end
