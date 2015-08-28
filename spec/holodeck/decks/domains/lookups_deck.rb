class LookupsHolodeckResource < HolodeckResource
  @sub_resources = {
      phone_numbers: LookupsHolodeckResource::PhoneNumberInstanceHolodeckResource,
  }
  @holograms = []
end