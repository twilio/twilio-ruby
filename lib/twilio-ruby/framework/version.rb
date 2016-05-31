module Twilio
  module REST
    class Version
      MAX_PAGE_SIZE = 1000

      attr_accessor :domain

      class RecordStream
        include Enumerable

        def initialize(page, limit: nil, page_limit: nil)
          @page = page
          @limit = limit
          @page_limit = page_limit

        end

        def each
          current_record = 1
          current_page = 1

          while @page
            @page.each do |record|
              yield record
              current_record += 1
              return if @limit && @limit <= current_record
            end

            return if @page_limit && @page_limit <= current_page

            @page = @page.next_page
            current_page += 1
          end
        end
      end

      def initialize(domain)
        @domain = domain
        @version = nil
      end

      def absolute_url(uri)
        @domain.absolute_url(self.relative_uri(uri))
      end

      def relative_uri(uri)
        "#{@version.chomp('/').gsub(/^\//, '')}/#{uri.chomp('/').gsub(/^\//, '')}"
      end

      def request(method, uri, params={}, data={}, headers={}, auth=nil, timeout=nil)
        url = self.relative_uri(uri)
        params = params.delete_if {|k,v| v.nil?}
        data = data.delete_if {|k,v| v.nil?}
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

        if response.status_code < 200 || response.status_code >= 300
          raise Twilio::REST::TwilioException.new('Unable to fetch record')
        end

        response.body
      end

      def update(method, uri, params: {}, data: {}, headers: {}, auth: nil, timeout: nil)
        response = self.request(
          method,
          uri,
          params,
          data,
          headers,
          auth,
          timeout
        )

        if response.status_code < 200 || response.status_code >= 300
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

        if response.status_code < 200 || response.status_code >= 300
          raise TwilioException.new('Unable to delete record')
        end

        response.status_code == 204
      end

      def read_limits(limit=nil, page_size=nil)
        page_limit = nil

        unless limit.nil?
          # If there is no user-specified page_size, pick the most network efficient size
          page_size ||= [limit, MAX_PAGE_SIZE].min
          page_limit = (limit / page_size.to_f).ceil
        end

        {
          limit: limit || nil,
          page_size: page_size || nil,
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

      def stream(page, limit: nil, page_limit: nil)
        RecordStream.new(page, limit: limit, page_limit: page_limit)
      end

      def create(method, uri, params: {}, data: {}, headers: {}, auth: nil, timeout: nil)
        response = self.request(
                    method,
                    uri,
                    params,
                    data,
                    headers,
                    auth,
                    timeout)

        if response.status_code < 200 || response.status_code >= 300
          raise TwilioException.new("[#{response.status_code}] Unable to create record\n#{response.body}")
        end

        return response.body
      end
    end
  end
end
