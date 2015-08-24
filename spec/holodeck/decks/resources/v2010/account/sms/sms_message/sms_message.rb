require './spec/holodeck/decks/resources/v2010/account/message/media/media/media.rb'

class SmsMessageInstanceHolodeckResource < HolodeckResource
  @@sub_resources = {
      media: MediaInstanceHolodeckResource,
  }
  @@handlers = [
      Hologram.new(
          method: "GET",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SMS/Messages/SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "sms_message_200.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SMS/Messages/SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "sms_message_200.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SMS/Messages.json",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "sms_message_200.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SMS/Messages.json",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "sms_message_200.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb/SMS/Messages.json",
          auth: ["ACbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "sms_message_200.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACcccccccccccccccccccccccccccccccc/SMS/Messages.json",
          auth: ["ACcccccccccccccccccccccccccccccccc", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "sms_message_200.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "DELETE",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SMS/Messages/SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 204,
          content_file: File.join(File.dirname(__FILE__), "sms_message_204.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACllllllllllllllllllllllllllllllll/SMS/Messages/SMllllllllllllllllllllllllllllllll.json",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "sms_message_401.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "DELETE",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACllllllllllllllllllllllllllllllll/SMS/Messages/SMllllllllllllllllllllllllllllllll.json",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "sms_message_401.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACllllllllllllllllllllllllllllllll/SMS/Messages.json",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "sms_message_401.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACllllllllllllllllllllllllllllllll/SMS/Messages/SMllllllllllllllllllllllllllllllll.json",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "sms_message_401.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACllllllllllllllllllllllllllllllll/SMS/Messages.json",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "sms_message_401.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "DELETE",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/SMS/Messages/SMkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk.json",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "sms_message_404.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/SMS/Messages.json",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "sms_message_404.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/SMS/Messages.json",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "sms_message_404.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/SMS/Messages/SMkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk.json",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "sms_message_404.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/SMS/Messages/SMkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk.json",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "sms_message_404.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "DELETE",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/SMS/Messages/SMmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm.json",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "sms_message_500.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/SMS/Messages.json",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "sms_message_500.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/SMS/Messages.json",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "sms_message_500.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/SMS/Messages/SMmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm.json",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "sms_message_500.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/SMS/Messages/SMmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm.json",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "sms_message_500.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
  ]
end