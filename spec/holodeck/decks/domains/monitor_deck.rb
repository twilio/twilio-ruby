class MonitorHolodeckResource < HolodeckResource
  @sub_resources = {
      events: MonitorHolodeckResource::EventInstanceHolodeckResource,
      alerts: MonitorHolodeckResource::AlertInstanceHolodeckResource,
  }
  @holograms = []
end