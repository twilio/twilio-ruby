class StatisticsInstanceHolodeckResource < HolodeckResource
  @@handlers = [
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.twilio.com/v1Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workflows/WFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Statistics",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "workflow_statistics_200.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://taskrouter.twilio.com/v1Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workflows/WFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Statistics",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "workflow_statistics_200.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "DELETE",
          url: "https://taskrouter.twilio.com/v1Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workflows/WFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Statistics",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 204,
          content_file: File.join(File.dirname(__FILE__), "workflow_statistics_204.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://taskrouter.twilio.com/v1Workspaces/WSllllllllllllllllllllllllllllllll/Workflows/WFllllllllllllllllllllllllllllllll/Statistics",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "workflow_statistics_401.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.twilio.com/v1Workspaces/WSllllllllllllllllllllllllllllllll/Workflows/WFllllllllllllllllllllllllllllllll/Statistics",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "workflow_statistics_401.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "DELETE",
          url: "https://taskrouter.twilio.com/v1Workspaces/WSllllllllllllllllllllllllllllllll/Workflows/WFllllllllllllllllllllllllllllllll/Statistics",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "workflow_statistics_401.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.twilio.com/v1Workspaces/WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Workflows/WFkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Statistics",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "workflow_statistics_404.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://taskrouter.twilio.com/v1Workspaces/WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Workflows/WFkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Statistics",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "workflow_statistics_404.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "DELETE",
          url: "https://taskrouter.twilio.com/v1Workspaces/WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Workflows/WFkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Statistics",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "workflow_statistics_404.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://taskrouter.twilio.com/v1Workspaces/WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Workflows/WFmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Statistics",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "workflow_statistics_500.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.twilio.com/v1Workspaces/WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Workflows/WFmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Statistics",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "workflow_statistics_500.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "DELETE",
          url: "https://taskrouter.twilio.com/v1Workspaces/WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Workflows/WFmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Statistics",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "workflow_statistics_500.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
  ]
end