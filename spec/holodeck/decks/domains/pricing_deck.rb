class PricingHolodeckResource < HolodeckResource
  @sub_resources = {
      voice: PricingHolodeckResource::VoiceInstanceHolodeckResource,
      phone_numbers: PricingHolodeckResource::PhoneNumberInstanceHolodeckResource,
  }
  @holograms = []
end