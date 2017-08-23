module Twilio
  class Request
    attr_reader :host, :port, :method, :url, :params, :data, :headers, :auth, :timeout

    def initialize(host, port, method, url, params, data, headers, auth, timeout)
      @host = host
      @port = port
      @url = url
      @method = method
      @params = params
      @data = data
      @headers = headers
      @auth = auth
      @timeout = timeout
    end

    def to_s
      auth = @auth.nil? ? '' : '(' + @auth.join(",") + ')'

      params = ''
      unless @params.nil?
        params = @params.empty? ? '' : "?" + @params.each.map{|key, value|
          "#{CGI.escape(key)}=#{CGI.escape(value)}"}.join("&")
      end

      headers = ''
      unless @headers.nil?
        headers = @headers.empty? ? '' : "\n" + @headers.each.map{|key, value| "-H \"#{key}\": \"#{value}\""}.join("\n")
      end

      data = ''
      unless @data.nil?
        data = @method.equal?('GET') ? "\n -G" : "\n"
        data = @data.empty? ? '' : data + @data.each.map{|key, value| "-d \"#{key}\"=\"#{value}\""}.join("\n")
      end

      "#{auth} #{@method} #{@url}#{params}#{data}#{headers}"
    end
  end
end