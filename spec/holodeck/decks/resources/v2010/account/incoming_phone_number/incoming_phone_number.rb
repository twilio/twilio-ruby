require './spec/holodeck/decks/resources/v2010/account/incoming_phone_number/local/local.rb'

require './spec/holodeck/decks/resources/v2010/account/incoming_phone_number/mobile/mobile.rb'

require './spec/holodeck/decks/resources/v2010/account/incoming_phone_number/toll_free/toll_free.rb'

class IncomingPhoneNumberInstanceHolodeckResource < HolodeckResource
  @sub_resources = {
      local: LocalInstanceHolodeckResource,
      mobile: MobileInstanceHolodeckResource,
      toll_free: TollFreeInstanceHolodeckResource,
  }
  @holograms = [
      Hologram.new(
          method: "GET",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IncomingPhoneNumbers.json",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "incoming_phone_number_read_200_empty.json"),
          query_params: '{"Beta": "true", "FriendlyName": "friendly_name", "PhoneNumber": "phone_number"}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IncomingPhoneNumbers/PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "incoming_phone_number_fetch_200.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb/IncomingPhoneNumbers.json",
          auth: ["ACbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "incoming_phone_number_read_200_partial.json"),
          query_params: '{"Beta": "true", "FriendlyName": "friendly_name", "PhoneNumber": "phone_number"}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IncomingPhoneNumbers.json",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "incoming_phone_number_create_200.json"),
          query_params: '{}',
          form_params: '{"ApiVersion": "api_version", "FriendlyName": "friendly_name", "PhoneNumber": "phone_number", "SmsApplicationSid": "sms_application_sid", "SmsFallbackMethod": "GET", "SmsFallbackUrl": "https://example.com", "SmsMethod": "GET", "SmsUrl": "https://example.com", "StatusCallback": "https://example.com", "StatusCallbackMethod": "GET", "VoiceApplicationSid": "voice_application_sid", "VoiceCallerIdLookup": "true", "VoiceFallbackMethod": "GET", "VoiceFallbackUrl": "https://example.com", "VoiceMethod": "GET", "VoiceUrl": "https://example.com"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IncomingPhoneNumbers/PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "incoming_phone_number_update_200.json"),
          query_params: '{}',
          form_params: '{"AccountSid": "account_sid", "ApiVersion": "api_version", "FriendlyName": "friendly_name", "SmsApplicationSid": "sms_application_sid", "SmsFallbackMethod": "GET", "SmsFallbackUrl": "https://example.com", "SmsMethod": "GET", "SmsUrl": "https://example.com", "StatusCallback": "https://example.com", "StatusCallbackMethod": "GET", "VoiceApplicationSid": "voice_application_sid", "VoiceCallerIdLookup": "true", "VoiceFallbackMethod": "GET", "VoiceFallbackUrl": "https://example.com", "VoiceMethod": "GET", "VoiceUrl": "https://example.com"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "DELETE",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IncomingPhoneNumbers/PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 204,
          content_file: File.join(File.dirname(__FILE__), "incoming_phone_number_delete_204.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "DELETE",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACllllllllllllllllllllllllllllllll/IncomingPhoneNumbers/PNllllllllllllllllllllllllllllllll.json",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "incoming_phone_number_delete_401.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACllllllllllllllllllllllllllllllll/IncomingPhoneNumbers.json",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "incoming_phone_number_read_401.json"),
          query_params: '{"Beta": "true", "FriendlyName": "friendly_name", "PhoneNumber": "phone_number"}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACllllllllllllllllllllllllllllllll/IncomingPhoneNumbers/PNllllllllllllllllllllllllllllllll.json",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "incoming_phone_number_fetch_401.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACllllllllllllllllllllllllllllllll/IncomingPhoneNumbers.json",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "incoming_phone_number_create_401.json"),
          query_params: '{}',
          form_params: '{"ApiVersion": "api_version", "FriendlyName": "friendly_name", "PhoneNumber": "phone_number", "SmsApplicationSid": "sms_application_sid", "SmsFallbackMethod": "GET", "SmsFallbackUrl": "https://example.com", "SmsMethod": "GET", "SmsUrl": "https://example.com", "StatusCallback": "https://example.com", "StatusCallbackMethod": "GET", "VoiceApplicationSid": "voice_application_sid", "VoiceCallerIdLookup": "true", "VoiceFallbackMethod": "GET", "VoiceFallbackUrl": "https://example.com", "VoiceMethod": "GET", "VoiceUrl": "https://example.com"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACllllllllllllllllllllllllllllllll/IncomingPhoneNumbers/PNllllllllllllllllllllllllllllllll.json",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "incoming_phone_number_update_401.json"),
          query_params: '{}',
          form_params: '{"AccountSid": "account_sid", "ApiVersion": "api_version", "FriendlyName": "friendly_name", "SmsApplicationSid": "sms_application_sid", "SmsFallbackMethod": "GET", "SmsFallbackUrl": "https://example.com", "SmsMethod": "GET", "SmsUrl": "https://example.com", "StatusCallback": "https://example.com", "StatusCallbackMethod": "GET", "VoiceApplicationSid": "voice_application_sid", "VoiceCallerIdLookup": "true", "VoiceFallbackMethod": "GET", "VoiceFallbackUrl": "https://example.com", "VoiceMethod": "GET", "VoiceUrl": "https://example.com"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "DELETE",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/IncomingPhoneNumbers/PNkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk.json",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "incoming_phone_number_delete_404.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/IncomingPhoneNumbers.json",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "incoming_phone_number_read_404.json"),
          query_params: '{"Beta": "true", "FriendlyName": "friendly_name", "PhoneNumber": "phone_number"}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/IncomingPhoneNumbers/PNkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk.json",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "incoming_phone_number_fetch_404.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/IncomingPhoneNumbers.json",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "incoming_phone_number_create_404.json"),
          query_params: '{}',
          form_params: '{"ApiVersion": "api_version", "FriendlyName": "friendly_name", "PhoneNumber": "phone_number", "SmsApplicationSid": "sms_application_sid", "SmsFallbackMethod": "GET", "SmsFallbackUrl": "https://example.com", "SmsMethod": "GET", "SmsUrl": "https://example.com", "StatusCallback": "https://example.com", "StatusCallbackMethod": "GET", "VoiceApplicationSid": "voice_application_sid", "VoiceCallerIdLookup": "true", "VoiceFallbackMethod": "GET", "VoiceFallbackUrl": "https://example.com", "VoiceMethod": "GET", "VoiceUrl": "https://example.com"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/IncomingPhoneNumbers/PNkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk.json",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "incoming_phone_number_update_404.json"),
          query_params: '{}',
          form_params: '{"AccountSid": "account_sid", "ApiVersion": "api_version", "FriendlyName": "friendly_name", "SmsApplicationSid": "sms_application_sid", "SmsFallbackMethod": "GET", "SmsFallbackUrl": "https://example.com", "SmsMethod": "GET", "SmsUrl": "https://example.com", "StatusCallback": "https://example.com", "StatusCallbackMethod": "GET", "VoiceApplicationSid": "voice_application_sid", "VoiceCallerIdLookup": "true", "VoiceFallbackMethod": "GET", "VoiceFallbackUrl": "https://example.com", "VoiceMethod": "GET", "VoiceUrl": "https://example.com"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "DELETE",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/IncomingPhoneNumbers/PNmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm.json",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "incoming_phone_number_delete_500.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/IncomingPhoneNumbers.json",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "incoming_phone_number_read_500.json"),
          query_params: '{"Beta": "true", "FriendlyName": "friendly_name", "PhoneNumber": "phone_number"}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/IncomingPhoneNumbers/PNmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm.json",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "incoming_phone_number_fetch_500.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/IncomingPhoneNumbers.json",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "incoming_phone_number_create_500.json"),
          query_params: '{}',
          form_params: '{"ApiVersion": "api_version", "FriendlyName": "friendly_name", "PhoneNumber": "phone_number", "SmsApplicationSid": "sms_application_sid", "SmsFallbackMethod": "GET", "SmsFallbackUrl": "https://example.com", "SmsMethod": "GET", "SmsUrl": "https://example.com", "StatusCallback": "https://example.com", "StatusCallbackMethod": "GET", "VoiceApplicationSid": "voice_application_sid", "VoiceCallerIdLookup": "true", "VoiceFallbackMethod": "GET", "VoiceFallbackUrl": "https://example.com", "VoiceMethod": "GET", "VoiceUrl": "https://example.com"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/IncomingPhoneNumbers/PNmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm.json",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "incoming_phone_number_update_500.json"),
          query_params: '{}',
          form_params: '{"AccountSid": "account_sid", "ApiVersion": "api_version", "FriendlyName": "friendly_name", "SmsApplicationSid": "sms_application_sid", "SmsFallbackMethod": "GET", "SmsFallbackUrl": "https://example.com", "SmsMethod": "GET", "SmsUrl": "https://example.com", "StatusCallback": "https://example.com", "StatusCallbackMethod": "GET", "VoiceApplicationSid": "voice_application_sid", "VoiceCallerIdLookup": "true", "VoiceFallbackMethod": "GET", "VoiceFallbackUrl": "https://example.com", "VoiceMethod": "GET", "VoiceUrl": "https://example.com"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
  ]
end