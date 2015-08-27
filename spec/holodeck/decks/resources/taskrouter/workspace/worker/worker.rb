require './spec/holodeck/decks/resources/taskrouter/workspace/worker/instance_statistics/instance_statistics.rb'

require './spec/holodeck/decks/resources/taskrouter/workspace/worker/list_statistics/list_statistics.rb'

class WorkerInstanceHolodeckResource < HolodeckResource
  @sub_resources = {
      statistics: StatisticsInstanceHolodeckResource,
      statistics: StatisticsInstanceHolodeckResource,
  }
  @holograms = [
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.stage.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workers",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "worker_read_200_empty.json"),
          query_params: '{"ActivityName": "activity_name", "ActivitySid": "activity_sid", "Available": "available", "FriendlyName": "friendly_name", "TargetWorkersExpression": "target_workers_expression", "TaskQueueName": "task_queue_name", "TaskQueueSid": "task_queue_sid"}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.stage.twilio.com/v1/Workspaces/WSbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb/Workers",
          auth: ["ACbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "worker_read_200_partial.json"),
          query_params: '{"ActivityName": "activity_name", "ActivitySid": "activity_sid", "Available": "available", "FriendlyName": "friendly_name", "TargetWorkersExpression": "target_workers_expression", "TaskQueueName": "task_queue_name", "TaskQueueSid": "task_queue_sid"}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.twilio.com/v1/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workers/WKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "worker_fetch_200.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://taskrouter.stage.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workers",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "worker_create_200.json"),
          query_params: '{}',
          form_params: '{"ActivitySid": "activity_sid", "Attributes": "attributes", "FriendlyName": "friendly_name"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://taskrouter.twilio.com/v1/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workers/WKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "worker_update_200.json"),
          query_params: '{}',
          form_params: '{"ActivitySid": "activity_sid", "Attributes": "attributes", "FriendlyName": "friendly_name"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "DELETE",
          url: "https://taskrouter.twilio.com/v1/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workers/WKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 204,
          content_file: File.join(File.dirname(__FILE__), "worker_delete_204.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "DELETE",
          url: "https://taskrouter.twilio.com/v1/Accounts/ACllllllllllllllllllllllllllllllll/Workspaces/WSllllllllllllllllllllllllllllllll/Workers/WKllllllllllllllllllllllllllllllll",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "worker_delete_401.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.stage.twilio.com/v1/Workspaces/WSllllllllllllllllllllllllllllllll/Workers",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "worker_read_401.json"),
          query_params: '{"ActivityName": "activity_name", "ActivitySid": "activity_sid", "Available": "available", "FriendlyName": "friendly_name", "TargetWorkersExpression": "target_workers_expression", "TaskQueueName": "task_queue_name", "TaskQueueSid": "task_queue_sid"}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.twilio.com/v1/Accounts/ACllllllllllllllllllllllllllllllll/Workspaces/WSllllllllllllllllllllllllllllllll/Workers/WKllllllllllllllllllllllllllllllll",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "worker_fetch_401.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://taskrouter.stage.twilio.com/v1/Workspaces/WSllllllllllllllllllllllllllllllll/Workers",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "worker_create_401.json"),
          query_params: '{}',
          form_params: '{"ActivitySid": "activity_sid", "Attributes": "attributes", "FriendlyName": "friendly_name"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://taskrouter.twilio.com/v1/Accounts/ACllllllllllllllllllllllllllllllll/Workspaces/WSllllllllllllllllllllllllllllllll/Workers/WKllllllllllllllllllllllllllllllll",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "worker_update_401.json"),
          query_params: '{}',
          form_params: '{"ActivitySid": "activity_sid", "Attributes": "attributes", "FriendlyName": "friendly_name"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "DELETE",
          url: "https://taskrouter.twilio.com/v1/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Workspaces/WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Workers/WKkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "worker_delete_404.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.stage.twilio.com/v1/Workspaces/WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Workers",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "worker_read_404.json"),
          query_params: '{"ActivityName": "activity_name", "ActivitySid": "activity_sid", "Available": "available", "FriendlyName": "friendly_name", "TargetWorkersExpression": "target_workers_expression", "TaskQueueName": "task_queue_name", "TaskQueueSid": "task_queue_sid"}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.twilio.com/v1/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Workspaces/WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Workers/WKkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "worker_fetch_404.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://taskrouter.stage.twilio.com/v1/Workspaces/WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Workers",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "worker_create_404.json"),
          query_params: '{}',
          form_params: '{"ActivitySid": "activity_sid", "Attributes": "attributes", "FriendlyName": "friendly_name"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://taskrouter.twilio.com/v1/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Workspaces/WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Workers/WKkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "worker_update_404.json"),
          query_params: '{}',
          form_params: '{"ActivitySid": "activity_sid", "Attributes": "attributes", "FriendlyName": "friendly_name"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "DELETE",
          url: "https://taskrouter.twilio.com/v1/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Workspaces/WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Workers/WKmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "worker_delete_500.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.stage.twilio.com/v1/Workspaces/WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Workers",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "worker_read_500.json"),
          query_params: '{"ActivityName": "activity_name", "ActivitySid": "activity_sid", "Available": "available", "FriendlyName": "friendly_name", "TargetWorkersExpression": "target_workers_expression", "TaskQueueName": "task_queue_name", "TaskQueueSid": "task_queue_sid"}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.twilio.com/v1/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Workspaces/WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Workers/WKmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "worker_fetch_500.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://taskrouter.stage.twilio.com/v1/Workspaces/WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Workers",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "worker_create_500.json"),
          query_params: '{}',
          form_params: '{"ActivitySid": "activity_sid", "Attributes": "attributes", "FriendlyName": "friendly_name"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://taskrouter.twilio.com/v1/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Workspaces/WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Workers/WKmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "worker_update_500.json"),
          query_params: '{}',
          form_params: '{"ActivitySid": "activity_sid", "Attributes": "attributes", "FriendlyName": "friendly_name"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
  ]
end