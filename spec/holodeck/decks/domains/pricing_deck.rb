class PricingHolodeckResource < HolodeckResource
  @sub_resources = {
      phone_numbers: PricingHolodeckResource::PhoneNumberInstanceHolodeckResource,
      voice: PricingHolodeckResource::VoiceInstanceHolodeckResource,
  }
  @holograms = []
end