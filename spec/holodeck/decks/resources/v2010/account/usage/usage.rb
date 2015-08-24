require './spec/holodeck/decks/resources/v2010/account/usage/record/record/record.rb'

require './spec/holodeck/decks/resources/v2010/account/usage/trigger/trigger/trigger.rb'

class UsageInstanceHolodeckResource < HolodeckResource
  @@sub_resources = {
      records: RecordInstanceHolodeckResource,
      triggers: TriggerInstanceHolodeckResource,
  }
  @@handlers = [
      Hologram.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Usage/Records.json",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "usage_200.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Usage/Records.json",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "usage_200.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACllllllllllllllllllllllllllllllll/Usage/Records.json",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "usage_401.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACllllllllllllllllllllllllllllllll/Usage/Records.json",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "usage_401.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Usage/Records.json",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "usage_404.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Usage/Records.json",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "usage_404.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Usage/Records.json",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "usage_500.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Usage/Records.json",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "usage_500.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
  ]
end