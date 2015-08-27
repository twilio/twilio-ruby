require './spec/holodeck/decks/resources/taskrouter/workspace/task/reservation/reservation.rb'

class TaskInstanceHolodeckResource < HolodeckResource
  @sub_resources = {
      reservations: ReservationInstanceHolodeckResource,
  }
  @holograms = [
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Tasks",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "task_read_200_empty.json"),
          query_params: '{"AssignmentStatus": "assignment_status", "Priority": "1", "TaskQueueName": "task_queue_name", "TaskQueueSid": "task_queue_sid", "WorkflowName": "workflow_name", "WorkflowSid": "workflow_sid"}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Tasks/WTaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "task_fetch_200.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb/Tasks",
          auth: ["ACbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "task_read_200_partial.json"),
          query_params: '{"AssignmentStatus": "assignment_status", "Priority": "1", "TaskQueueName": "task_queue_name", "TaskQueueSid": "task_queue_sid", "WorkflowName": "workflow_name", "WorkflowSid": "workflow_sid"}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Tasks",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "task_create_200.json"),
          query_params: '{}',
          form_params: '{"Attributes": "attributes", "Priority": "1", "Timeout": "1", "WorkflowSid": "workflow_sid"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Tasks/WTaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 200,
          content_file: File.join(File.dirname(__FILE__), "task_update_200.json"),
          query_params: '{}',
          form_params: '{"AssignmentStatus": "assignment_status", "Attributes": "attributes", "Priority": "1", "Reason": "reason"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "DELETE",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Tasks/WTaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          status_code: 204,
          content_file: File.join(File.dirname(__FILE__), "task_delete_204.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "DELETE",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSllllllllllllllllllllllllllllllll/Tasks/WTllllllllllllllllllllllllllllllll",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "task_delete_401.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSllllllllllllllllllllllllllllllll/Tasks",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "task_read_401.json"),
          query_params: '{"AssignmentStatus": "assignment_status", "Priority": "1", "TaskQueueName": "task_queue_name", "TaskQueueSid": "task_queue_sid", "WorkflowName": "workflow_name", "WorkflowSid": "workflow_sid"}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSllllllllllllllllllllllllllllllll/Tasks/WTllllllllllllllllllllllllllllllll",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "task_fetch_401.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSllllllllllllllllllllllllllllllll/Tasks",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "task_create_401.json"),
          query_params: '{}',
          form_params: '{"Attributes": "attributes", "Priority": "1", "Timeout": "1", "WorkflowSid": "workflow_sid"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSllllllllllllllllllllllllllllllll/Tasks/WTllllllllllllllllllllllllllllllll",
          auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
          status_code: 401,
          content_file: File.join(File.dirname(__FILE__), "task_update_401.json"),
          query_params: '{}',
          form_params: '{"AssignmentStatus": "assignment_status", "Attributes": "attributes", "Priority": "1", "Reason": "reason"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "DELETE",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Tasks/WTkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "task_delete_404.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Tasks",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "task_read_404.json"),
          query_params: '{"AssignmentStatus": "assignment_status", "Priority": "1", "TaskQueueName": "task_queue_name", "TaskQueueSid": "task_queue_sid", "WorkflowName": "workflow_name", "WorkflowSid": "workflow_sid"}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Tasks/WTkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "task_fetch_404.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Tasks",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "task_create_404.json"),
          query_params: '{}',
          form_params: '{"Attributes": "attributes", "Priority": "1", "Timeout": "1", "WorkflowSid": "workflow_sid"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk/Tasks/WTkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk",
          auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
          status_code: 404,
          content_file: File.join(File.dirname(__FILE__), "task_update_404.json"),
          query_params: '{}',
          form_params: '{"AssignmentStatus": "assignment_status", "Attributes": "attributes", "Priority": "1", "Reason": "reason"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "DELETE",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Tasks/WTmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "task_delete_500.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Tasks",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "task_read_500.json"),
          query_params: '{"AssignmentStatus": "assignment_status", "Priority": "1", "TaskQueueName": "task_queue_name", "TaskQueueSid": "task_queue_sid", "WorkflowName": "workflow_name", "WorkflowSid": "workflow_sid"}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "GET",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Tasks/WTmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "task_fetch_500.json"),
          query_params: '{}',
          form_params: '{}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Tasks",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "task_create_500.json"),
          query_params: '{}',
          form_params: '{"Attributes": "attributes", "Priority": "1", "Timeout": "1", "WorkflowSid": "workflow_sid"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
      Hologram.new(
          method: "POST",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm/Tasks/WTmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm",
          auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
          status_code: 500,
          content_file: File.join(File.dirname(__FILE__), "task_update_500.json"),
          query_params: '{}',
          form_params: '{"AssignmentStatus": "assignment_status", "Attributes": "attributes", "Priority": "1", "Reason": "reason"}',
          headers: HolodeckResource::DEFAULT_HEADERS
      ),
  ]
end