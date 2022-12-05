module Twilio
  module REST
    class ClientBase
      @@default_region = 'us1'

      attr_accessor :http_client, :username, :password, :account_sid, :auth_token, :region, :edge, :logger, :user_agent_extensions

      
      ##
      # Makes a request to the Twilio API using the configured http client
      # Authentication information is automatically added if none is provided
      def request(host, port, method, uri, params={}, data={}, headers={}, auth=nil, timeout=nil)
        auth ||= @auth

        ruby_config = RbConfig::CONFIG
        headers['User-Agent'] = "twilio-ruby/#{Twilio::VERSION} (#{ruby_config["host_os"]} #{ruby_config["host_cpu"]}) Ruby/#{RUBY_VERSION}"
        headers['Accept-Charset'] = 'utf-8'

        user_agent_extensions.each { |extension| headers['User-Agent'] += " #{extension}" }

        if method == 'POST' && !headers['Content-Type']
          headers['Content-Type'] = 'application/x-www-form-urlencoded'
        end

        unless headers['Accept']
          headers['Accept'] = 'application/json'
        end

        uri = build_uri(uri)

        if @logger
          @logger.debug("--BEGIN Twilio API Request--")
          @logger.debug("Request Method: <#{method}>")

          headers.each do |key, value|
            unless key.downcase == 'authorization'
              @logger.debug("#{key}:#{value}")
            end
          end

          url = URI(uri)
          @logger.debug("Host:#{url.host}")
          @logger.debug("Path:#{url.path}")
          @logger.debug("Query:#{url.query}")
          @logger.debug("Request Params:#{params}")
        end

        response = @http_client.request(
          host,
          port,
          method,
          uri,
          params,
          data,
          headers,
          auth,
          timeout
        )

        if @logger
          @logger.debug("Response Status Code:#{response.status_code}")
          @logger.debug("Response Headers:#{response.headers}")
          @logger.debug("--END TWILIO API REQUEST--")
        end

        response
      end

      ##
      # Build the final request uri
      def build_uri(uri)
        if @region.nil? and @edge.nil?
          return uri
        end

        parsed_url = URI(uri)
        pieces = parsed_url.host.split('.')
        product = pieces[0]
        domain = pieces[-2, 2]
        new_edge = @edge
        new_region = @region

        if pieces.length == 4
          new_region ||= pieces[1]
        elsif pieces.length == 5
          new_edge ||= pieces[1]
          new_region ||= pieces[2]
        end

        if !new_edge.nil? && new_region.nil?
          new_region = @@default_region
        end

        parsed_url.host = [product, new_edge, new_region, domain].select {|item| !item.nil?}.join('.')
        parsed_url.to_s
      end

      ##
      # Validate the new SSL certificate for the Twilio API
      def validate_ssl_certificate
        response = request('api.twilio.com', '8443', 'GET', 'https://api.twilio.com:8443/.json')
        if response.status_code < 200 || response.status_code >= 300
          raise RestError.new 'Unexpected response from certificate endpoint', response
        end
      end
    end
  end
end