class PricingHolodeckResource < HolodeckResource
  @sub_resources = {
      voice: VoiceInstanceHolodeckResource,
      phone_numbers: PhoneNumberInstanceHolodeckResource,
  }
  @holograms = []
end