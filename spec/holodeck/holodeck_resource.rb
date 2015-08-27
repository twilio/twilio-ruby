class HolodeckResource
  DEFAULT_HEADERS = {}
  @sub_resources = {}
  @holograms = []

  def self.activate(holodeck)
    @holograms.each do |h|
      holodeck.add(h)
    end

    @sub_resources.each do |k, v|
      v.activate(holodeck)
    end
  end
end
