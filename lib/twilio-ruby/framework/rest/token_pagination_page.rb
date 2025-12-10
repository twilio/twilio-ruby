# frozen_string_literal: true

module Twilio
  module REST
    class TokenPaginationPage < Page
      attr_accessor :key, :page_size, :next_token, :previous_token, :url, :next_page_url, :previous_page_url

      def initialize(version, response)
        super(version, response)

        @client = @version.domain.client.http_client
        @url = ''
        if @client.last_request
          full_url = @client.last_request.url
          uri = URI.parse(full_url)
          @url = uri.path
          @url += "?#{uri.query}" if uri.query
          @params = @client.last_request.params
        end
        @key = @payload['meta'] && @payload['meta']['key'] ? @payload['meta']['key'] : nil
        @page_size = @payload['meta'] && @payload['meta']['page_size']
        @next_token = @payload['meta'] && @payload['meta']['next_token']
        @previous_token = @payload['previous_token']
      end

      def previous_token
        if @payload['meta'] && @payload['meta']['previous_page_token']
          @payload['meta']['previous_page_token']
        else
          nil
        end
      end

      def previous_page
        return nil unless previous_page_url

        response = @version.domain.request('GET', previous_page_url, @params)

        self.class.new(@version, response, @solution)
      end

      def next_token
        if @payload['meta'] && @payload['meta']['next_token']
          @payload['meta']['next_token']
        else
          nil
        end
      end

      def previous_page_url
        @params['PageToken'] = previous_token
        @version.domain.absolute_url(@url)
      end

      def next_page_url
        @params['PageToken'] = next_token
        @version.domain.absolute_url(@url)
      end

      def next_page
        return nil unless next_page_url

        response = @version.domain.request('GET', next_page_url, @params)

        self.class.new(@version, response, @solution)
      end

      def load_page(payload)
        if @payload[@key]
          return @payload[@key]
        end

        raise Twilio::REST::TwilioError, 'Page Records can not be deserialized'
      end
    end
  end
end
