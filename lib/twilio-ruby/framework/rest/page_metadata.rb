# frozen_string_literal: true

module Twilio
  module REST
    # Page Base Class
    class PageMetadata
      include Enumerable

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
        @records = load_page(payload)
        @headers = response.headers
        @status_code = response.status_code
      end

      def process_response(response)
        if response.status_code != 200
          raise Twilio::REST::RestError.new('Unable to fetch page', response)
        end

        response
      end

      def load_page(payload)
        return payload.body['Resources'] if payload.body['Resources']
        if payload.body['meta'] && payload.body['meta']['key']
          return payload.body[payload.body['meta']['key']]
        else
          keys = payload.body.keys
          key = keys - META_KEYS
          return payload.body[key.first] if key.size == 1
        end

        raise Twilio::REST::TwilioError, 'Page Records can not be deserialized'
      end

      def previous_page_url
        if @payload.body['meta'] && @payload.body['meta']['previous_page_url']
          return @version.domain.absolute_url(URI.parse(@payload.body['meta']['previous_page_url']).request_uri)
        elsif @payload.body['previous_page_uri']
          return @version.domain.absolute_url(@payload.body['previous_page_uri'])
        end

        nil
      end

      def next_page_url
        if @payload.body['meta'] && @payload.body['meta']['next_page_url']
          return @version.domain.absolute_url(URI.parse(@payload.body['meta']['next_page_url']).request_uri)
        elsif @payload.body['next_page_uri']
          return @version.domain.absolute_url(@payload.body['next_page_uri'])
        end

        nil
      end

      def get_instance(payload)
        raise Twilio::REST::TwilioError, 'Page.get_instance() must be implemented in the derived class'
      end

      def previous_page
        return nil unless previous_page_url

        response = @version.domain.request('GET', previous_page_url)

        self.class.new(@version, response, @solution)
      end

      def next_page
        return nil unless next_page_url

        response = @version.domain.request('GET', next_page_url)

        self.class.new(@version, response, @solution)
      end

      def each
        @records.each do |record|
          yield get_instance(record)
        end
      end

      def to_s
        '#<Page>'
      end
    end
  end
end
