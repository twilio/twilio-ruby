class MonitorHolodeckResource < HolodeckResource
  @@sub_resources = {
      events: EventInstanceHolodeckResource,
      alerts: AlertInstanceHolodeckResource,
  }
end