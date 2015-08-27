class Twiliodeck < Holodeck
  @sub_resources = {
    conversations: ConversationsHolodeckResource,
    lookups: LookupsHolodeckResource,
    monitor: MonitorHolodeckResource,
    pricing: PricingHolodeckResource,
    taskrouter: TaskrouterHolodeckResource,
    v2010: V2010HolodeckResource
  }
  @holograms = {}
end