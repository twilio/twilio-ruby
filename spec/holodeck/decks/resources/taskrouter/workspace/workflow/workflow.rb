require './spec/holodeck/decks/resources/taskrouter/workspace/workflow/statistics/statistics.rb'

class WorkflowInstanceHolodeckResource < HolodeckResource
  @sub_resources = {
      statistics: StatisticsInstanceHolodeckResource,
  }
  @holograms = [
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.twilio.com/v1/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workflows",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "workflow_read_200_empty.json"),
          query_params: '{"FriendlyName": "friendly_name"}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.twilio.com/v1/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workflows/WFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "workflow_fetch_200.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.twilio.com/v1/Accounts/ACbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb/Workspaces/WSbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb/Workflows",
          auth: ["ACbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "workflow_read_200_partial.json"),
          query_params: '{"FriendlyName": "friendly_name"}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://taskrouter.twilio.com/v1/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workflows",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "workflow_create_200.json"),
          query_params: '{}',
          form_params: '{"AssignmentCallbackUrl": "/example", "Configuration": "configuration", "FallbackAssignmentCallbackUrl": "/example", "FriendlyName": "friendly_name", "TaskReservationTimeout": "1"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://taskrouter.twilio.com/v1/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workflows/WFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "workflow_update_200.json"),
          query_params: '{}',
          form_params: '{"AssignmentCallbackUrl": "/example", "Configuration": "configuration", "FallbackAssignmentCallbackUrl": "/example", "FriendlyName": "friendly_name", "TaskReservationTimeout": "1"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "DELETE",
          url: "https://taskrouter.twilio.com/v1/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workflows/WFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 204,
          content_file: File.join(File.dirname(__FILE__), "workflow_delete_204.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "DELETE",
          url: "https://taskrouter.twilio.com/v1/Accounts/ACllllllllllllllllllllllllllllllll/Workspaces/WSllllllllllllllllllllllllllllllll/Workflows/WFllllllllllllllllllllllllllllllll",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "workflow_delete_401.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.twilio.com/v1/Accounts/ACllllllllllllllllllllllllllllllll/Workspaces/WSllllllllllllllllllllllllllllllll/Workflows",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "workflow_read_401.json"),
          query_params: '{"FriendlyName": "friendly_name"}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.twilio.com/v1/Accounts/ACllllllllllllllllllllllllllllllll/Workspaces/WSllllllllllllllllllllllllllllllll/Workflows/WFllllllllllllllllllllllllllllllll",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "workflow_fetch_401.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://taskrouter.twilio.com/v1/Accounts/ACllllllllllllllllllllllllllllllll/Workspaces/WSllllllllllllllllllllllllllllllll/Workflows",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "workflow_create_401.json"),
          query_params: '{}',
          form_params: '{"AssignmentCallbackUrl": "/example", "Configuration": "configuration", "FallbackAssignmentCallbackUrl": "/example", "FriendlyName": "friendly_name", "TaskReservationTimeout": "1"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://taskrouter.twilio.com/v1/Accounts/ACllllllllllllllllllllllllllllllll/Workspaces/WSllllllllllllllllllllllllllllllll/Workflows/WFllllllllllllllllllllllllllllllll",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "workflow_update_401.json"),
          query_params: '{}',
          form_params: '{"AssignmentCallbackUrl": "/example", "Configuration": "configuration", "FallbackAssignmentCallbackUrl": "/example", "FriendlyName": "friendly_name", "TaskReservationTimeout": "1"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "DELETE",
          url: "https://taskrouter.twilio.com/v1/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Workspaces/WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Workflows/WFkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "workflow_delete_404.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.twilio.com/v1/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Workspaces/WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Workflows",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "workflow_read_404.json"),
          query_params: '{"FriendlyName": "friendly_name"}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.twilio.com/v1/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Workspaces/WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Workflows/WFkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "workflow_fetch_404.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://taskrouter.twilio.com/v1/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Workspaces/WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Workflows",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "workflow_create_404.json"),
          query_params: '{}',
          form_params: '{"AssignmentCallbackUrl": "/example", "Configuration": "configuration", "FallbackAssignmentCallbackUrl": "/example", "FriendlyName": "friendly_name", "TaskReservationTimeout": "1"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://taskrouter.twilio.com/v1/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Workspaces/WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Workflows/WFkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "workflow_update_404.json"),
          query_params: '{}',
          form_params: '{"AssignmentCallbackUrl": "/example", "Configuration": "configuration", "FallbackAssignmentCallbackUrl": "/example", "FriendlyName": "friendly_name", "TaskReservationTimeout": "1"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "DELETE",
          url: "https://taskrouter.twilio.com/v1/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Workspaces/WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Workflows/WFmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "workflow_delete_500.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.twilio.com/v1/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Workspaces/WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Workflows",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "workflow_read_500.json"),
          query_params: '{"FriendlyName": "friendly_name"}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.twilio.com/v1/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Workspaces/WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Workflows/WFmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "workflow_fetch_500.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://taskrouter.twilio.com/v1/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Workspaces/WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Workflows",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "workflow_create_500.json"),
          query_params: '{}',
          form_params: '{"AssignmentCallbackUrl": "/example", "Configuration": "configuration", "FallbackAssignmentCallbackUrl": "/example", "FriendlyName": "friendly_name", "TaskReservationTimeout": "1"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://taskrouter.twilio.com/v1/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Workspaces/WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Workflows/WFmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "workflow_update_500.json"),
          query_params: '{}',
          form_params: '{"AssignmentCallbackUrl": "/example", "Configuration": "configuration", "FallbackAssignmentCallbackUrl": "/example", "FriendlyName": "friendly_name", "TaskReservationTimeout": "1"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
  ]
end