class MobileInstanceHolodeckResource < HolodeckResource
  @@handlers = [
      Hologram.new(
          method: "GET",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/AvailablePhoneNumbers/US/Mobile.json",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "available_phone_number_mobile_200.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb/AvailablePhoneNumbers/US/Mobile.json",
          auth: ["ACbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "available_phone_number_mobile_200.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/AvailablePhoneNumbers/US/Mobile.json",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "available_phone_number_mobile_200.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACllllllllllllllllllllllllllllllll/AvailablePhoneNumbers/US/Mobile.json",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "available_phone_number_mobile_401.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACllllllllllllllllllllllllllllllll/AvailablePhoneNumbers/US/Mobile.json",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "available_phone_number_mobile_401.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/AvailablePhoneNumbers/US/Mobile.json",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "available_phone_number_mobile_404.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/AvailablePhoneNumbers/US/Mobile.json",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "available_phone_number_mobile_404.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/AvailablePhoneNumbers/US/Mobile.json",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "available_phone_number_mobile_500.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/AvailablePhoneNumbers/US/Mobile.json",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "available_phone_number_mobile_500.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
  ]
end