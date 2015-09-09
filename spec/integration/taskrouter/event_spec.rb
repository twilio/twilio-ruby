require 'spec_helper'

describe Twilio::Resources::Taskrouter::WorkspaceInstance::EventList do
  context "should fetch events" do
    it "and succeed" do
      client = Twilio::REST::TaskrouterClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "actor_sid": "WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "actor_type": "workspace",
       "actor_url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "description": "Worker JustinWorker updated to Idle Activity",
       "event_data": {
        "worker_activity_name": "Offline",
        "worker_activity_sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
        "worker_attributes": "{}",
        "worker_name": "JustinWorker",
        "worker_sid": "WKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
        "worker_time_in_previous_activity": "26",
        "workspace_name": "WorkspaceName",
        "workspace_sid": "WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
       },
       "event_date": "2015-02-07T00:32:41Z",
       "event_type": "worker.activity",
       "resource_sid": "WKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "resource_type": "worker",
       "resource_url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workers/WKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "sid": "EVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "source": "twilio",
       "source_ip_address": "1.2.3.4",
       "url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Events/EVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
          >))
      resource = client.workspaces.get('WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').events.get('EVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.sid }.not_to raise_error
    end
  
    it "and receive" do
      client = Twilio::REST::TaskrouterClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "actor_sid": "WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "actor_type": "workspace",
       "actor_url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "description": "Worker JustinWorker updated to Idle Activity",
       "event_data": {
        "worker_activity_name": "Offline",
        "worker_activity_sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
        "worker_attributes": "{}",
        "worker_name": "JustinWorker",
        "worker_sid": "WKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
        "worker_time_in_previous_activity": "26",
        "workspace_name": "WorkspaceName",
        "workspace_sid": "WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
       },
       "event_date": "2015-02-07T00:32:41Z",
       "event_type": "worker.activity",
       "resource_sid": "WKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "resource_type": "worker",
       "resource_url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workers/WKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "sid": "EVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "source": "twilio",
       "source_ip_address": "1.2.3.4",
       "url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Events/EVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
          >))
      resource = client.workspaces.get('WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').events.get('EVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.sid }.not_to raise_error
    end
  end

  context "should read events" do
    it "and succeed" do
      client = Twilio::REST::TaskrouterClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "events": [
        {
         "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "actor_sid": "WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "actor_type": "workspace",
         "actor_url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "description": "Worker JustinWorker updated to Idle Activity",
         "event_data": {
          "worker_activity_name": "Offline",
          "worker_activity_sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "worker_attributes": "{}",
          "worker_name": "JustinWorker",
          "worker_sid": "WKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "worker_time_in_previous_activity": "26",
          "workspace_name": "WorkspaceName",
          "workspace_sid": "WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
         },
         "event_date": "2015-02-07T00:32:41Z",
         "event_type": "worker.activity",
         "resource_sid": "WKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "resource_type": "worker",
         "resource_url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workers/WKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "sid": "EVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "source": "twilio",
         "source_ip_address": "1.2.3.4",
         "url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Events/EVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
        }
       ],
       "meta": {
        "first_page_url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Events?PageSize=50&Page=0",
        "key": "events",
        "next_page_url": null,
        "page": 0,
        "page_size": 50,
        "previous_page_url": null,
        "url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Events?PageSize=50&Page=0"
       }
      }
          >))
      expect { client.workspaces.get('WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').events.list(:'EndDate' => Date.new(2008, 1, 2), :'EventType' => "event_type", :'Minutes' => 1, :'ReservationSid' => "REaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", :'StartDate' => Date.new(2008, 1, 2), :'TaskQueueSid' => "WQaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", :'TaskSid' => "WTaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", :'WorkerSid' => "WKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", :'WorkflowSid' => "WFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") }.not_to raise_error
    end
  
    it "and receive" do
      client = Twilio::REST::TaskrouterClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "events": [
        {
         "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "actor_sid": "WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "actor_type": "workspace",
         "actor_url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "description": "Worker JustinWorker updated to Idle Activity",
         "event_data": {
          "worker_activity_name": "Offline",
          "worker_activity_sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "worker_attributes": "{}",
          "worker_name": "JustinWorker",
          "worker_sid": "WKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "worker_time_in_previous_activity": "26",
          "workspace_name": "WorkspaceName",
          "workspace_sid": "WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
         },
         "event_date": "2015-02-07T00:32:41Z",
         "event_type": "worker.activity",
         "resource_sid": "WKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "resource_type": "worker",
         "resource_url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workers/WKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "sid": "EVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "source": "twilio",
         "source_ip_address": "1.2.3.4",
         "url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Events/EVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
        }
       ],
       "meta": {
        "first_page_url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Events?PageSize=50&Page=0",
        "key": "events",
        "next_page_url": null,
        "page": 0,
        "page_size": 50,
        "previous_page_url": null,
        "url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Events?PageSize=50&Page=0"
       }
      }
          >))
      expect { client.workspaces.get('WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').events.list(:'EndDate' => Date.new(2008, 1, 2), :'EventType' => "event_type", :'Minutes' => 1, :'ReservationSid' => "REaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", :'StartDate' => Date.new(2008, 1, 2), :'TaskQueueSid' => "WQaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", :'TaskSid' => "WTaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", :'WorkerSid' => "WKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", :'WorkflowSid' => "WFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") }.not_to raise_error
    end
  end
end