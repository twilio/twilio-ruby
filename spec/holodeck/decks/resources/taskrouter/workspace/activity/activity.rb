class ActivityInstanceHolodeckResource < HolodeckResource
  @@handlers = [
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.twilio.comhttps://taskrouter.twilio.com/v1/Accounts/ACbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb/Workspaces/WSbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb/Activities",
          auth: ["ACbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "activity_200.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://taskrouter.twilio.com/v1/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Activities/WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "activity_200.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.twilio.comhttps://taskrouter.twilio.com/v1/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Activities",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "activity_200.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://taskrouter.twilio.comhttps://taskrouter.twilio.com/v1/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Activities",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "activity_200.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.twilio.com/v1/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Activities/WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "activity_200.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "DELETE",
          url: "https://taskrouter.twilio.com/v1/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Activities/WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 204,
          content_file: File.join(File.dirname(__FILE__), "activity_204.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://taskrouter.twilio.comhttps://taskrouter.twilio.com/v1/Accounts/ACllllllllllllllllllllllllllllllll/Workspaces/WSllllllllllllllllllllllllllllllll/Activities",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "activity_401.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://taskrouter.twilio.com/v1/Accounts/ACllllllllllllllllllllllllllllllll/Workspaces/WSllllllllllllllllllllllllllllllll/Activities/WAllllllllllllllllllllllllllllllll",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "activity_401.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.twilio.comhttps://taskrouter.twilio.com/v1/Accounts/ACllllllllllllllllllllllllllllllll/Workspaces/WSllllllllllllllllllllllllllllllll/Activities",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "activity_401.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.twilio.com/v1/Accounts/ACllllllllllllllllllllllllllllllll/Workspaces/WSllllllllllllllllllllllllllllllll/Activities/WAllllllllllllllllllllllllllllllll",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "activity_401.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "DELETE",
          url: "https://taskrouter.twilio.com/v1/Accounts/ACllllllllllllllllllllllllllllllll/Workspaces/WSllllllllllllllllllllllllllllllll/Activities/WAllllllllllllllllllllllllllllllll",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "activity_401.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.twilio.comhttps://taskrouter.twilio.com/v1/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Workspaces/WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Activities",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "activity_404.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://taskrouter.twilio.comhttps://taskrouter.twilio.com/v1/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Workspaces/WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Activities",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "activity_404.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "DELETE",
          url: "https://taskrouter.twilio.com/v1/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Workspaces/WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Activities/WAkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "activity_404.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.twilio.com/v1/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Workspaces/WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Activities/WAkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "activity_404.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://taskrouter.twilio.com/v1/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Workspaces/WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Activities/WAkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "activity_404.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://taskrouter.twilio.com/v1/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Workspaces/WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Activities/WAmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "activity_500.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://taskrouter.twilio.comhttps://taskrouter.twilio.com/v1/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Workspaces/WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Activities",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "activity_500.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "DELETE",
          url: "https://taskrouter.twilio.com/v1/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Workspaces/WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Activities/WAmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "activity_500.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.twilio.com/v1/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Workspaces/WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Activities/WAmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "activity_500.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.twilio.comhttps://taskrouter.twilio.com/v1/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Workspaces/WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Activities",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "activity_500.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
  ]
end