module Twilio
  module REST
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
      ]

      def initialize(version, response)
        payload = self.process_response(response)

        @version = version
        @payload = payload
        @solution = {}
        @records = self.load_page(payload)
      end

      def process_response(response)
        if response.status_code != 200
          raise Twilio::REST::TwilioException.new('Unable to fetch page', response)
        end

        response.body
      end

      def load_page(payload)
        if payload['meta'] && payload['meta']['key']
          return payload[payload['meta']['key']]
        else
          keys = payload.keys
          key = keys - META_KEYS
          if key.size == 1
            return payload[key.first]
          end
        end

        raise Twilio::REST::TwilioException.new('Page Records can not be deserialized')
      end

      def previous_page_url
        if @payload['meta'] && @payload['meta']['previous_page_url']
          return URI.parse(@payload['meta']['previous_page_url']).request_uri
        elsif @payload['previous_page_uri']
          return @payload['previous_page_uri']
        end

        nil
      end

      def next_page_url
        if @payload['meta'] && @payload['meta']['next_page_url']
          return URI.parse(@payload['meta']['next_page_url']).request_uri
        elsif @payload['next_page_uri']
          return @payload['next_page_uri']
        end

        nil
      end

      def get_instance(payload)
        raise Twilio::REST::TwilioException.new('Page.get_instance() must be implemented in the derived class')
      end

      def previous_page
        return nil unless self.previous_page_url

        response = @version.domain.request('GET', self.previous_page_url)

        self.class.new(@version, response, @solution)
      end

      def next_page
        return nil unless self.next_page_url

        response = @version.domain.request('GET', self.next_page_url)

        self.class.new(@version, response, @solution)
      end

      def each
        @records.each do |record|
          yield self.get_instance(record)
        end
      end

      def to_s
        '#<Page>'
      end
    end
  end
end

