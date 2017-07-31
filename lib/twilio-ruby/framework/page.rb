module Twilio
  module REST
    # Represents a page of records in a collection
    class Page
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
      end

      # @param [TwilioResponse] response The HTTP response
      # @return [Array] The JSON-loaded content
      def process_response(response)
        if response.status_code != 200
          raise Twilio::REST::TwilioError.new('Unable to fetch page', response)
        end

        response.body
      end

      # Parses an array of records out of a list payload
      # @param [Hash] payload Payload response from the API
      # @return [Array] the list of records
      def load_page(payload)
        if payload['meta'] && payload['meta']['key']
          return payload[payload['meta']['key']]
        else
          keys = payload.keys
          key = keys - META_KEYS
          return payload[key.first] if key.size == 1
        end

        raise Twilio::REST::TwilioError, 'Page Records can not be deserialized'
      end

      # @return [String] Returns a link to the previous_page_url or nil if it doesn't exist.
      def previous_page_url
        if @payload['meta'] && @payload['meta']['previous_page_url']
          return @version.domain.absolute_url(URI.parse(@payload['meta']['previous_page_url']).request_uri)
        elsif @payload['previous_page_uri']
          return @version.domain.absolute_url(@payload['previous_page_uri'])
        end

        nil
      end

      # @return [String] Returns a link to the next_page_url or nil if it doesn't exist.
      def next_page_url
        if @payload['meta'] && @payload['meta']['next_page_url']
          return @version.domain.absolute_url(URI.parse(@payload['meta']['next_page_url']).request_uri)
        elsif @payload['next_page_uri']
          return @version.domain.absolute_url(@payload['next_page_uri'])
        end

        nil
      end

      # @param [Hash] payload Payload response from the API
      # @return A resource dependent object
      def get_instance(payload)
        raise Twilio::REST::TwilioError, 'Page.get_instance() must be implemented in the derived class'
      end

      # Return the page before this one
      # @return [Page] The previous page
      def previous_page
        return nil unless previous_page_url

        response = @version.domain.request('GET', previous_page_url)

        self.class.new(@version, response, @solution)
      end

      # Return the page after this one
      # @return [Page] The next page
      def next_page
        return nil unless next_page_url

        response = @version.domain.request('GET', next_page_url)

        self.class.new(@version, response, @solution)
      end

      # A Page is an iterator
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
