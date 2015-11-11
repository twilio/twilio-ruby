module Twilio
  module REST
    class Page
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

      def proccess_response(response)
        if response.status_code != 200
          raise TwilioException.new('Unable to fetch page', response)
        end

        JSON.parse(response)
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

        raise TwilioException.new('Page Records can not be deserialized')
      end

      def previous_page_url
        if payload['meta'] && payload['meta']['previous_page_url']
          return payload['meta']['previous_page_url']
        elsif payload['previous_page_uri']
          return @version.domain.absolute_url(payload['previous_page_uri'])
        end

        nil
      end

      def next_page_url
        if payload['meta'] && payload['meta']['next_page_url']
          return payload['meta']['next_page_url']
        elsif payload['next_page_uri']
          return @version.domain.absolute_url(payload['next_page_uri'])
        end

        nil
      end

      def get_instance(payload)
        raise TwilioException.new('Page.get_instance() must be implemented in the derived class')
      end

      def previous_page
        return nil unless self.previous_page_url

        response = @version.domain.client.request('GET', self.previous_page_url)

        self.class.new(@version, response, @solution)
      end

      def next_page
        return nil unless self.next_page_url

        response = @version.domain.client.request('GET', self.next_page_url)

        self.class.new(@version, response, @solution)
      end

      def to_s
        '#<Page>'
      end
    end
  end
end

