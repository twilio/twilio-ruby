require 'json'

class Hologram
  attr_reader :method, :url, :auth, :status_code, :content_file, :params, :headers

  def initialize(params = {})
    @method = params[:method]
    @url = params[:url]
    @auth = params[:auth]
    @status_code = params[:status_code]
    @content_file = params[:content_file]
    @params = JSON.parse(params[:params])
    @headers = params[:headers]
  end

  def simulate(method, url, params)
    if method == @method && url == @url && params == @params
      JSON.parse(@content_file)
    end
  end
end
