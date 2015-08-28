class V2010HolodeckResource < HolodeckResource
  @sub_resources = {
      accounts: V2010HolodeckResource::AccountInstanceHolodeckResource,
  }
  @holograms = []
end