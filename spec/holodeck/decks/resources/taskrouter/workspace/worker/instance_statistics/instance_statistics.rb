class StatisticsInstanceHolodeckResource < HolodeckResource
  @sub_resources = {}
  @holograms = [
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.twilio.com/v1Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workers/WKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Statistics",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "worker_instance_statistics_fetch_200.json"),
          query_params: '{"EndDate": "1199174400", "Minutes": "1", "StartDate": "1199174400"}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://taskrouter.twilio.com/v1Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workers/WKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Statistics",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "worker_instance_statistics_update_200.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "DELETE",
          url: "https://taskrouter.twilio.com/v1Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workers/WKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Statistics",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 204,
          content_file: File.join(File.dirname(__FILE__), "worker_instance_statistics_delete_204.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "DELETE",
          url: "https://taskrouter.twilio.com/v1Workspaces/WSllllllllllllllllllllllllllllllll/Workers/WKllllllllllllllllllllllllllllllll/Statistics",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "worker_instance_statistics_delete_401.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.twilio.com/v1Workspaces/WSllllllllllllllllllllllllllllllll/Workers/WKllllllllllllllllllllllllllllllll/Statistics",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "worker_instance_statistics_fetch_401.json"),
          query_params: '{"EndDate": "1199174400", "Minutes": "1", "StartDate": "1199174400"}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://taskrouter.twilio.com/v1Workspaces/WSllllllllllllllllllllllllllllllll/Workers/WKllllllllllllllllllllllllllllllll/Statistics",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "worker_instance_statistics_update_401.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "DELETE",
          url: "https://taskrouter.twilio.com/v1Workspaces/WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Workers/WKkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Statistics",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "worker_instance_statistics_delete_404.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.twilio.com/v1Workspaces/WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Workers/WKkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Statistics",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "worker_instance_statistics_fetch_404.json"),
          query_params: '{"EndDate": "1199174400", "Minutes": "1", "StartDate": "1199174400"}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://taskrouter.twilio.com/v1Workspaces/WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Workers/WKkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Statistics",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "worker_instance_statistics_update_404.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "DELETE",
          url: "https://taskrouter.twilio.com/v1Workspaces/WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Workers/WKmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Statistics",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "worker_instance_statistics_delete_500.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.twilio.com/v1Workspaces/WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Workers/WKmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Statistics",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "worker_instance_statistics_fetch_500.json"),
          query_params: '{"EndDate": "1199174400", "Minutes": "1", "StartDate": "1199174400"}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://taskrouter.twilio.com/v1Workspaces/WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Workers/WKmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Statistics",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "worker_instance_statistics_update_500.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
  ]
end