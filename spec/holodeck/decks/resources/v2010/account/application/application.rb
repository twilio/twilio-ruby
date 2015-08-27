class ApplicationInstanceHolodeckResource < HolodeckResource
  @sub_resources = {}
  @holograms = [
      Hologram.new(
          method: "GET",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Applications.json",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "application_read_200_empty.json"),
          query_params: '{"FriendlyName": "friendly_name"}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Applications/APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "application_fetch_200.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb/Applications.json",
          auth: ["ACbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "application_read_200_partial.json"),
          query_params: '{"FriendlyName": "friendly_name"}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACcccccccccccccccccccccccccccccccc/Applications.json",
          auth: ["ACcccccccccccccccccccccccccccccccc", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "application_read_200_multi.json"),
          query_params: '{"FriendlyName": "friendly_name"}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Applications.json",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "application_create_200.json"),
          query_params: '{}',
          form_params: '{"ApiVersion": "api_version", "FriendlyName": "friendly_name", "MessageStatusCallback": "https://example.com", "SmsFallbackMethod": "GET", "SmsFallbackUrl": "https://example.com", "SmsMethod": "GET", "SmsStatusCallback": "https://example.com", "SmsUrl": "https://example.com", "StatusCallback": "https://example.com", "StatusCallbackMethod": "GET", "VoiceCallerIdLookup": "true", "VoiceFallbackMethod": "GET", "VoiceFallbackUrl": "https://example.com", "VoiceMethod": "GET", "VoiceUrl": "https://example.com"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Applications/APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "application_update_200.json"),
          query_params: '{}',
          form_params: '{"ApiVersion": "api_version", "FriendlyName": "friendly_name", "MessageStatusCallback": "https://example.com", "SmsFallbackMethod": "GET", "SmsFallbackUrl": "https://example.com", "SmsMethod": "GET", "SmsStatusCallback": "https://example.com", "SmsUrl": "https://example.com", "StatusCallback": "https://example.com", "StatusCallbackMethod": "GET", "VoiceCallerIdLookup": "true", "VoiceFallbackMethod": "GET", "VoiceFallbackUrl": "https://example.com", "VoiceMethod": "GET", "VoiceUrl": "https://example.com"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "DELETE",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Applications/APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 204,
          content_file: File.join(File.dirname(__FILE__), "application_delete_204.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "DELETE",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACllllllllllllllllllllllllllllllll/Applications/APllllllllllllllllllllllllllllllll.json",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "application_delete_401.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACllllllllllllllllllllllllllllllll/Applications.json",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "application_read_401.json"),
          query_params: '{"FriendlyName": "friendly_name"}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACllllllllllllllllllllllllllllllll/Applications/APllllllllllllllllllllllllllllllll.json",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "application_fetch_401.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACllllllllllllllllllllllllllllllll/Applications.json",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "application_create_401.json"),
          query_params: '{}',
          form_params: '{"ApiVersion": "api_version", "FriendlyName": "friendly_name", "MessageStatusCallback": "https://example.com", "SmsFallbackMethod": "GET", "SmsFallbackUrl": "https://example.com", "SmsMethod": "GET", "SmsStatusCallback": "https://example.com", "SmsUrl": "https://example.com", "StatusCallback": "https://example.com", "StatusCallbackMethod": "GET", "VoiceCallerIdLookup": "true", "VoiceFallbackMethod": "GET", "VoiceFallbackUrl": "https://example.com", "VoiceMethod": "GET", "VoiceUrl": "https://example.com"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACllllllllllllllllllllllllllllllll/Applications/APllllllllllllllllllllllllllllllll.json",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "application_update_401.json"),
          query_params: '{}',
          form_params: '{"ApiVersion": "api_version", "FriendlyName": "friendly_name", "MessageStatusCallback": "https://example.com", "SmsFallbackMethod": "GET", "SmsFallbackUrl": "https://example.com", "SmsMethod": "GET", "SmsStatusCallback": "https://example.com", "SmsUrl": "https://example.com", "StatusCallback": "https://example.com", "StatusCallbackMethod": "GET", "VoiceCallerIdLookup": "true", "VoiceFallbackMethod": "GET", "VoiceFallbackUrl": "https://example.com", "VoiceMethod": "GET", "VoiceUrl": "https://example.com"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "DELETE",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Applications/APkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk.json",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "application_delete_404.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Applications.json",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "application_read_404.json"),
          query_params: '{"FriendlyName": "friendly_name"}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Applications/APkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk.json",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "application_fetch_404.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Applications.json",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "application_create_404.json"),
          query_params: '{}',
          form_params: '{"ApiVersion": "api_version", "FriendlyName": "friendly_name", "MessageStatusCallback": "https://example.com", "SmsFallbackMethod": "GET", "SmsFallbackUrl": "https://example.com", "SmsMethod": "GET", "SmsStatusCallback": "https://example.com", "SmsUrl": "https://example.com", "StatusCallback": "https://example.com", "StatusCallbackMethod": "GET", "VoiceCallerIdLookup": "true", "VoiceFallbackMethod": "GET", "VoiceFallbackUrl": "https://example.com", "VoiceMethod": "GET", "VoiceUrl": "https://example.com"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Applications/APkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk.json",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "application_update_404.json"),
          query_params: '{}',
          form_params: '{"ApiVersion": "api_version", "FriendlyName": "friendly_name", "MessageStatusCallback": "https://example.com", "SmsFallbackMethod": "GET", "SmsFallbackUrl": "https://example.com", "SmsMethod": "GET", "SmsStatusCallback": "https://example.com", "SmsUrl": "https://example.com", "StatusCallback": "https://example.com", "StatusCallbackMethod": "GET", "VoiceCallerIdLookup": "true", "VoiceFallbackMethod": "GET", "VoiceFallbackUrl": "https://example.com", "VoiceMethod": "GET", "VoiceUrl": "https://example.com"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "DELETE",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Applications/APmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm.json",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "application_delete_500.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Applications.json",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "application_read_500.json"),
          query_params: '{"FriendlyName": "friendly_name"}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Applications/APmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm.json",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "application_fetch_500.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Applications.json",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "application_create_500.json"),
          query_params: '{}',
          form_params: '{"ApiVersion": "api_version", "FriendlyName": "friendly_name", "MessageStatusCallback": "https://example.com", "SmsFallbackMethod": "GET", "SmsFallbackUrl": "https://example.com", "SmsMethod": "GET", "SmsStatusCallback": "https://example.com", "SmsUrl": "https://example.com", "StatusCallback": "https://example.com", "StatusCallbackMethod": "GET", "VoiceCallerIdLookup": "true", "VoiceFallbackMethod": "GET", "VoiceFallbackUrl": "https://example.com", "VoiceMethod": "GET", "VoiceUrl": "https://example.com"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Applications/APmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm.json",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "application_update_500.json"),
          query_params: '{}',
          form_params: '{"ApiVersion": "api_version", "FriendlyName": "friendly_name", "MessageStatusCallback": "https://example.com", "SmsFallbackMethod": "GET", "SmsFallbackUrl": "https://example.com", "SmsMethod": "GET", "SmsStatusCallback": "https://example.com", "SmsUrl": "https://example.com", "StatusCallback": "https://example.com", "StatusCallbackMethod": "GET", "VoiceCallerIdLookup": "true", "VoiceFallbackMethod": "GET", "VoiceFallbackUrl": "https://example.com", "VoiceMethod": "GET", "VoiceUrl": "https://example.com"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
  ]
end