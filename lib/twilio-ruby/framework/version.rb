module Twilio
  module REST
    class Version
      attr_accessor :domain

      class RecordStream
        include Enumerable

        def initialize(page, limit: nil, page_limit: nil)
          @page = page
          @limit = limit
          @page_limit = page_limit
        end

        def each
          current_record = 0
          current_page = 1

          while @page
            @page.each do |record|
              yield record
              current_record += 1
              return nil if @limit && @limit <= current_record
            end

            return nil if @page_limit && @page_limit <= current_page

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
        @domain.absolute_url(relative_uri(uri))
      end

      def relative_uri(uri)
        "#{@version.chomp('/').gsub(/^\//, '')}/#{uri.chomp('/').gsub(/^\//, '')}"
      end

      def request(method, uri, params = {}, data = {}, headers = {}, auth = nil, timeout = nil)
        url = relative_uri(uri)
        params = params.delete_if { |_k, v| v.nil? }
        data = data
        @domain.request(method, url, params, data, headers, auth, timeout)
      end

      def exception(response, header)
        message = header
        code = response.status_code

        if response.body.key?('message')
          message += ": #{response.body['message']}"
        end

        code = response.body['code'] if response.body.key?('code')

        Twilio::REST::RestError.new(message, code, response.status_code)
      end

      def fetch(method, uri, params = {}, data = {}, headers = {}, auth = nil, timeout = nil)
        response = request(
          method,
          uri,
          params,
          data,
          headers,
          auth,
          timeout
        )

        if response.status_code < 200 || response.status_code >= 300
          raise exception(response, 'Unable to fetch record')
        end

        response.body
      end

      def update(method, uri, params: {}, data: {}, headers: {}, auth: nil, timeout: nil)
        response = request(
          method,
          uri,
          params,
          data,
          headers,
          auth,
          timeout
        )

        if response.status_code < 200 || response.status_code >= 300
          raise exception(response, 'Unable to update record')
        end

        response.body
      end

      def delete(method, uri, params = {}, data = {}, headers = {}, auth = nil, timeout = nil)
        response = request(
          method,
          uri,
          params,
          data,
          headers,
          auth,
          timeout
        )

        if response.status_code < 200 || response.status_code >= 300
          raise exception(response, 'Unable to delete record')
        end

        response.status_code == 204
      end

      def read_limits(limit = nil, page_size = nil)
        page_limit = nil

        unless limit.nil?
          # If there is no user-specified page_size, pick the most network efficient size
          page_size = limit
          page_limit = (limit / page_size.to_f).ceil
        end

        {
          limit: limit || nil,
          page_size: page_size || nil,
          page_limit: page_limit
        }
      end

      def page(method, uri, params = {}, data = {}, headers = {}, auth = nil, timeout = nil)
        request(
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
        response = request(method, uri, params, data, headers, auth, timeout)

        if response.status_code < 200 || response.status_code >= 300
          raise exception(response, 'Unable to create record')
        end

        response.body
      end
    end
  end
end
