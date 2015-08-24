class LookupsHolodeckResource < HolodeckResource
  @@sub_resources = {
      phone_numbers: PhoneNumberInstanceHolodeckResource,
  }
end