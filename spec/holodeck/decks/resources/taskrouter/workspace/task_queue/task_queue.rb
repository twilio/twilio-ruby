require './spec/holodeck/decks/resources/taskrouter/workspace/task_queue/instance_statistics/instance_statistics.rb'

require './spec/holodeck/decks/resources/taskrouter/workspace/task_queue/list_statistics/list_statistics.rb'

class TaskQueueInstanceHolodeckResource < HolodeckResource
  @sub_resources = {
      statistics: StatisticsInstanceHolodeckResource,
      statistics: StatisticsInstanceHolodeckResource,
  }
  @holograms = [
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/TaskQueues",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "task_queue_read_200_empty.json"),
          query_params: '{"EvaluateWorkerAttributes": "evaluate_worker_attributes", "FriendlyName": "friendly_name"}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/TaskQueues/WQaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "task_queue_fetch_200.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb/TaskQueues",
          auth: ["ACbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "task_queue_read_200_partial.json"),
          query_params: '{"EvaluateWorkerAttributes": "evaluate_worker_attributes", "FriendlyName": "friendly_name"}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/TaskQueues",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "task_queue_create_200.json"),
          query_params: '{}',
          form_params: '{"AssignmentActivitySid": "assignment_activity_sid", "FriendlyName": "friendly_name", "MaxReservedWorkers": "1", "ReservationActivitySid": "reservation_activity_sid", "TargetWorkers": "target_workers"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/TaskQueues/WQaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "task_queue_update_200.json"),
          query_params: '{}',
          form_params: '{"AssignmentActivitySid": "assignment_activity_sid", "FriendlyName": "friendly_name", "MaxReservedWorkers": "1", "ReservationActivitySid": "reservation_activity_sid", "TargetWorkers": "target_workers"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "DELETE",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/TaskQueues/WQaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 204,
          content_file: File.join(File.dirname(__FILE__), "task_queue_delete_204.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "DELETE",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSllllllllllllllllllllllllllllllll/TaskQueues/WQllllllllllllllllllllllllllllllll",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "task_queue_delete_401.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSllllllllllllllllllllllllllllllll/TaskQueues",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "task_queue_read_401.json"),
          query_params: '{"EvaluateWorkerAttributes": "evaluate_worker_attributes", "FriendlyName": "friendly_name"}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSllllllllllllllllllllllllllllllll/TaskQueues/WQllllllllllllllllllllllllllllllll",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "task_queue_fetch_401.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSllllllllllllllllllllllllllllllll/TaskQueues",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "task_queue_create_401.json"),
          query_params: '{}',
          form_params: '{"AssignmentActivitySid": "assignment_activity_sid", "FriendlyName": "friendly_name", "MaxReservedWorkers": "1", "ReservationActivitySid": "reservation_activity_sid", "TargetWorkers": "target_workers"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSllllllllllllllllllllllllllllllll/TaskQueues/WQllllllllllllllllllllllllllllllll",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "task_queue_update_401.json"),
          query_params: '{}',
          form_params: '{"AssignmentActivitySid": "assignment_activity_sid", "FriendlyName": "friendly_name", "MaxReservedWorkers": "1", "ReservationActivitySid": "reservation_activity_sid", "TargetWorkers": "target_workers"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "DELETE",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/TaskQueues/WQkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "task_queue_delete_404.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/TaskQueues",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "task_queue_read_404.json"),
          query_params: '{"EvaluateWorkerAttributes": "evaluate_worker_attributes", "FriendlyName": "friendly_name"}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/TaskQueues/WQkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "task_queue_fetch_404.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/TaskQueues",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "task_queue_create_404.json"),
          query_params: '{}',
          form_params: '{"AssignmentActivitySid": "assignment_activity_sid", "FriendlyName": "friendly_name", "MaxReservedWorkers": "1", "ReservationActivitySid": "reservation_activity_sid", "TargetWorkers": "target_workers"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/TaskQueues/WQkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "task_queue_update_404.json"),
          query_params: '{}',
          form_params: '{"AssignmentActivitySid": "assignment_activity_sid", "FriendlyName": "friendly_name", "MaxReservedWorkers": "1", "ReservationActivitySid": "reservation_activity_sid", "TargetWorkers": "target_workers"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "DELETE",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/TaskQueues/WQmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "task_queue_delete_500.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/TaskQueues",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "task_queue_read_500.json"),
          query_params: '{"EvaluateWorkerAttributes": "evaluate_worker_attributes", "FriendlyName": "friendly_name"}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/TaskQueues/WQmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "task_queue_fetch_500.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/TaskQueues",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "task_queue_create_500.json"),
          query_params: '{}',
          form_params: '{"AssignmentActivitySid": "assignment_activity_sid", "FriendlyName": "friendly_name", "MaxReservedWorkers": "1", "ReservationActivitySid": "reservation_activity_sid", "TargetWorkers": "target_workers"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/TaskQueues/WQmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "task_queue_update_500.json"),
          query_params: '{}',
          form_params: '{"AssignmentActivitySid": "assignment_activity_sid", "FriendlyName": "friendly_name", "MaxReservedWorkers": "1", "ReservationActivitySid": "reservation_activity_sid", "TargetWorkers": "target_workers"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
  ]
end