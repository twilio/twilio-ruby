require 'base64'

class Holodeck
  attr_accessor :host, :port

  class Request
    attr_reader :method, :url, :auth, :params, :data, :headers, :any

    def initialize(method: nil, url: nil, auth: nil, params: {}, data: {}, headers: {}, any: false)
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
      if method.casecmp(other.method.upcase).zero? &&
         url == other.url &&
         params == other.params &&
         data == other.data
        other.headers.each do |h, value|
          return false unless headers[h] == value
        end
        true
      end
    end

    def to_s
      "#<Holodeck::Request method:#{method} url:#{url} params:#{params} data:#{data} headers:#{headers}>"
    end
  end

  ANY = Request.new(any: true)

  def initialize
    @responses = []
    @requests = []
  end

  def mock(response)
    @responses << response
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
    @responses.shift
  end

  def has_request?(request)
    @requests.include?(request)
  end
end
