# frozen_string_literal: true

module Twilio
  module REST
    class TokenPaginationPage < Page
      attr_accessor :key, :page_size, :url

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
        @page_size = @payload['meta'] && @payload['meta']['pageSize']
        @next_token = @payload['meta'] && @payload['meta']['nextToken']
        @previous_token = @payload['previousToken']
      end

      def previous_token
        if @payload['meta'] && @payload['meta']['previousToken']
          @payload['meta']['previousToken']
          end
        nil
      end

      def previous_page
        return nil unless previous_page_url

        response = @version.domain.request('GET', previous_page_url, @params)

        self.class.new(@version, response, @solution)
      end

      def next_token
        if @payload['meta'] && @payload['meta']['nextToken']
          @payload['meta']['nextToken']
        nil
      end

      def previous_page_url
        if previous_token.nil?
          return nil
        end
        @params['PageToken'] = previous_token
        @version.domain.absolute_url(@url)
      end

      def next_page_url
        if next_token.nil?
          return nil
        end
        @params['pageToken'] = next_token
        @version.domain.absolute_url(@url)
      end

      def next_page
        return nil unless next_page_url

        response = @version.domain.request('GET', next_page_url, @params)

        self.class.new(@version, response, @solution)
      end

      def load_page(payload)
        if !@key
          @key = payload['meta'] && payload['meta']['key']
        end
        if @key && @payload[@key]
          return @payload[@key]
        end
        raise Twilio::REST::TwilioError, 'Page Records can not be deserialized'
      end
      end
    end
  end
end
