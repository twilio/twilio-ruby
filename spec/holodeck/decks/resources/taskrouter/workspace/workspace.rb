class TaskrouterHolodeckResource < HolodeckResource
  require './spec/holodeck/decks/resources/taskrouter/workspace/activity/activity.rb'

  require './spec/holodeck/decks/resources/taskrouter/workspace/event/event.rb'

  require './spec/holodeck/decks/resources/taskrouter/workspace/task/task.rb'

  require './spec/holodeck/decks/resources/taskrouter/workspace/task_queue/task_queue.rb'

  require './spec/holodeck/decks/resources/taskrouter/workspace/worker/worker.rb'

  require './spec/holodeck/decks/resources/taskrouter/workspace/workflow/workflow.rb'

  require './spec/holodeck/decks/resources/taskrouter/workspace/statistics/statistics.rb'

  class WorkspaceInstanceHolodeckResource < HolodeckResource
    @sub_resources = {
        activities: TaskrouterHolodeckResource::ActivityInstanceHolodeckResource,
        events: TaskrouterHolodeckResource::EventInstanceHolodeckResource,
        tasks: TaskrouterHolodeckResource::TaskInstanceHolodeckResource,
        task_queues: TaskrouterHolodeckResource::TaskQueueInstanceHolodeckResource,
        workers: TaskrouterHolodeckResource::WorkerInstanceHolodeckResource,
        workflows: TaskrouterHolodeckResource::WorkflowInstanceHolodeckResource,
        statistics: TaskrouterHolodeckResource::StatisticsInstanceHolodeckResource,
    }
    @holograms = [
        Hologram.new(
            method: "GET",
            url: "https://taskrouter.twilio.com/v1/Workspaces.json",
            auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
            status_code: 200,
            content_file: File.join(File.dirname(__FILE__), "workspace_read_200_empty.json"),
            query_params: '{"FriendlyName": "friendly_name"}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://taskrouter.twilio.com/v1/Workspaces.json",
            auth: ["ACbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb", "AUTHTOKEN"],
            status_code: 200,
            content_file: File.join(File.dirname(__FILE__), "workspace_read_200_partial.json"),
            query_params: '{"FriendlyName": "friendly_name"}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
            auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
            status_code: 200,
            content_file: File.join(File.dirname(__FILE__), "workspace_fetch_200.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://taskrouter.twilio.com/v1/Workspaces.json",
            auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
            status_code: 200,
            content_file: File.join(File.dirname(__FILE__), "workspace_create_200.json"),
            query_params: '{}',
            form_params: '{"EventCallbackUrl": "/example", "FriendlyName": "friendly_name", "Template": "template"}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
            auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
            status_code: 200,
            content_file: File.join(File.dirname(__FILE__), "workspace_update_200.json"),
            query_params: '{}',
            form_params: '{"DefaultActivitySid": "default_activity_sid", "EventCallbackUrl": "/example", "FriendlyName": "friendly_name", "TimeoutActivitySid": "timeout_activity_sid"}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "DELETE",
            url: "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
            auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
            status_code: 204,
            content_file: File.join(File.dirname(__FILE__), "workspace_delete_204.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "DELETE",
            url: "https://taskrouter.twilio.com/v1/Workspaces/WSllllllllllllllllllllllllllllllll.json",
            auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
            status_code: 401,
            content_file: File.join(File.dirname(__FILE__), "workspace_delete_401.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://taskrouter.twilio.com/v1/Workspaces.json",
            auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
            status_code: 401,
            content_file: File.join(File.dirname(__FILE__), "workspace_read_401.json"),
            query_params: '{"FriendlyName": "friendly_name"}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://taskrouter.twilio.com/v1/Workspaces/WSllllllllllllllllllllllllllllllll.json",
            auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
            status_code: 401,
            content_file: File.join(File.dirname(__FILE__), "workspace_fetch_401.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://taskrouter.twilio.com/v1/Workspaces.json",
            auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
            status_code: 401,
            content_file: File.join(File.dirname(__FILE__), "workspace_create_401.json"),
            query_params: '{}',
            form_params: '{"EventCallbackUrl": "/example", "FriendlyName": "friendly_name", "Template": "template"}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://taskrouter.twilio.com/v1/Workspaces/WSllllllllllllllllllllllllllllllll.json",
            auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
            status_code: 401,
            content_file: File.join(File.dirname(__FILE__), "workspace_update_401.json"),
            query_params: '{}',
            form_params: '{"DefaultActivitySid": "default_activity_sid", "EventCallbackUrl": "/example", "FriendlyName": "friendly_name", "TimeoutActivitySid": "timeout_activity_sid"}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "DELETE",
            url: "https://taskrouter.twilio.com/v1/Workspaces/WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk.json",
            auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
            status_code: 404,
            content_file: File.join(File.dirname(__FILE__), "workspace_delete_404.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://taskrouter.twilio.com/v1/Workspaces.json",
            auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
            status_code: 404,
            content_file: File.join(File.dirname(__FILE__), "workspace_read_404.json"),
            query_params: '{"FriendlyName": "friendly_name"}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://taskrouter.twilio.com/v1/Workspaces/WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk.json",
            auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
            status_code: 404,
            content_file: File.join(File.dirname(__FILE__), "workspace_fetch_404.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://taskrouter.twilio.com/v1/Workspaces.json",
            auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
            status_code: 404,
            content_file: File.join(File.dirname(__FILE__), "workspace_create_404.json"),
            query_params: '{}',
            form_params: '{"EventCallbackUrl": "/example", "FriendlyName": "friendly_name", "Template": "template"}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://taskrouter.twilio.com/v1/Workspaces/WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk.json",
            auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
            status_code: 404,
            content_file: File.join(File.dirname(__FILE__), "workspace_update_404.json"),
            query_params: '{}',
            form_params: '{"DefaultActivitySid": "default_activity_sid", "EventCallbackUrl": "/example", "FriendlyName": "friendly_name", "TimeoutActivitySid": "timeout_activity_sid"}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "DELETE",
            url: "https://taskrouter.twilio.com/v1/Workspaces/WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm.json",
            auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
            status_code: 500,
            content_file: File.join(File.dirname(__FILE__), "workspace_delete_500.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://taskrouter.twilio.com/v1/Workspaces.json",
            auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
            status_code: 500,
            content_file: File.join(File.dirname(__FILE__), "workspace_read_500.json"),
            query_params: '{"FriendlyName": "friendly_name"}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://taskrouter.twilio.com/v1/Workspaces/WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm.json",
            auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
            status_code: 500,
            content_file: File.join(File.dirname(__FILE__), "workspace_fetch_500.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://taskrouter.twilio.com/v1/Workspaces.json",
            auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
            status_code: 500,
            content_file: File.join(File.dirname(__FILE__), "workspace_create_500.json"),
            query_params: '{}',
            form_params: '{"EventCallbackUrl": "/example", "FriendlyName": "friendly_name", "Template": "template"}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://taskrouter.twilio.com/v1/Workspaces/WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm.json",
            auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
            status_code: 500,
            content_file: File.join(File.dirname(__FILE__), "workspace_update_500.json"),
            query_params: '{}',
            form_params: '{"DefaultActivitySid": "default_activity_sid", "EventCallbackUrl": "/example", "FriendlyName": "friendly_name", "TimeoutActivitySid": "timeout_activity_sid"}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
    ]
  end
end

class TaskrouterHolodeckResource < HolodeckResource
  require './spec/holodeck/decks/resources/taskrouter/workspace/activity/activity.rb'

  require './spec/holodeck/decks/resources/taskrouter/workspace/event/event.rb'

  require './spec/holodeck/decks/resources/taskrouter/workspace/task/task.rb'

  require './spec/holodeck/decks/resources/taskrouter/workspace/task_queue/task_queue.rb'

  require './spec/holodeck/decks/resources/taskrouter/workspace/worker/worker.rb'

  require './spec/holodeck/decks/resources/taskrouter/workspace/workflow/workflow.rb'

  require './spec/holodeck/decks/resources/taskrouter/workspace/statistics/statistics.rb'

  class WorkspaceInstanceHolodeckResource < HolodeckResource
    @sub_resources = {
        activities: TaskrouterHolodeckResource::ActivityInstanceHolodeckResource,
        events: TaskrouterHolodeckResource::EventInstanceHolodeckResource,
        tasks: TaskrouterHolodeckResource::TaskInstanceHolodeckResource,
        task_queues: TaskrouterHolodeckResource::TaskQueueInstanceHolodeckResource,
        workers: TaskrouterHolodeckResource::WorkerInstanceHolodeckResource,
        workflows: TaskrouterHolodeckResource::WorkflowInstanceHolodeckResource,
        statistics: TaskrouterHolodeckResource::StatisticsInstanceHolodeckResource,
    }
    @holograms = [
        Hologram.new(
            method: "GET",
            url: "https://taskrouter.twilio.com/v1/Workspaces.json",
            auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
            status_code: 200,
            content_file: File.join(File.dirname(__FILE__), "workspace_read_200_empty.json"),
            query_params: '{"FriendlyName": "friendly_name"}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://taskrouter.twilio.com/v1/Workspaces.json",
            auth: ["ACbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb", "AUTHTOKEN"],
            status_code: 200,
            content_file: File.join(File.dirname(__FILE__), "workspace_read_200_partial.json"),
            query_params: '{"FriendlyName": "friendly_name"}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
            auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
            status_code: 200,
            content_file: File.join(File.dirname(__FILE__), "workspace_fetch_200.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://taskrouter.twilio.com/v1/Workspaces.json",
            auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
            status_code: 200,
            content_file: File.join(File.dirname(__FILE__), "workspace_create_200.json"),
            query_params: '{}',
            form_params: '{"EventCallbackUrl": "/example", "FriendlyName": "friendly_name", "Template": "template"}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
            auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
            status_code: 200,
            content_file: File.join(File.dirname(__FILE__), "workspace_update_200.json"),
            query_params: '{}',
            form_params: '{"DefaultActivitySid": "default_activity_sid", "EventCallbackUrl": "/example", "FriendlyName": "friendly_name", "TimeoutActivitySid": "timeout_activity_sid"}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "DELETE",
            url: "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
            auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
            status_code: 204,
            content_file: File.join(File.dirname(__FILE__), "workspace_delete_204.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "DELETE",
            url: "https://taskrouter.twilio.com/v1/Workspaces/WSllllllllllllllllllllllllllllllll.json",
            auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
            status_code: 401,
            content_file: File.join(File.dirname(__FILE__), "workspace_delete_401.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://taskrouter.twilio.com/v1/Workspaces.json",
            auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
            status_code: 401,
            content_file: File.join(File.dirname(__FILE__), "workspace_read_401.json"),
            query_params: '{"FriendlyName": "friendly_name"}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://taskrouter.twilio.com/v1/Workspaces/WSllllllllllllllllllllllllllllllll.json",
            auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
            status_code: 401,
            content_file: File.join(File.dirname(__FILE__), "workspace_fetch_401.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://taskrouter.twilio.com/v1/Workspaces.json",
            auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
            status_code: 401,
            content_file: File.join(File.dirname(__FILE__), "workspace_create_401.json"),
            query_params: '{}',
            form_params: '{"EventCallbackUrl": "/example", "FriendlyName": "friendly_name", "Template": "template"}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://taskrouter.twilio.com/v1/Workspaces/WSllllllllllllllllllllllllllllllll.json",
            auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
            status_code: 401,
            content_file: File.join(File.dirname(__FILE__), "workspace_update_401.json"),
            query_params: '{}',
            form_params: '{"DefaultActivitySid": "default_activity_sid", "EventCallbackUrl": "/example", "FriendlyName": "friendly_name", "TimeoutActivitySid": "timeout_activity_sid"}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "DELETE",
            url: "https://taskrouter.twilio.com/v1/Workspaces/WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk.json",
            auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
            status_code: 404,
            content_file: File.join(File.dirname(__FILE__), "workspace_delete_404.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://taskrouter.twilio.com/v1/Workspaces.json",
            auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
            status_code: 404,
            content_file: File.join(File.dirname(__FILE__), "workspace_read_404.json"),
            query_params: '{"FriendlyName": "friendly_name"}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://taskrouter.twilio.com/v1/Workspaces/WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk.json",
            auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
            status_code: 404,
            content_file: File.join(File.dirname(__FILE__), "workspace_fetch_404.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://taskrouter.twilio.com/v1/Workspaces.json",
            auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
            status_code: 404,
            content_file: File.join(File.dirname(__FILE__), "workspace_create_404.json"),
            query_params: '{}',
            form_params: '{"EventCallbackUrl": "/example", "FriendlyName": "friendly_name", "Template": "template"}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://taskrouter.twilio.com/v1/Workspaces/WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk.json",
            auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
            status_code: 404,
            content_file: File.join(File.dirname(__FILE__), "workspace_update_404.json"),
            query_params: '{}',
            form_params: '{"DefaultActivitySid": "default_activity_sid", "EventCallbackUrl": "/example", "FriendlyName": "friendly_name", "TimeoutActivitySid": "timeout_activity_sid"}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "DELETE",
            url: "https://taskrouter.twilio.com/v1/Workspaces/WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm.json",
            auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
            status_code: 500,
            content_file: File.join(File.dirname(__FILE__), "workspace_delete_500.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://taskrouter.twilio.com/v1/Workspaces.json",
            auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
            status_code: 500,
            content_file: File.join(File.dirname(__FILE__), "workspace_read_500.json"),
            query_params: '{"FriendlyName": "friendly_name"}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://taskrouter.twilio.com/v1/Workspaces/WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm.json",
            auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
            status_code: 500,
            content_file: File.join(File.dirname(__FILE__), "workspace_fetch_500.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://taskrouter.twilio.com/v1/Workspaces.json",
            auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
            status_code: 500,
            content_file: File.join(File.dirname(__FILE__), "workspace_create_500.json"),
            query_params: '{}',
            form_params: '{"EventCallbackUrl": "/example", "FriendlyName": "friendly_name", "Template": "template"}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://taskrouter.twilio.com/v1/Workspaces/WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm.json",
            auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
            status_code: 500,
            content_file: File.join(File.dirname(__FILE__), "workspace_update_500.json"),
            query_params: '{}',
            form_params: '{"DefaultActivitySid": "default_activity_sid", "EventCallbackUrl": "/example", "FriendlyName": "friendly_name", "TimeoutActivitySid": "timeout_activity_sid"}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
    ]
  end
end