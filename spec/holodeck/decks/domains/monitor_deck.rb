class MonitorHolodeckResource < HolodeckResource
  @sub_resources = {
      alerts: MonitorHolodeckResource::AlertInstanceHolodeckResource,
      events: MonitorHolodeckResource::EventInstanceHolodeckResource,
  }
  @holograms = []
end