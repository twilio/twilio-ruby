require 'libxml'

module Twilio
  module TwiML
    class TwiMLError < StandardError
    end

    # TwiML Base Class
    class TwiML
      # Generate getter/setter methods
      attr_accessor :name
      attr_accessor :indent

      def initialize(indent: false, **keyword_args)
        @name = self.class.name.split('::').last
        @indent = indent
        @value = nil
        @verbs = []
        @attrs = {}

        keyword_args.each do |key, val|
          @attrs[TwiML.to_lower_camel_case(key)] = val unless val.nil?
        end
      end

      def self.to_lower_camel_case(symbol)
        # Symbols don't have the .split method, so convert to string first
        result = symbol.to_s.split('_').map(&:capitalize).join
        result[0].downcase + result[1..result.length]
      end

      def to_s(xml_declaration = true)
        xml = self.xml.to_s(indent: indent)

        return ('<?xml version="1.0" encoding="UTF-8"?>' + xml) if xml_declaration
        xml
      end
      alias to_xml to_s

      def xml
        # create XML element
        elem = LibXML::XML::Node.new(@name, @value)

        # set element attributes
        keys = @attrs.keys.sort
        keys.each do |key|
          value = @attrs[key]

          value_is_boolean = value.is_a?(TrueClass) || value.is_a?(FalseClass)
          elem[key] = value_is_boolean ? value.to_s.downcase : value.to_s
        end

        @verbs.each do |verb|
          elem << verb.xml
        end

        elem
      end

      def append(verb)
        raise TwiMLError, 'Only appending of TwiML is allowed' unless verb.is_a?(TwiML)

        @verbs << verb
        self
      end
    end
  end
end
