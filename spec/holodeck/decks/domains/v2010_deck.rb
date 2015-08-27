class V2010HolodeckResource < HolodeckResource
  @sub_resources = {
      accounts: AccountInstanceHolodeckResource,
  }
  @holograms = []
end