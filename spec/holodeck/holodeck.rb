require 'base64'

class Holodeck
  attr_accessor :host, :port

  class MissingHologram < StandardError
    def message
      "Could not find matching Hologram for #{super}"
    end
  end

  def initialize(config)
    @host = config.host
    @holograms = []
    @requests = []
  end

  def mock(request, response)
    @holograms << Hologram.new(request, response)
  end

  def request(request)
    method = request.method.upcase
    path = "https://#{@host}" + request.path.split('?')[0]
    raw_query = request.path.split('?')[1] if request.path.include?('?')
    raw_form = request.body
    auth = request.get_fields('authorization')[0]
    query = {}
    form = {}

    raw_query.split('&').each do |p|
      p = URI.decode(p)
      k, v = p.split('=')
      query[k.to_sym] = v
    end if raw_query

    raw_form.split('&').each do |p|
      p = URI.decode(p)
      k, v = p.split('=')
      if form[k.to_sym]
        if form[k.to_sym].is_a? Array
          form[k.to_sym] << v
        else
          form[k.to_sym] = [form[k.to_sym][0], v]
        end
      else
        form[k.to_sym] = v
      end
    end if raw_form

    if auth
      auth = Base64.decode64(auth.split(' ')[1])
    end

    hrequest = Hologram::Request.new(method: method,
                                     url: path,
                                     query_params: query,
                                     form_params: form,
                                     auth: auth)
    @requests << hrequest

    @holograms.each do |h|
      response = h.simulate(method, path, auth, hrequest.query_params, hrequest.form_params)
      return response if response
    end

    raise MissingHologram, "#{method} #{path}"
  end

  def requested?(request)
    @requests.include?(request)
  end
end
