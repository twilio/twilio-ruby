require 'base64'

class Holodeck
  attr_accessor :host, :port

  class Request
    attr_reader :method, :url, :auth, :params, :data, :headers, :any

    def initialize(method: nil, url: nil, auth: nil, params: {}, data: {}, headers: nil, any: false)
      @method = method
      @url = url
      @auth = auth
      @params = params
      @data = data
      @headers = headers
      @any = any
    end

    def any?
      @any
    end

    def ==(other)
      method.casecmp(other.method.upcase).zero? &&
        url == other.url &&
        params == other.params &&
        data == other.data
    end

    def to_s
      "#<Holodeck::Request method:#{method} url:#{url} params:#{params} data:#{data}>"
    end
  end

  ANY = Request.new(any: true)

  def initialize
    @response = nil
    @requests = []
  end

  def mock(response)
    @response = response
  end

  def request(host, port, method, url, params = {}, data = {}, headers = {}, auth = nil, _timeout = nil)
    @requests << Request.new(
      method: method,
      url: url,
      params: params,
      data: data,
      headers: headers,
      auth: auth
    )
    @response
  end

  def has_request?(request)
    @requests.include?(request)
  end
end
