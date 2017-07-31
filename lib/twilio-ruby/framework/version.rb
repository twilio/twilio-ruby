module Twilio
  module REST
    # Represents an API Version
    class Version
      attr_accessor :domain

      # Generate records one at a time from a page, stopping at limits.
      class RecordStream
        include Enumerable

        # @param [Page] page the page to stream
        # @param [Integer] limit the max number of records to read
        # @param [Integer] page_limit the max number of pages to read
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

      # @param [Domain] domain The Domain
      def initialize(domain)
        @domain = domain
        @version = nil
      end

      # Convert a relative uri to an absolute url
      def absolute_url(uri)
        @domain.absolute_url(relative_uri(uri))
      end

      # Converts a relative uri into a versioned relative uri
      def relative_uri(uri)
        "#{@version.chomp('/').gsub(/^\//, '')}/#{uri.chomp('/').gsub(/^\//, '')}"
      end

      # Makes an HTTP Request
      def request(method, uri, params = {}, data = {}, headers = {}, auth = nil, timeout = nil)
        url = relative_uri(uri)
        params = params.delete_if { |_k, v| v.nil? }
        data = data
        @domain.request(method, url, params, data, headers, auth, timeout)
      end

      # Wraps an exception response in a Twilio::REST::RestError
      def exception(response, header)
        message = header
        code = response.status_code

        if response.body.key?('message')
          message += ": #{response.body['message']}"
        end

        code = response.body['code'] if response.body.key?('code')

        Twilio::REST::RestError.new(message, code, response.status_code)
      end

      # Fetch a resource instance
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

      # Update a resource instance.
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

      # Delete a resource
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

      # Takes a limit of the max number of records to read and the max_page_size and
      # calculate the max numbers of pages to read.
      # @param [Integer] limit Max number of records to read
      # @param [Integer] page_size Max page siz
      # @return [Hash] The paging limit info
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

      # Makes an HTTP Request
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

      # Create a resource instance
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
