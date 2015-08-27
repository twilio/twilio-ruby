require './spec/holodeck/decks/resources/v2010/account/usage/record/all_time/all_time.rb'

require './spec/holodeck/decks/resources/v2010/account/usage/record/daily/daily.rb'

require './spec/holodeck/decks/resources/v2010/account/usage/record/last_month/last_month.rb'

require './spec/holodeck/decks/resources/v2010/account/usage/record/monthly/monthly.rb'

require './spec/holodeck/decks/resources/v2010/account/usage/record/this_month/this_month.rb'

require './spec/holodeck/decks/resources/v2010/account/usage/record/today/today.rb'

require './spec/holodeck/decks/resources/v2010/account/usage/record/yearly/yearly.rb'

require './spec/holodeck/decks/resources/v2010/account/usage/record/yesterday/yesterday.rb'

class RecordInstanceHolodeckResource < HolodeckResource
  @sub_resources = {
      all_time: AllTimeInstanceHolodeckResource,
      daily: DailyInstanceHolodeckResource,
      last_month: LastMonthInstanceHolodeckResource,
      monthly: MonthlyInstanceHolodeckResource,
      this_month: ThisMonthInstanceHolodeckResource,
      today: TodayInstanceHolodeckResource,
      yearly: YearlyInstanceHolodeckResource,
      yesterday: YesterdayInstanceHolodeckResource,
  }
  @holograms = [
      Hologram.new(
          method: "GET",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Usage/Records",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "usage_record_read_200_empty.json"),
          query_params: '{"Category": "category", "EndDate": "end_date", "StartDate": "start_date"}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb/Usage/Records",
          auth: ["ACbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "usage_record_read_200_partial.json"),
          query_params: '{"Category": "category", "EndDate": "end_date", "StartDate": "start_date"}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Usage/Records",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "usage_record_create_200.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACllllllllllllllllllllllllllllllll/Usage/Records",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "usage_record_read_401.json"),
          query_params: '{"Category": "category", "EndDate": "end_date", "StartDate": "start_date"}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACllllllllllllllllllllllllllllllll/Usage/Records",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "usage_record_create_401.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Usage/Records",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "usage_record_read_404.json"),
          query_params: '{"Category": "category", "EndDate": "end_date", "StartDate": "start_date"}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Usage/Records",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "usage_record_create_404.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Usage/Records",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "usage_record_read_500.json"),
          query_params: '{"Category": "category", "EndDate": "end_date", "StartDate": "start_date"}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Usage/Records",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "usage_record_create_500.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
  ]
end