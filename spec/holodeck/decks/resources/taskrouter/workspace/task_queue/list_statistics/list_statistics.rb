class StatisticsInstanceHolodeckResource < HolodeckResource
  @@handlers = [
      Hologram.new(
          method: "POST",
          url: "https://taskrouter.twilio.com/v1Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/TaskQueues/Statistics",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "task_queue_statistics_200.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.twilio.com/v1Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/TaskQueues/Statistics",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "task_queue_statistics_200.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "DELETE",
          url: "https://taskrouter.twilio.com/v1Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/TaskQueues/Statistics",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 204,
          content_file: File.join(File.dirname(__FILE__), "task_queue_statistics_204.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.twilio.com/v1Workspaces/WSllllllllllllllllllllllllllllllll/TaskQueues/Statistics",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "task_queue_statistics_401.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://taskrouter.twilio.com/v1Workspaces/WSllllllllllllllllllllllllllllllll/TaskQueues/Statistics",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "task_queue_statistics_401.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "DELETE",
          url: "https://taskrouter.twilio.com/v1Workspaces/WSllllllllllllllllllllllllllllllll/TaskQueues/Statistics",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "task_queue_statistics_401.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://taskrouter.twilio.com/v1Workspaces/WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/TaskQueues/Statistics",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "task_queue_statistics_404.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "DELETE",
          url: "https://taskrouter.twilio.com/v1Workspaces/WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/TaskQueues/Statistics",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "task_queue_statistics_404.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.twilio.com/v1Workspaces/WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/TaskQueues/Statistics",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "task_queue_statistics_404.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.twilio.com/v1Workspaces/WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/TaskQueues/Statistics",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "task_queue_statistics_500.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "DELETE",
          url: "https://taskrouter.twilio.com/v1Workspaces/WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/TaskQueues/Statistics",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "task_queue_statistics_500.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://taskrouter.twilio.com/v1Workspaces/WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/TaskQueues/Statistics",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "task_queue_statistics_500.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
  ]
end