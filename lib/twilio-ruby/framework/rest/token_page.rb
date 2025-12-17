# frozen_string_literal: true

module Twilio
  module REST
    class TokenPage < Page
      attr_accessor :key, :page_size, :url

      def initialize(version, response)
        super(version, response)

        @client = @version.domain.client.http_client
        @url = ''
        if @client.last_request
          full_url = @client.last_request.url
          uri = URI.parse(full_url)
          @url = uri.path
          @params = @client.last_request.params
        end
        @page_size = @payload['meta'] && @payload['meta']['pageSize']
        @next_token = @payload['meta'] && @payload['meta']['nextToken']
        @previous_token = @payload['meta'] && @payload['meta']['previousToken']
      end

      def previous_token
        @payload['meta'] && @payload['meta']['previousToken']
      end

      def previous_page
        cached_url = previous_page_url
        return nil unless cached_url

        response = @version.domain.request('GET', cached_url, @params)

        self.class.new(@version, response, @solution)
      end

      def next_token
        @payload['meta'] && @payload['meta']['nextToken']
      end

      def previous_page_url
        return nil if previous_token.nil?

        @params['pageToken'] = previous_token
        @version.domain.absolute_url(@url)
      end

      def next_page_url
        token = next_token
        return nil if token.nil? || token.to_s.empty?

        @params['pageToken'] = token
        @version.domain.absolute_url(@url)
      end

      def next_page
        cached_url = next_page_url
        return nil unless cached_url

        response = @version.domain.request('GET', cached_url, @params)

        self.class.new(@version, response, @solution)
      end

      def load_page(payload)
        @key ||= payload['meta'] && payload['meta']['key']
        return @payload[@key] if @key && @payload[@key]

        raise Twilio::REST::TwilioError, 'Page Records can not be deserialized'
      end
    end
  end
end
