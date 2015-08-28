require 'json'
require 'uri'

class Hologram
  attr_reader :method, :url, :auth, :status_code, :content_file, :params, :headers

  def initialize(params = {})
    @method = params[:method]
    @url = params[:url]
    @auth = params[:auth].join(':')
    @status_code = params[:status_code]
    @content_file = params[:content_file]
    @query_params = JSON.parse(params[:query_params])
    @form_params = JSON.parse(params[:form_params])
    @headers = params[:headers]
  end

  def simulate(method, url, auth, raw_query = "", raw_form = "")
    query = {}
    form = {}

    raw_query.split('&').each do |p|
      p = URI.decode(p)
      k, v = p.split('=')
      query[k] = v
    end if raw_query

    raw_form.split('&').each do |p|
      p = URI.decode(p)
      k, v = p.split('=')
      form[k] = v
    end if raw_form

    if method == @method && url == @url && auth == @auth && query == @query_params && form == @form_params
      if @status_code < 200 || @status_code > 299
        json = JSON.parse(File.read(@content_file))
        raise Twilio::REST::RequestError.new json, @status_code
      end
      return JSON.parse(File.read(@content_file))
    end

    return nil
  end
end
