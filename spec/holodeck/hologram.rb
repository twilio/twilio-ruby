class Hologram
  attr_reader :method, :url, :auth, :status_code, :content_file, :params, :headers

  def initialize(method, url, auth, status_code, content_file, params, headers)
    @method = method
    @url = url
    @auth = auth
    @status_code = status_code
    @content_file = content_file
    @params = JSON.parse(params)
    @headers = headers
  end

  def simulate(method, url, params)
    if method == @method && url == @url && params == @params
    end
  end
end
