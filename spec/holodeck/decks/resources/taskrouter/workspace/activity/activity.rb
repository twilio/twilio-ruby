class TaskrouterHolodeckResource < HolodeckResource
  class ActivityInstanceHolodeckResource < HolodeckResource
    @sub_resources = {}
    @holograms = [
        Hologram.new(
            method: "GET",
            url: "https://taskrouter.twilio.com/v1/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Activities.json",
            auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
            status_code: 200,
            content_file: File.join(File.dirname(__FILE__), "activity_read_200_empty.json"),
            query_params: '{"Available": "available", "FriendlyName": "friendly_name"}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://taskrouter.twilio.com/v1/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Activities/WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
            auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
            status_code: 200,
            content_file: File.join(File.dirname(__FILE__), "activity_fetch_200.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://taskrouter.twilio.com/v1/Accounts/ACbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb/Workspaces/WSbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb/Activities.json",
            auth: ["ACbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb", "AUTHTOKEN"],
            status_code: 200,
            content_file: File.join(File.dirname(__FILE__), "activity_read_200_partial.json"),
            query_params: '{"Available": "available", "FriendlyName": "friendly_name"}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://taskrouter.twilio.com/v1/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Activities.json",
            auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
            status_code: 200,
            content_file: File.join(File.dirname(__FILE__), "activity_create_200.json"),
            query_params: '{}',
            form_params: '{"Available": "true", "FriendlyName": "friendly_name"}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://taskrouter.twilio.com/v1/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Activities/WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
            auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
            status_code: 200,
            content_file: File.join(File.dirname(__FILE__), "activity_update_200.json"),
            query_params: '{}',
            form_params: '{"FriendlyName": "friendly_name"}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "DELETE",
            url: "https://taskrouter.twilio.com/v1/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Activities/WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
            auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
            status_code: 204,
            content_file: File.join(File.dirname(__FILE__), "activity_delete_204.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "DELETE",
            url: "https://taskrouter.twilio.com/v1/Accounts/ACllllllllllllllllllllllllllllllll/Workspaces/WSllllllllllllllllllllllllllllllll/Activities/WAllllllllllllllllllllllllllllllll.json",
            auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
            status_code: 401,
            content_file: File.join(File.dirname(__FILE__), "activity_delete_401.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://taskrouter.twilio.com/v1/Accounts/ACllllllllllllllllllllllllllllllll/Workspaces/WSllllllllllllllllllllllllllllllll/Activities.json",
            auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
            status_code: 401,
            content_file: File.join(File.dirname(__FILE__), "activity_read_401.json"),
            query_params: '{"Available": "available", "FriendlyName": "friendly_name"}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://taskrouter.twilio.com/v1/Accounts/ACllllllllllllllllllllllllllllllll/Workspaces/WSllllllllllllllllllllllllllllllll/Activities/WAllllllllllllllllllllllllllllllll.json",
            auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
            status_code: 401,
            content_file: File.join(File.dirname(__FILE__), "activity_fetch_401.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://taskrouter.twilio.com/v1/Accounts/ACllllllllllllllllllllllllllllllll/Workspaces/WSllllllllllllllllllllllllllllllll/Activities.json",
            auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
            status_code: 401,
            content_file: File.join(File.dirname(__FILE__), "activity_create_401.json"),
            query_params: '{}',
            form_params: '{"Available": "true", "FriendlyName": "friendly_name"}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://taskrouter.twilio.com/v1/Accounts/ACllllllllllllllllllllllllllllllll/Workspaces/WSllllllllllllllllllllllllllllllll/Activities/WAllllllllllllllllllllllllllllllll.json",
            auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
            status_code: 401,
            content_file: File.join(File.dirname(__FILE__), "activity_update_401.json"),
            query_params: '{}',
            form_params: '{"FriendlyName": "friendly_name"}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "DELETE",
            url: "https://taskrouter.twilio.com/v1/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Workspaces/WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Activities/WAkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk.json",
            auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
            status_code: 404,
            content_file: File.join(File.dirname(__FILE__), "activity_delete_404.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://taskrouter.twilio.com/v1/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Workspaces/WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Activities.json",
            auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
            status_code: 404,
            content_file: File.join(File.dirname(__FILE__), "activity_read_404.json"),
            query_params: '{"Available": "available", "FriendlyName": "friendly_name"}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://taskrouter.twilio.com/v1/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Workspaces/WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Activities/WAkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk.json",
            auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
            status_code: 404,
            content_file: File.join(File.dirname(__FILE__), "activity_fetch_404.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://taskrouter.twilio.com/v1/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Workspaces/WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Activities.json",
            auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
            status_code: 404,
            content_file: File.join(File.dirname(__FILE__), "activity_create_404.json"),
            query_params: '{}',
            form_params: '{"Available": "true", "FriendlyName": "friendly_name"}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://taskrouter.twilio.com/v1/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Workspaces/WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Activities/WAkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk.json",
            auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
            status_code: 404,
            content_file: File.join(File.dirname(__FILE__), "activity_update_404.json"),
            query_params: '{}',
            form_params: '{"FriendlyName": "friendly_name"}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "DELETE",
            url: "https://taskrouter.twilio.com/v1/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Workspaces/WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Activities/WAmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm.json",
            auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
            status_code: 500,
            content_file: File.join(File.dirname(__FILE__), "activity_delete_500.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://taskrouter.twilio.com/v1/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Workspaces/WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Activities.json",
            auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
            status_code: 500,
            content_file: File.join(File.dirname(__FILE__), "activity_read_500.json"),
            query_params: '{"Available": "available", "FriendlyName": "friendly_name"}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://taskrouter.twilio.com/v1/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Workspaces/WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Activities/WAmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm.json",
            auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
            status_code: 500,
            content_file: File.join(File.dirname(__FILE__), "activity_fetch_500.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://taskrouter.twilio.com/v1/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Workspaces/WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Activities.json",
            auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
            status_code: 500,
            content_file: File.join(File.dirname(__FILE__), "activity_create_500.json"),
            query_params: '{}',
            form_params: '{"Available": "true", "FriendlyName": "friendly_name"}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://taskrouter.twilio.com/v1/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Workspaces/WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Activities/WAmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm.json",
            auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
            status_code: 500,
            content_file: File.join(File.dirname(__FILE__), "activity_update_500.json"),
            query_params: '{}',
            form_params: '{"FriendlyName": "friendly_name"}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
    ]
  end
end

class TaskrouterHolodeckResource < HolodeckResource
  class ActivityInstanceHolodeckResource < HolodeckResource
    @sub_resources = {}
    @holograms = [
        Hologram.new(
            method: "GET",
            url: "https://taskrouter.twilio.com/v1/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Activities.json",
            auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
            status_code: 200,
            content_file: File.join(File.dirname(__FILE__), "activity_read_200_empty.json"),
            query_params: '{"Available": "available", "FriendlyName": "friendly_name"}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://taskrouter.twilio.com/v1/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Activities/WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
            auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
            status_code: 200,
            content_file: File.join(File.dirname(__FILE__), "activity_fetch_200.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://taskrouter.twilio.com/v1/Accounts/ACbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb/Workspaces/WSbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb/Activities.json",
            auth: ["ACbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb", "AUTHTOKEN"],
            status_code: 200,
            content_file: File.join(File.dirname(__FILE__), "activity_read_200_partial.json"),
            query_params: '{"Available": "available", "FriendlyName": "friendly_name"}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://taskrouter.twilio.com/v1/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Activities.json",
            auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
            status_code: 200,
            content_file: File.join(File.dirname(__FILE__), "activity_create_200.json"),
            query_params: '{}',
            form_params: '{"Available": "true", "FriendlyName": "friendly_name"}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://taskrouter.twilio.com/v1/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Activities/WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
            auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
            status_code: 200,
            content_file: File.join(File.dirname(__FILE__), "activity_update_200.json"),
            query_params: '{}',
            form_params: '{"FriendlyName": "friendly_name"}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "DELETE",
            url: "https://taskrouter.twilio.com/v1/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Activities/WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
            auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
            status_code: 204,
            content_file: File.join(File.dirname(__FILE__), "activity_delete_204.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "DELETE",
            url: "https://taskrouter.twilio.com/v1/Accounts/ACllllllllllllllllllllllllllllllll/Workspaces/WSllllllllllllllllllllllllllllllll/Activities/WAllllllllllllllllllllllllllllllll.json",
            auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
            status_code: 401,
            content_file: File.join(File.dirname(__FILE__), "activity_delete_401.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://taskrouter.twilio.com/v1/Accounts/ACllllllllllllllllllllllllllllllll/Workspaces/WSllllllllllllllllllllllllllllllll/Activities.json",
            auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
            status_code: 401,
            content_file: File.join(File.dirname(__FILE__), "activity_read_401.json"),
            query_params: '{"Available": "available", "FriendlyName": "friendly_name"}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://taskrouter.twilio.com/v1/Accounts/ACllllllllllllllllllllllllllllllll/Workspaces/WSllllllllllllllllllllllllllllllll/Activities/WAllllllllllllllllllllllllllllllll.json",
            auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
            status_code: 401,
            content_file: File.join(File.dirname(__FILE__), "activity_fetch_401.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://taskrouter.twilio.com/v1/Accounts/ACllllllllllllllllllllllllllllllll/Workspaces/WSllllllllllllllllllllllllllllllll/Activities.json",
            auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
            status_code: 401,
            content_file: File.join(File.dirname(__FILE__), "activity_create_401.json"),
            query_params: '{}',
            form_params: '{"Available": "true", "FriendlyName": "friendly_name"}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://taskrouter.twilio.com/v1/Accounts/ACllllllllllllllllllllllllllllllll/Workspaces/WSllllllllllllllllllllllllllllllll/Activities/WAllllllllllllllllllllllllllllllll.json",
            auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
            status_code: 401,
            content_file: File.join(File.dirname(__FILE__), "activity_update_401.json"),
            query_params: '{}',
            form_params: '{"FriendlyName": "friendly_name"}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "DELETE",
            url: "https://taskrouter.twilio.com/v1/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Workspaces/WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Activities/WAkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk.json",
            auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
            status_code: 404,
            content_file: File.join(File.dirname(__FILE__), "activity_delete_404.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://taskrouter.twilio.com/v1/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Workspaces/WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Activities.json",
            auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
            status_code: 404,
            content_file: File.join(File.dirname(__FILE__), "activity_read_404.json"),
            query_params: '{"Available": "available", "FriendlyName": "friendly_name"}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://taskrouter.twilio.com/v1/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Workspaces/WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Activities/WAkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk.json",
            auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
            status_code: 404,
            content_file: File.join(File.dirname(__FILE__), "activity_fetch_404.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://taskrouter.twilio.com/v1/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Workspaces/WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Activities.json",
            auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
            status_code: 404,
            content_file: File.join(File.dirname(__FILE__), "activity_create_404.json"),
            query_params: '{}',
            form_params: '{"Available": "true", "FriendlyName": "friendly_name"}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://taskrouter.twilio.com/v1/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Workspaces/WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Activities/WAkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk.json",
            auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
            status_code: 404,
            content_file: File.join(File.dirname(__FILE__), "activity_update_404.json"),
            query_params: '{}',
            form_params: '{"FriendlyName": "friendly_name"}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "DELETE",
            url: "https://taskrouter.twilio.com/v1/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Workspaces/WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Activities/WAmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm.json",
            auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
            status_code: 500,
            content_file: File.join(File.dirname(__FILE__), "activity_delete_500.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://taskrouter.twilio.com/v1/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Workspaces/WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Activities.json",
            auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
            status_code: 500,
            content_file: File.join(File.dirname(__FILE__), "activity_read_500.json"),
            query_params: '{"Available": "available", "FriendlyName": "friendly_name"}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://taskrouter.twilio.com/v1/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Workspaces/WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Activities/WAmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm.json",
            auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
            status_code: 500,
            content_file: File.join(File.dirname(__FILE__), "activity_fetch_500.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://taskrouter.twilio.com/v1/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Workspaces/WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Activities.json",
            auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
            status_code: 500,
            content_file: File.join(File.dirname(__FILE__), "activity_create_500.json"),
            query_params: '{}',
            form_params: '{"Available": "true", "FriendlyName": "friendly_name"}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://taskrouter.twilio.com/v1/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Workspaces/WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Activities/WAmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm.json",
            auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
            status_code: 500,
            content_file: File.join(File.dirname(__FILE__), "activity_update_500.json"),
            query_params: '{}',
            form_params: '{"FriendlyName": "friendly_name"}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
    ]
  end
end