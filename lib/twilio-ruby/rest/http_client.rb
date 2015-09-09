class HTTPClient
  def initialize(config)
    @config = config
    connection_class = Net::HTTP::Proxy config.proxy_addr,
                                        config.proxy_port, config.proxy_user, config.proxy_pass
    @connection = connection_class.new config.host, config.port
    @connection.use_ssl = config.use_ssl
    if @config.ssl_verify_peer
      @connection.verify_mode = OpenSSL::SSL::VERIFY_PEER
      @connection.ca_file = config.ssl_ca_file
    else
      @connection.verify_mode = OpenSSL::SSL::VERIFY_NONE
    end
    @connection.open_timeout = config.timeout
    @connection.read_timeout = config.timeout
  end

  def request(request)
    @last_request = request
    retries_left = @config.retry_limit
    response = @connection.request request
    @last_response = response
    if response.body and !response.body.empty?
      object = response.body
    elsif response.kind_of? Net::HTTPBadRequest
      object = { message: 'Bad request', code: 400 }.to_json
    end

    TwilioResponse.new(response.status_code, object)
  end
end
