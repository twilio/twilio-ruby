module Twilio
  module REST
    class Version
      MAX_PAGE_SIZE = 1000

      def initialize(domain)
        @domain = domain
        @version = nil
      end

      def absolute_url(uri)
        @domain.absolute_url(self.relative_uri(uri))
      end

      def relative_uri(uri)
        "#{@version.chomp('/')}/#{uri.chomp('/')}"
      end

      def request(method, uri, params={}, data={}, headers={}, auth=nil, timeout=nil)
        url = self.relative_uri(uri)
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

      def fetch(method, uri, params={}, data={}, headers={}, auth=nil, timeout=nil)
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
          raise TwilioException.new('Unable to fetch record')
        end

        response.body
      end

      def update(method, uri, params={}, data={}, headers={}, auth=nil, timeout=nil)
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
          raise TwilioException.new('Unable to update record')
        end

        response.body
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
          raise TwilioException.new('Unable to delete record')
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

      def page(method, uri, params={}, data={}, headers={}, auth=nil, timeout=nil)
        self.request(
          method,
          uri,
          params,
          data,
          headers,
          auth,
          timeout
        )
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
