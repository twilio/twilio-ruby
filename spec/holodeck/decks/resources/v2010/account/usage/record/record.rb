class V2010HolodeckResource < HolodeckResource
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
        all_time: V2010HolodeckResource::AllTimeInstanceHolodeckResource,
        daily: V2010HolodeckResource::DailyInstanceHolodeckResource,
        last_month: V2010HolodeckResource::LastMonthInstanceHolodeckResource,
        monthly: V2010HolodeckResource::MonthlyInstanceHolodeckResource,
        this_month: V2010HolodeckResource::ThisMonthInstanceHolodeckResource,
        today: V2010HolodeckResource::TodayInstanceHolodeckResource,
        yearly: V2010HolodeckResource::YearlyInstanceHolodeckResource,
        yesterday: V2010HolodeckResource::YesterdayInstanceHolodeckResource,
    }
    @holograms = [
        Hologram.new(
            method: "GET",
            url: "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Usage/Records.json",
            auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
            status_code: 200,
            content_file: File.join(File.dirname(__FILE__), "usage_record_read_200_empty.json"),
            query_params: '{"Category": "category", "EndDate": "end_date", "StartDate": "start_date"}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://api.twilio.com/2010-04-01/Accounts/ACbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb/Usage/Records.json",
            auth: ["ACbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb", "AUTHTOKEN"],
            status_code: 200,
            content_file: File.join(File.dirname(__FILE__), "usage_record_read_200_partial.json"),
            query_params: '{"Category": "category", "EndDate": "end_date", "StartDate": "start_date"}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Usage/Records.json",
            auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
            status_code: 200,
            content_file: File.join(File.dirname(__FILE__), "usage_record_create_200.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://api.twilio.com/2010-04-01/Accounts/ACllllllllllllllllllllllllllllllll/Usage/Records.json",
            auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
            status_code: 401,
            content_file: File.join(File.dirname(__FILE__), "usage_record_read_401.json"),
            query_params: '{"Category": "category", "EndDate": "end_date", "StartDate": "start_date"}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://api.twilio.com/2010-04-01/Accounts/ACllllllllllllllllllllllllllllllll/Usage/Records.json",
            auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
            status_code: 401,
            content_file: File.join(File.dirname(__FILE__), "usage_record_create_401.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://api.twilio.com/2010-04-01/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Usage/Records.json",
            auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
            status_code: 404,
            content_file: File.join(File.dirname(__FILE__), "usage_record_read_404.json"),
            query_params: '{"Category": "category", "EndDate": "end_date", "StartDate": "start_date"}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://api.twilio.com/2010-04-01/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Usage/Records.json",
            auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
            status_code: 404,
            content_file: File.join(File.dirname(__FILE__), "usage_record_create_404.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://api.twilio.com/2010-04-01/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Usage/Records.json",
            auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
            status_code: 500,
            content_file: File.join(File.dirname(__FILE__), "usage_record_read_500.json"),
            query_params: '{"Category": "category", "EndDate": "end_date", "StartDate": "start_date"}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://api.twilio.com/2010-04-01/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Usage/Records.json",
            auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
            status_code: 500,
            content_file: File.join(File.dirname(__FILE__), "usage_record_create_500.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
    ]
  end
end

class V2010HolodeckResource < HolodeckResource
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
        all_time: V2010HolodeckResource::AllTimeInstanceHolodeckResource,
        daily: V2010HolodeckResource::DailyInstanceHolodeckResource,
        last_month: V2010HolodeckResource::LastMonthInstanceHolodeckResource,
        monthly: V2010HolodeckResource::MonthlyInstanceHolodeckResource,
        this_month: V2010HolodeckResource::ThisMonthInstanceHolodeckResource,
        today: V2010HolodeckResource::TodayInstanceHolodeckResource,
        yearly: V2010HolodeckResource::YearlyInstanceHolodeckResource,
        yesterday: V2010HolodeckResource::YesterdayInstanceHolodeckResource,
    }
    @holograms = [
        Hologram.new(
            method: "GET",
            url: "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Usage/Records.json",
            auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
            status_code: 200,
            content_file: File.join(File.dirname(__FILE__), "usage_record_read_200_empty.json"),
            query_params: '{"Category": "category", "EndDate": "end_date", "StartDate": "start_date"}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://api.twilio.com/2010-04-01/Accounts/ACbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb/Usage/Records.json",
            auth: ["ACbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb", "AUTHTOKEN"],
            status_code: 200,
            content_file: File.join(File.dirname(__FILE__), "usage_record_read_200_partial.json"),
            query_params: '{"Category": "category", "EndDate": "end_date", "StartDate": "start_date"}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Usage/Records.json",
            auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
            status_code: 200,
            content_file: File.join(File.dirname(__FILE__), "usage_record_create_200.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://api.twilio.com/2010-04-01/Accounts/ACllllllllllllllllllllllllllllllll/Usage/Records.json",
            auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
            status_code: 401,
            content_file: File.join(File.dirname(__FILE__), "usage_record_read_401.json"),
            query_params: '{"Category": "category", "EndDate": "end_date", "StartDate": "start_date"}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://api.twilio.com/2010-04-01/Accounts/ACllllllllllllllllllllllllllllllll/Usage/Records.json",
            auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
            status_code: 401,
            content_file: File.join(File.dirname(__FILE__), "usage_record_create_401.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://api.twilio.com/2010-04-01/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Usage/Records.json",
            auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
            status_code: 404,
            content_file: File.join(File.dirname(__FILE__), "usage_record_read_404.json"),
            query_params: '{"Category": "category", "EndDate": "end_date", "StartDate": "start_date"}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://api.twilio.com/2010-04-01/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Usage/Records.json",
            auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
            status_code: 404,
            content_file: File.join(File.dirname(__FILE__), "usage_record_create_404.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://api.twilio.com/2010-04-01/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Usage/Records.json",
            auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
            status_code: 500,
            content_file: File.join(File.dirname(__FILE__), "usage_record_read_500.json"),
            query_params: '{"Category": "category", "EndDate": "end_date", "StartDate": "start_date"}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://api.twilio.com/2010-04-01/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Usage/Records.json",
            auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
            status_code: 500,
            content_file: File.join(File.dirname(__FILE__), "usage_record_create_500.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
    ]
  end
end