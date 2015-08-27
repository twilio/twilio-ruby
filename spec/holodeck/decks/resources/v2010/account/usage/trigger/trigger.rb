class TriggerInstanceHolodeckResource < HolodeckResource
  @sub_resources = {}
  @holograms = [
      Hologram.new(
          method: "GET",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Usage/Triggers.json?Page=0&PageSize=50",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "usage_trigger_read_200_empty.json"),
          query_params: '{"Recurring": "recurring", "TriggerBy": "trigger_by", "UsageCategory": "usage_category"}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Usage/Triggers/UTaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/UTaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "usage_trigger_fetch_200.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb/Usage/Triggers.json?Page=0&PageSize=50",
          auth: ["ACbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "usage_trigger_read_200_partial.json"),
          query_params: '{"Recurring": "recurring", "TriggerBy": "trigger_by", "UsageCategory": "usage_category"}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACcccccccccccccccccccccccccccccccc/Usage/Triggers.json?Page=0&PageSize=50",
          auth: ["ACcccccccccccccccccccccccccccccccc", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "usage_trigger_read_200_multi.json"),
          query_params: '{"Recurring": "recurring", "TriggerBy": "trigger_by", "UsageCategory": "usage_category"}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Usage/Triggers.json?Page=0&PageSize=50",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "usage_trigger_create_200.json"),
          query_params: '{}',
          form_params: '{"CallbackMethod": "GET", "CallbackUrl": "https://example.com", "FriendlyName": "friendly_name", "Recurring": "recurring", "TriggerBy": "trigger_by", "TriggerValue": "trigger_value", "UsageCategory": "usage_category"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Usage/Triggers/UTaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/UTaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "usage_trigger_update_200.json"),
          query_params: '{}',
          form_params: '{"CallbackMethod": "GET", "CallbackUrl": "https://example.com", "FriendlyName": "friendly_name"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "DELETE",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Usage/Triggers/UTaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/UTaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 204,
          content_file: File.join(File.dirname(__FILE__), "usage_trigger_delete_204.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "DELETE",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACllllllllllllllllllllllllllllllll/Usage/Triggers/UTllllllllllllllllllllllllllllllll/UTllllllllllllllllllllllllllllllll.json",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "usage_trigger_delete_401.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACllllllllllllllllllllllllllllllll/Usage/Triggers.json?Page=0&PageSize=50",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "usage_trigger_read_401.json"),
          query_params: '{"Recurring": "recurring", "TriggerBy": "trigger_by", "UsageCategory": "usage_category"}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACllllllllllllllllllllllllllllllll/Usage/Triggers/UTllllllllllllllllllllllllllllllll/UTllllllllllllllllllllllllllllllll.json",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "usage_trigger_fetch_401.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACllllllllllllllllllllllllllllllll/Usage/Triggers.json?Page=0&PageSize=50",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "usage_trigger_create_401.json"),
          query_params: '{}',
          form_params: '{"CallbackMethod": "GET", "CallbackUrl": "https://example.com", "FriendlyName": "friendly_name", "Recurring": "recurring", "TriggerBy": "trigger_by", "TriggerValue": "trigger_value", "UsageCategory": "usage_category"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACllllllllllllllllllllllllllllllll/Usage/Triggers/UTllllllllllllllllllllllllllllllll/UTllllllllllllllllllllllllllllllll.json",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "usage_trigger_update_401.json"),
          query_params: '{}',
          form_params: '{"CallbackMethod": "GET", "CallbackUrl": "https://example.com", "FriendlyName": "friendly_name"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "DELETE",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Usage/Triggers/UTkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/UTkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk.json",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "usage_trigger_delete_404.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Usage/Triggers.json?Page=0&PageSize=50",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "usage_trigger_read_404.json"),
          query_params: '{"Recurring": "recurring", "TriggerBy": "trigger_by", "UsageCategory": "usage_category"}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Usage/Triggers/UTkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/UTkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk.json",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "usage_trigger_fetch_404.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Usage/Triggers.json?Page=0&PageSize=50",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "usage_trigger_create_404.json"),
          query_params: '{}',
          form_params: '{"CallbackMethod": "GET", "CallbackUrl": "https://example.com", "FriendlyName": "friendly_name", "Recurring": "recurring", "TriggerBy": "trigger_by", "TriggerValue": "trigger_value", "UsageCategory": "usage_category"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Usage/Triggers/UTkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/UTkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk.json",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "usage_trigger_update_404.json"),
          query_params: '{}',
          form_params: '{"CallbackMethod": "GET", "CallbackUrl": "https://example.com", "FriendlyName": "friendly_name"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "DELETE",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Usage/Triggers/UTmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/UTmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm.json",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "usage_trigger_delete_500.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Usage/Triggers.json?Page=0&PageSize=50",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "usage_trigger_read_500.json"),
          query_params: '{"Recurring": "recurring", "TriggerBy": "trigger_by", "UsageCategory": "usage_category"}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Usage/Triggers/UTmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/UTmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm.json",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "usage_trigger_fetch_500.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Usage/Triggers.json?Page=0&PageSize=50",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "usage_trigger_create_500.json"),
          query_params: '{}',
          form_params: '{"CallbackMethod": "GET", "CallbackUrl": "https://example.com", "FriendlyName": "friendly_name", "Recurring": "recurring", "TriggerBy": "trigger_by", "TriggerValue": "trigger_value", "UsageCategory": "usage_category"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Usage/Triggers/UTmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/UTmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm.json",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "usage_trigger_update_500.json"),
          query_params: '{}',
          form_params: '{"CallbackMethod": "GET", "CallbackUrl": "https://example.com", "FriendlyName": "friendly_name"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
  ]
end