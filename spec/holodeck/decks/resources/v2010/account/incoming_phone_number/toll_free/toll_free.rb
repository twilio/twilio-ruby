class V2010HolodeckResource < HolodeckResource
  class TollFreeInstanceHolodeckResource < HolodeckResource
    @sub_resources = {}
    @holograms = [
        Hologram.new(
            method: "GET",
            url: "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IncomingPhoneNumbers/TollFree.json",
            auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
            status_code: 200,
            content_file: File.join(File.dirname(__FILE__), "incoming_phone_number_toll_free_read_200_empty.json"),
            query_params: '{"Beta": "true", "FriendlyName": "friendly_name", "PhoneNumber": "phone_number"}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://api.twilio.com/2010-04-01/Accounts/ACbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb/IncomingPhoneNumbers/TollFree.json",
            auth: ["ACbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb", "AUTHTOKEN"],
            status_code: 200,
            content_file: File.join(File.dirname(__FILE__), "incoming_phone_number_toll_free_read_200_partial.json"),
            query_params: '{"Beta": "true", "FriendlyName": "friendly_name", "PhoneNumber": "phone_number"}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IncomingPhoneNumbers/TollFree.json",
            auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
            status_code: 200,
            content_file: File.join(File.dirname(__FILE__), "incoming_phone_number_toll_free_create_200.json"),
            query_params: '{}',
            form_params: '{"ApiVersion": "api_version", "AreaCode": "area_code", "FriendlyName": "friendly_name", "PhoneNumber": "phone_number", "SmsApplicationSid": "sms_application_sid", "SmsFallbackMethod": "GET", "SmsFallbackUrl": "https://example.com", "SmsMethod": "GET", "SmsUrl": "https://example.com", "StatusCallback": "https://example.com", "StatusCallbackMethod": "GET", "VoiceApplicationSid": "voice_application_sid", "VoiceCallerIdLookup": "true", "VoiceFallbackMethod": "GET", "VoiceFallbackUrl": "https://example.com", "VoiceMethod": "GET", "VoiceUrl": "https://example.com"}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://api.twilio.com/2010-04-01/Accounts/ACllllllllllllllllllllllllllllllll/IncomingPhoneNumbers/TollFree.json",
            auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
            status_code: 401,
            content_file: File.join(File.dirname(__FILE__), "incoming_phone_number_toll_free_read_401.json"),
            query_params: '{"Beta": "true", "FriendlyName": "friendly_name", "PhoneNumber": "phone_number"}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://api.twilio.com/2010-04-01/Accounts/ACllllllllllllllllllllllllllllllll/IncomingPhoneNumbers/TollFree.json",
            auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
            status_code: 401,
            content_file: File.join(File.dirname(__FILE__), "incoming_phone_number_toll_free_create_401.json"),
            query_params: '{}',
            form_params: '{"ApiVersion": "api_version", "AreaCode": "area_code", "FriendlyName": "friendly_name", "PhoneNumber": "phone_number", "SmsApplicationSid": "sms_application_sid", "SmsFallbackMethod": "GET", "SmsFallbackUrl": "https://example.com", "SmsMethod": "GET", "SmsUrl": "https://example.com", "StatusCallback": "https://example.com", "StatusCallbackMethod": "GET", "VoiceApplicationSid": "voice_application_sid", "VoiceCallerIdLookup": "true", "VoiceFallbackMethod": "GET", "VoiceFallbackUrl": "https://example.com", "VoiceMethod": "GET", "VoiceUrl": "https://example.com"}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://api.twilio.com/2010-04-01/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/IncomingPhoneNumbers/TollFree.json",
            auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
            status_code: 404,
            content_file: File.join(File.dirname(__FILE__), "incoming_phone_number_toll_free_read_404.json"),
            query_params: '{"Beta": "true", "FriendlyName": "friendly_name", "PhoneNumber": "phone_number"}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://api.twilio.com/2010-04-01/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/IncomingPhoneNumbers/TollFree.json",
            auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
            status_code: 404,
            content_file: File.join(File.dirname(__FILE__), "incoming_phone_number_toll_free_create_404.json"),
            query_params: '{}',
            form_params: '{"ApiVersion": "api_version", "AreaCode": "area_code", "FriendlyName": "friendly_name", "PhoneNumber": "phone_number", "SmsApplicationSid": "sms_application_sid", "SmsFallbackMethod": "GET", "SmsFallbackUrl": "https://example.com", "SmsMethod": "GET", "SmsUrl": "https://example.com", "StatusCallback": "https://example.com", "StatusCallbackMethod": "GET", "VoiceApplicationSid": "voice_application_sid", "VoiceCallerIdLookup": "true", "VoiceFallbackMethod": "GET", "VoiceFallbackUrl": "https://example.com", "VoiceMethod": "GET", "VoiceUrl": "https://example.com"}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://api.twilio.com/2010-04-01/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/IncomingPhoneNumbers/TollFree.json",
            auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
            status_code: 500,
            content_file: File.join(File.dirname(__FILE__), "incoming_phone_number_toll_free_read_500.json"),
            query_params: '{"Beta": "true", "FriendlyName": "friendly_name", "PhoneNumber": "phone_number"}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://api.twilio.com/2010-04-01/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/IncomingPhoneNumbers/TollFree.json",
            auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
            status_code: 500,
            content_file: File.join(File.dirname(__FILE__), "incoming_phone_number_toll_free_create_500.json"),
            query_params: '{}',
            form_params: '{"ApiVersion": "api_version", "AreaCode": "area_code", "FriendlyName": "friendly_name", "PhoneNumber": "phone_number", "SmsApplicationSid": "sms_application_sid", "SmsFallbackMethod": "GET", "SmsFallbackUrl": "https://example.com", "SmsMethod": "GET", "SmsUrl": "https://example.com", "StatusCallback": "https://example.com", "StatusCallbackMethod": "GET", "VoiceApplicationSid": "voice_application_sid", "VoiceCallerIdLookup": "true", "VoiceFallbackMethod": "GET", "VoiceFallbackUrl": "https://example.com", "VoiceMethod": "GET", "VoiceUrl": "https://example.com"}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
    ]
  end
end

class V2010HolodeckResource < HolodeckResource
  class TollFreeInstanceHolodeckResource < HolodeckResource
    @sub_resources = {}
    @holograms = [
        Hologram.new(
            method: "GET",
            url: "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IncomingPhoneNumbers/TollFree.json",
            auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
            status_code: 200,
            content_file: File.join(File.dirname(__FILE__), "incoming_phone_number_toll_free_read_200_empty.json"),
            query_params: '{"Beta": "true", "FriendlyName": "friendly_name", "PhoneNumber": "phone_number"}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://api.twilio.com/2010-04-01/Accounts/ACbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb/IncomingPhoneNumbers/TollFree.json",
            auth: ["ACbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb", "AUTHTOKEN"],
            status_code: 200,
            content_file: File.join(File.dirname(__FILE__), "incoming_phone_number_toll_free_read_200_partial.json"),
            query_params: '{"Beta": "true", "FriendlyName": "friendly_name", "PhoneNumber": "phone_number"}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IncomingPhoneNumbers/TollFree.json",
            auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
            status_code: 200,
            content_file: File.join(File.dirname(__FILE__), "incoming_phone_number_toll_free_create_200.json"),
            query_params: '{}',
            form_params: '{"ApiVersion": "api_version", "AreaCode": "area_code", "FriendlyName": "friendly_name", "PhoneNumber": "phone_number", "SmsApplicationSid": "sms_application_sid", "SmsFallbackMethod": "GET", "SmsFallbackUrl": "https://example.com", "SmsMethod": "GET", "SmsUrl": "https://example.com", "StatusCallback": "https://example.com", "StatusCallbackMethod": "GET", "VoiceApplicationSid": "voice_application_sid", "VoiceCallerIdLookup": "true", "VoiceFallbackMethod": "GET", "VoiceFallbackUrl": "https://example.com", "VoiceMethod": "GET", "VoiceUrl": "https://example.com"}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://api.twilio.com/2010-04-01/Accounts/ACllllllllllllllllllllllllllllllll/IncomingPhoneNumbers/TollFree.json",
            auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
            status_code: 401,
            content_file: File.join(File.dirname(__FILE__), "incoming_phone_number_toll_free_read_401.json"),
            query_params: '{"Beta": "true", "FriendlyName": "friendly_name", "PhoneNumber": "phone_number"}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://api.twilio.com/2010-04-01/Accounts/ACllllllllllllllllllllllllllllllll/IncomingPhoneNumbers/TollFree.json",
            auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
            status_code: 401,
            content_file: File.join(File.dirname(__FILE__), "incoming_phone_number_toll_free_create_401.json"),
            query_params: '{}',
            form_params: '{"ApiVersion": "api_version", "AreaCode": "area_code", "FriendlyName": "friendly_name", "PhoneNumber": "phone_number", "SmsApplicationSid": "sms_application_sid", "SmsFallbackMethod": "GET", "SmsFallbackUrl": "https://example.com", "SmsMethod": "GET", "SmsUrl": "https://example.com", "StatusCallback": "https://example.com", "StatusCallbackMethod": "GET", "VoiceApplicationSid": "voice_application_sid", "VoiceCallerIdLookup": "true", "VoiceFallbackMethod": "GET", "VoiceFallbackUrl": "https://example.com", "VoiceMethod": "GET", "VoiceUrl": "https://example.com"}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://api.twilio.com/2010-04-01/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/IncomingPhoneNumbers/TollFree.json",
            auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
            status_code: 404,
            content_file: File.join(File.dirname(__FILE__), "incoming_phone_number_toll_free_read_404.json"),
            query_params: '{"Beta": "true", "FriendlyName": "friendly_name", "PhoneNumber": "phone_number"}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://api.twilio.com/2010-04-01/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/IncomingPhoneNumbers/TollFree.json",
            auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
            status_code: 404,
            content_file: File.join(File.dirname(__FILE__), "incoming_phone_number_toll_free_create_404.json"),
            query_params: '{}',
            form_params: '{"ApiVersion": "api_version", "AreaCode": "area_code", "FriendlyName": "friendly_name", "PhoneNumber": "phone_number", "SmsApplicationSid": "sms_application_sid", "SmsFallbackMethod": "GET", "SmsFallbackUrl": "https://example.com", "SmsMethod": "GET", "SmsUrl": "https://example.com", "StatusCallback": "https://example.com", "StatusCallbackMethod": "GET", "VoiceApplicationSid": "voice_application_sid", "VoiceCallerIdLookup": "true", "VoiceFallbackMethod": "GET", "VoiceFallbackUrl": "https://example.com", "VoiceMethod": "GET", "VoiceUrl": "https://example.com"}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://api.twilio.com/2010-04-01/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/IncomingPhoneNumbers/TollFree.json",
            auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
            status_code: 500,
            content_file: File.join(File.dirname(__FILE__), "incoming_phone_number_toll_free_read_500.json"),
            query_params: '{"Beta": "true", "FriendlyName": "friendly_name", "PhoneNumber": "phone_number"}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://api.twilio.com/2010-04-01/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/IncomingPhoneNumbers/TollFree.json",
            auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
            status_code: 500,
            content_file: File.join(File.dirname(__FILE__), "incoming_phone_number_toll_free_create_500.json"),
            query_params: '{}',
            form_params: '{"ApiVersion": "api_version", "AreaCode": "area_code", "FriendlyName": "friendly_name", "PhoneNumber": "phone_number", "SmsApplicationSid": "sms_application_sid", "SmsFallbackMethod": "GET", "SmsFallbackUrl": "https://example.com", "SmsMethod": "GET", "SmsUrl": "https://example.com", "StatusCallback": "https://example.com", "StatusCallbackMethod": "GET", "VoiceApplicationSid": "voice_application_sid", "VoiceCallerIdLookup": "true", "VoiceFallbackMethod": "GET", "VoiceFallbackUrl": "https://example.com", "VoiceMethod": "GET", "VoiceUrl": "https://example.com"}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
    ]
  end
end