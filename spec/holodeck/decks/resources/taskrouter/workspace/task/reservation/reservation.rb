class ReservationInstanceHolodeckResource < HolodeckResource
  @@handlers = [
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb/Tasks/WTbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb/Reservations",
          auth: ["ACbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "task_reservation_200.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Tasks/WTaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Reservations",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "task_reservation_200.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Tasks/WTaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Reservations/WRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "task_reservation_200.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Tasks/WTaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Reservations",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "task_reservation_200.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Tasks/WTaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Reservations/WRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "task_reservation_200.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "DELETE",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Tasks/WTaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Reservations/WRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 204,
          content_file: File.join(File.dirname(__FILE__), "task_reservation_204.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSllllllllllllllllllllllllllllllll/Tasks/WTllllllllllllllllllllllllllllllll/Reservations",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "task_reservation_401.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSllllllllllllllllllllllllllllllll/Tasks/WTllllllllllllllllllllllllllllllll/Reservations/WRllllllllllllllllllllllllllllllll",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "task_reservation_401.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSllllllllllllllllllllllllllllllll/Tasks/WTllllllllllllllllllllllllllllllll/Reservations/WRllllllllllllllllllllllllllllllll",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "task_reservation_401.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "DELETE",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSllllllllllllllllllllllllllllllll/Tasks/WTllllllllllllllllllllllllllllllll/Reservations/WRllllllllllllllllllllllllllllllll",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "task_reservation_401.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSllllllllllllllllllllllllllllllll/Tasks/WTllllllllllllllllllllllllllllllll/Reservations",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "task_reservation_401.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Tasks/WTkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Reservations/WRkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "task_reservation_404.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Tasks/WTkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Reservations/WRkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "task_reservation_404.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Tasks/WTkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Reservations",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "task_reservation_404.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Tasks/WTkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Reservations",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "task_reservation_404.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "DELETE",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Tasks/WTkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Reservations/WRkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "task_reservation_404.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "DELETE",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Tasks/WTmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Reservations/WRmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "task_reservation_500.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Tasks/WTmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Reservations",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "task_reservation_500.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Tasks/WTmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Reservations/WRmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "task_reservation_500.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Tasks/WTmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Reservations/WRmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "task_reservation_500.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Tasks/WTmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Reservations",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "task_reservation_500.json"),
          params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
  ]
end