class Holodeck
  @sub_resources = {}
  @holograms = {}
  @active = false

  class MissingHologram < StandardError
    def message
      "Could not find matching Hologram for #{super}"
    end
  end

  def self.activate
    raise "Holodeck already active!" if @active
    @active = true

    @sub_resources.each do |k, v|
      v.activate(self)
    end

    # Monkey patch BaseClient get/post/put/delete
    holodeck_class = self
    base_client = Twilio::REST::BaseClient
    m = base_client.instance_method(:connect_and_send)
    base_client.send :define_method, 'original_connect_and_send', m
    base_client.send :define_method, :connect_and_send, &lambda {|request|
      holodeck_class.process_request(self.class.host, request)
    }
  end

  def self.begin_program(&block)
    activate
    block.call
  ensure
    deactivate
  end

  def self.deactivate
    @active = false
    @holograms = {}

    # Restore BaseClient
    base_client = Twilio::REST::BaseClient
    m = base_client.instance_method('original_connect_and_send')
    base_client.send :define_method, :connect_and_send, m
  end

  def self.add(hologram)
    @holograms[hologram.url] ||= []
    @holograms[hologram.url] << hologram
  end

  def self.process_request(host, request)
    method = request.method.upcase
    path = "https://#{host}" + request.path.split('?')[0]
    query_params = request.path.split('?')[1] if request.path.include?('?')
    form_params = request.body

    @holograms[path].each do |h|
      response = h.simulate(method, path, query_params, form_params)
      return response if response
    end if @holograms[path]

    raise MissingHologram, path
  end

  def method_missing(name, *args)
    super unless subresource = @sub_resources[name]
    subresource
  end
end
