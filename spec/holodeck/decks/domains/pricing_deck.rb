class PricingHolodeckResource < HolodeckResource
  @@sub_resources = {
      phone_numbers: PhoneNumberInstanceHolodeckResource,
      voice: VoiceInstanceHolodeckResource,
  }
end