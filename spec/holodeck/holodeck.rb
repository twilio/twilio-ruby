class Holodeck
  @@sub_resources = {}
  @@holograms = []
  @@active = false

  def self.activate
    raise "Holodeck already active!" if @@active
    @@active = true

    @@sub_resources.each do |r|
      r.activate(self)
    end

    # Monkey patch BaseClient get/post/put/delete
    base_client = Twilio::REST::BaseClient
    [:get, :post, :put, :delete].each do |method|
      m = base_client.instance_method(method)
      base_client.send :define_method, 'original_' + method.to_s, m
      base_client.send :define_method, method,
        &lambda { |path, *args|
          path = "https://" + @config.host + "/#{@API_VERSION}" + path
          Holodeck.process_request(method, path, args[0])
        }
    end
  end

  def self.begin_program(&block)
    activate
    block.call
  ensure
    deactivate
  end

  def self.deactivate
    @@active = false
    @@handlers = []

    # Restore BaseClient
    base_client = Twilio::REST::BaseClient
    [:get, :post, :put, :delete].each do |method|
      m = base_client.instance_method('original_' + method.to_s)
      base_client.send :define_method, method, m
    end
  end

  def self.add(hologram)
    @@holograms << hologram
  end

  def self.process_request(method, path, params)
    method.upcase!

    @@holograms.each do |h|
      return response if response = h.simulate(method, path, params)
    end
  end

  def method_missing(name, *args)
    super unless subresource = @@sub_resources[name]
    subresource
  end
end
