##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Content < Domain
      ##
      # Initialize the Content Domain
      def initialize(twilio)
        super

        @base_url = 'https://content.twilio.com'
        @host = 'content.twilio.com'
        @port = 443

        # Versions
        @v1 = nil
      end

      ##
      # Version v1 of content
      def v1
        @v1 ||= V1.new self
      end

      ##
      # @param [String] sid The unique string that that we created to identify the
      #   Content resource.
      # @return [Twilio::REST::Content::V1::ContentInstance] if sid was passed.
      # @return [Twilio::REST::Content::V1::ContentList]
      def contents(sid=:unset)
        self.v1.contents(sid)
      end

      ##
      # @return [Twilio::REST::Content::V1::LegacyContentInstance]
      def legacy_contents
        self.v1.legacy_contents()
      end

      ##
      # Provide a user friendly representation
      def to_s
        '#<Twilio::REST::Content>'
      end
    end
  end
end