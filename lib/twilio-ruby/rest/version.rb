module Twilio
  module REST
    class Version
      MAX_PAGE_SIZE = 1000

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

      def initialize(domain)
        @domain = domain
        @version = nil
      end


      def request(method, uri, params={}, data={}, headers={}, auth=nil, timeout=nil)
        url = url_join(@version, uri)
        @domain.request(
          method,
          url,
          params,
          data,
          headers,
          auth,
          timeout
        )
      end

      def fetch(instance, instance_kwargs, method, uri, params={}, data={}, headers={}, auth=nil, timeout=nil)
        response = self.request(
          method,
          uri,
          params,
          data,
          headers,
          auth,
          timeout
        )

        if response.status_code != 200
          raise TwilioException('Unable to fetch record')
        end

        instance.new(self, response.body, instance_kwargs)
      end

      def update(instance, instance_kwargs, method, uri, params={}, data={}, headers={}, auth=nil, timeout=nil)
        response = self.request(
          method,
          uri,
          params,
          data,
          headers,
          auth,
          timeout
        )

        if response.status_code != 200
          raise TwilioException('Unable to update record')
        end

        instance.new(self, response.body, instance_kwargs)
      end

      def delete(method, uri, params={}, data={}, headers={}, auth=nil, timeout=nil)
        response = self.request(
          method,
          uri,
          params,
          data,
          headers,
          auth,
          timeout
        )

        if 500 <= response.status_code < 600
          raise TwilioException('Unable to delete record')
        end

        response.status_code == 204
      end

      def read_limits(limit=nil, page_size=nil)
        page_limit = values.unset

        unless limit.nil?
          # If there is no user-specified page_size, pick the most network efficient size
          page_size ||= min(limit, MAX_PAGE_SIZE)
          page_limit = (limit / page_size.to_f).ceil
        end

        {
          limit: limit || values.unset,
          page_size: page_size || values.unset,
          page_limit: page_limit,
        }
      end

      def page(pager, instance, instance_kwargs, method, uri, kwargs)
        response = self.request(method, uri, kwargs)

        if response.status_code != 200
          raise TwilioException('Unable to fetch page')
        end

        records = self.load_page(response.body)
        previous_page_url = self.previous_page_url(payload)
        next_page_url = self.next_page_url(payload)

        Page.new(
            self,
            pager,
            instance,
            instance_kwargs,
            previous_page_url,
            next_page_url,
            records
        )
      end

      def previous_page_url(payload)
        if payload.contains?('meta') && payload['meta'].contains?('previous_page_url')
            return payload['meta']['previous_page_url']
        elsif payload.contains?('previous_page_uri')
            return payload['previous_page_uri']
        end

        nil
      end

      def next_page_url(payload)
        if payload.contains?('meta') && payload['meta'].contains?('next_page_url')
            return payload['meta']['next_page_url']
        elsif payload.contains?('next_page_uri')
            return payload['next_page_uri']
        end

        nil
      end

      def load_page(payload)
        if payload.contains?('meta') && payload['meta'].contains?('key')
          return payload[payload['meta']['key']]
        else
          key = payload.keys - self.META_KEYS
          if key.length == 1
            return payload[key.first]
          end
        end

        raise TwilioException('Page Records can not be deserialized')
      end

      def create(instance, instance_kwargs, method, uri, kwargs)
        response = self.request(method, uri, **kwargs)

        unless [200, 201].contains?(response.status_code)
          raise TwilioException("[#{response.status_code}] Unable to create record\n#{response.body}")
        end

        instance.new(self, response.body, instance_kwargs)
      end
    end
  end
end
