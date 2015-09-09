require 'json'
require 'uri'

class Hologram
  class Request
    attr_reader :method, :url, :auth, :query_params, :form_params, :headers, :any

    def initialize(params = {})
      @method = params[:method]
      @url = params[:url]
      @auth = params[:auth]
      @auth = @auth.join(':') if @auth && @auth.is_a?(Array)
      @query_params = params[:query_params]
      @form_params = params[:form_params]
      @headers = params[:headers]
      @any = params[:any]
      if @form_params
        @form_params.each do |k, v|
          if v.is_a?(Array) && v.size == 1
            @form_params[k] = v[0]
          else
            @form_params[k] = v
          end
        end
      end
    end

    def any?
      @any
    end

    def ==(other)
      method == other.method &&
      url == other.url &&
      auth == other.auth &&
      query_params == other.query_params &&
      form_params == other.form_params
    end
  end

  ANY = Request.new(any: true)

  def initialize(request, response)
    @request = request
    @response = response
  end

  def simulate(method, url, auth, query = {}, form = {})
    if @request.any? ||
      (method == @request.method &&
      url == @request.url &&
      (!@request.auth || auth == @request.auth) &&
      (!@request.query_params || query == @request.query_params) &&
      (!@request.form_params || form == @request.form_params))

      return @response
    end

    return nil
  end
end
