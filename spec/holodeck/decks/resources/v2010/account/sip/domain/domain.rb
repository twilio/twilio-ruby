require './spec/holodeck/decks/resources/v2010/account/sip/domain/ip_access_control_list_mapping/ip_access_control_list_mapping.rb'

require './spec/holodeck/decks/resources/v2010/account/sip/domain/credential_list_mapping/credential_list_mapping.rb'

class DomainInstanceHolodeckResource < HolodeckResource
  @sub_resources = {
      ip_access_control_list_mappings: IpAccessControlListMappingInstanceHolodeckResource,
      credential_list_mappings: CredentialListMappingInstanceHolodeckResource,
  }
  @holograms = [
      Hologram.new(
          method: "GET",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/Domains.json",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "sip_domain_read_200_empty.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/Domains/SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "sip_domain_fetch_200.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb/SIP/Domains.json",
          auth: ["ACbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "sip_domain_read_200_partial.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/Domains.json",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "sip_domain_create_200.json"),
          query_params: '{}',
          form_params: '{"DomainName": "domain_name", "FriendlyName": "friendly_name", "VoiceFallbackMethod": "GET", "VoiceFallbackUrl": "https://example.com", "VoiceMethod": "GET", "VoiceStatusCallbackMethod": "GET", "VoiceStatusCallbackUrl": "https://example.com", "VoiceUrl": "https://example.com"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/Domains/SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "sip_domain_update_200.json"),
          query_params: '{}',
          form_params: '{"ApiVersion": "api_version", "FriendlyName": "friendly_name", "VoiceFallbackMethod": "GET", "VoiceFallbackUrl": "https://example.com", "VoiceMethod": "GET", "VoiceStatusCallbackMethod": "GET", "VoiceStatusCallbackUrl": "https://example.com", "VoiceUrl": "https://example.com"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "DELETE",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/Domains/SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 204,
          content_file: File.join(File.dirname(__FILE__), "sip_domain_delete_204.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "DELETE",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACllllllllllllllllllllllllllllllll/SIP/Domains/SDllllllllllllllllllllllllllllllll.json",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "sip_domain_delete_401.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACllllllllllllllllllllllllllllllll/SIP/Domains.json",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "sip_domain_read_401.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACllllllllllllllllllllllllllllllll/SIP/Domains/SDllllllllllllllllllllllllllllllll.json",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "sip_domain_fetch_401.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACllllllllllllllllllllllllllllllll/SIP/Domains.json",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "sip_domain_create_401.json"),
          query_params: '{}',
          form_params: '{"DomainName": "domain_name", "FriendlyName": "friendly_name", "VoiceFallbackMethod": "GET", "VoiceFallbackUrl": "https://example.com", "VoiceMethod": "GET", "VoiceStatusCallbackMethod": "GET", "VoiceStatusCallbackUrl": "https://example.com", "VoiceUrl": "https://example.com"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACllllllllllllllllllllllllllllllll/SIP/Domains/SDllllllllllllllllllllllllllllllll.json",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "sip_domain_update_401.json"),
          query_params: '{}',
          form_params: '{"ApiVersion": "api_version", "FriendlyName": "friendly_name", "VoiceFallbackMethod": "GET", "VoiceFallbackUrl": "https://example.com", "VoiceMethod": "GET", "VoiceStatusCallbackMethod": "GET", "VoiceStatusCallbackUrl": "https://example.com", "VoiceUrl": "https://example.com"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "DELETE",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/SIP/Domains/SDkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk.json",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "sip_domain_delete_404.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/SIP/Domains.json",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "sip_domain_read_404.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/SIP/Domains/SDkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk.json",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "sip_domain_fetch_404.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/SIP/Domains.json",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "sip_domain_create_404.json"),
          query_params: '{}',
          form_params: '{"DomainName": "domain_name", "FriendlyName": "friendly_name", "VoiceFallbackMethod": "GET", "VoiceFallbackUrl": "https://example.com", "VoiceMethod": "GET", "VoiceStatusCallbackMethod": "GET", "VoiceStatusCallbackUrl": "https://example.com", "VoiceUrl": "https://example.com"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/SIP/Domains/SDkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk.json",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "sip_domain_update_404.json"),
          query_params: '{}',
          form_params: '{"ApiVersion": "api_version", "FriendlyName": "friendly_name", "VoiceFallbackMethod": "GET", "VoiceFallbackUrl": "https://example.com", "VoiceMethod": "GET", "VoiceStatusCallbackMethod": "GET", "VoiceStatusCallbackUrl": "https://example.com", "VoiceUrl": "https://example.com"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "DELETE",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/SIP/Domains/SDmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm.json",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "sip_domain_delete_500.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/SIP/Domains.json",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "sip_domain_read_500.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/SIP/Domains/SDmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm.json",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "sip_domain_fetch_500.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/SIP/Domains.json",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "sip_domain_create_500.json"),
          query_params: '{}',
          form_params: '{"DomainName": "domain_name", "FriendlyName": "friendly_name", "VoiceFallbackMethod": "GET", "VoiceFallbackUrl": "https://example.com", "VoiceMethod": "GET", "VoiceStatusCallbackMethod": "GET", "VoiceStatusCallbackUrl": "https://example.com", "VoiceUrl": "https://example.com"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/SIP/Domains/SDmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm.json",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "sip_domain_update_500.json"),
          query_params: '{}',
          form_params: '{"ApiVersion": "api_version", "FriendlyName": "friendly_name", "VoiceFallbackMethod": "GET", "VoiceFallbackUrl": "https://example.com", "VoiceMethod": "GET", "VoiceStatusCallbackMethod": "GET", "VoiceStatusCallbackUrl": "https://example.com", "VoiceUrl": "https://example.com"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
  ]
end