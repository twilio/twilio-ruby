# frozen_string_literal: true

module Twilio
  module REST
    # Page Base Class
    class PageMetadata
      META_KEYS = [
        'end',
        'first_page_uri',
        'next_page_uri',
        'last_page_uri',
        'page',
        'page_size',
        'previous_page_uri',
        'total',
        'num_pages',
        'start',
        'uri'
      ].freeze

      def initialize(version, response)
        payload = process_response(response)

        @version = version
        @payload = payload
        @solution = {}
        @records = payload
      end

      def process_response(response)
        return response if response.status_code == 200

        raise Twilio::REST::RestError.new('Unable to fetch page', response)
      end

      def get_key(payload)
        return 'Resources' if payload['Resources']

        return payload['meta']['key'] if payload['meta'] && payload['meta']['key']

        keys = payload.keys
        key = keys - META_KEYS
        return key.first if key.size == 1

        raise Twilio::REST::TwilioError, 'Page Records can not be deserialized'
      end

      def previous_page_url
        # rubocop:disable Layout/LineLength
        return @version.domain.absolute_url(URI.parse(@payload['meta']['previous_page_url']).request_uri) if @payload['meta'] && @payload['meta']['previous_page_url']
        # rubocop:enable Layout/LineLength
        return @version.domain.absolute_url(@payload['previous_page_uri']) if @payload['previous_page_uri']

        nil
      end

      def next_page_url
        # rubocop:disable Layout/LineLength
        return @version.domain.absolute_url(URI.parse(@payload.body['meta']['next_page_url']).request_uri) if @payload.body['meta'] && @payload.body['meta']['next_page_url']
        # rubocop:enable Layout/LineLength
        return @version.domain.absolute_url(@payload.body['next_page_uri']) if @payload.body['next_page_uri']

        nil
      end

      def previous_page
        return nil unless previous_page_url

        @version.domain.request('GET', previous_page_url)
      end

      def next_page
        return nil unless next_page_url

        @version.domain.request('GET', next_page_url)
      end

      def to_s
        '#<PageMetadata>'
      end
    end
  end
end
