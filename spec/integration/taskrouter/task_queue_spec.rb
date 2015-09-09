require 'spec_helper'

describe Twilio::Resources::Taskrouter::WorkspaceInstance::TaskQueueList do
  context "should fetch task_queues" do
    it "and succeed" do
      client = Twilio::REST::TaskrouterClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "assignment_activity_name": "817ca1c5-3a05-11e5-9292-98e0d9a1eb73",
       "assignment_activity_sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "date_created": "2015-08-03T17:31:41Z",
       "date_updated": "2015-08-03T17:31:41Z",
       "friendly_name": "81f96435-3a05-11e5-9f81-98e0d9a1eb73",
       "links": {
        "assignment_activity": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Activities/WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
        "reservation_activity": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Activities/WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
        "workspace": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
       },
       "reservation_activity_name": "80fa2beb-3a05-11e5-8fc8-98e0d9a1eb73",
       "reservation_activity_sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "sid": "WQaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "target_workers": null,
       "url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/TaskQueues/WQaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "workspace_sid": "WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
          >))
      resource = client.workspaces.get('WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').task_queues.get('WQaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
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
       "assignment_activity_name": "817ca1c5-3a05-11e5-9292-98e0d9a1eb73",
       "assignment_activity_sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "date_created": "2015-08-03T17:31:41Z",
       "date_updated": "2015-08-03T17:31:41Z",
       "friendly_name": "81f96435-3a05-11e5-9f81-98e0d9a1eb73",
       "links": {
        "assignment_activity": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Activities/WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
        "reservation_activity": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Activities/WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
        "workspace": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
       },
       "reservation_activity_name": "80fa2beb-3a05-11e5-8fc8-98e0d9a1eb73",
       "reservation_activity_sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "sid": "WQaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "target_workers": null,
       "url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/TaskQueues/WQaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "workspace_sid": "WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
          >))
      resource = client.workspaces.get('WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').task_queues.get('WQaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.sid }.not_to raise_error
    end
  end

  context "should read task_queues" do
    it "and succeed" do
      client = Twilio::REST::TaskrouterClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "meta": {
        "first_page_url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/TaskQueues?PageSize=50&Page=0",
        "key": "task_queues",
        "next_page_url": null,
        "page": 0,
        "page_size": 50,
        "previous_page_url": null,
        "url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/TaskQueues?PageSize=50&Page=0"
       },
       "task_queues": [
        {
         "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "assignment_activity_name": "817ca1c5-3a05-11e5-9292-98e0d9a1eb73",
         "assignment_activity_sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "date_created": "2015-08-03T17:31:41Z",
         "date_updated": "2015-08-03T17:31:41Z",
         "friendly_name": "81f96435-3a05-11e5-9f81-98e0d9a1eb73",
         "links": {
          "assignment_activity": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Activities/WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "reservation_activity": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Activities/WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "workspace": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
         },
         "reservation_activity_name": "80fa2beb-3a05-11e5-8fc8-98e0d9a1eb73",
         "reservation_activity_sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "sid": "WQaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "target_workers": null,
         "url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/TaskQueues/WQaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "workspace_sid": "WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
        }
       ]
      }
          >))
      expect { client.workspaces.get('WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').task_queues.list(:'EvaluateWorkerAttributes' => "evaluate_worker_attributes", :'FriendlyName' => "friendly_name") }.not_to raise_error
    end
  
    it "and receive" do
      client = Twilio::REST::TaskrouterClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "meta": {
        "first_page_url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/TaskQueues?PageSize=50&Page=0",
        "key": "task_queues",
        "next_page_url": null,
        "page": 0,
        "page_size": 50,
        "previous_page_url": null,
        "url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/TaskQueues?PageSize=50&Page=0"
       },
       "task_queues": [
        {
         "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "assignment_activity_name": "817ca1c5-3a05-11e5-9292-98e0d9a1eb73",
         "assignment_activity_sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "date_created": "2015-08-03T17:31:41Z",
         "date_updated": "2015-08-03T17:31:41Z",
         "friendly_name": "81f96435-3a05-11e5-9f81-98e0d9a1eb73",
         "links": {
          "assignment_activity": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Activities/WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "reservation_activity": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Activities/WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "workspace": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
         },
         "reservation_activity_name": "80fa2beb-3a05-11e5-8fc8-98e0d9a1eb73",
         "reservation_activity_sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "sid": "WQaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "target_workers": null,
         "url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/TaskQueues/WQaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "workspace_sid": "WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
        }
       ]
      }
          >))
      expect { client.workspaces.get('WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').task_queues.list(:'EvaluateWorkerAttributes' => "evaluate_worker_attributes", :'FriendlyName' => "friendly_name") }.not_to raise_error
    end
  end

  context "should create task_queues" do
    it "and succeed" do
      client = Twilio::REST::TaskrouterClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "assignment_activity_name": "817ca1c5-3a05-11e5-9292-98e0d9a1eb73",
       "assignment_activity_sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "date_created": "2015-08-03T17:31:41Z",
       "date_updated": "2015-08-03T17:31:41Z",
       "friendly_name": "81f96435-3a05-11e5-9f81-98e0d9a1eb73",
       "links": {
        "assignment_activity": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Activities/WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
        "reservation_activity": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Activities/WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
        "workspace": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
       },
       "reservation_activity_name": "80fa2beb-3a05-11e5-8fc8-98e0d9a1eb73",
       "reservation_activity_sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "sid": "WQaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "target_workers": null,
       "url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/TaskQueues/WQaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "workspace_sid": "WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
          >))
      expect { client.workspaces.get('WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').task_queues.create(:'AssignmentActivitySid' => "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", :'FriendlyName' => "friendly_name", :'MaxReservedWorkers' => 1, :'ReservationActivitySid' => "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", :'TargetWorkers' => "target_workers") }.not_to raise_error
    end
  
    it "and receive" do
      client = Twilio::REST::TaskrouterClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "assignment_activity_name": "817ca1c5-3a05-11e5-9292-98e0d9a1eb73",
       "assignment_activity_sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "date_created": "2015-08-03T17:31:41Z",
       "date_updated": "2015-08-03T17:31:41Z",
       "friendly_name": "81f96435-3a05-11e5-9f81-98e0d9a1eb73",
       "links": {
        "assignment_activity": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Activities/WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
        "reservation_activity": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Activities/WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
        "workspace": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
       },
       "reservation_activity_name": "80fa2beb-3a05-11e5-8fc8-98e0d9a1eb73",
       "reservation_activity_sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "sid": "WQaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "target_workers": null,
       "url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/TaskQueues/WQaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "workspace_sid": "WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
          >))
      expect { client.workspaces.get('WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').task_queues.create(:'AssignmentActivitySid' => "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", :'FriendlyName' => "friendly_name", :'MaxReservedWorkers' => 1, :'ReservationActivitySid' => "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", :'TargetWorkers' => "target_workers") }.not_to raise_error
    end
  end
end

describe Twilio::Resources::Taskrouter::WorkspaceInstance::TaskQueueInstance do
  context "should update task_queues" do
    it "and succeed" do
      client = Twilio::REST::TaskrouterClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      request = Hologram::Request.new(
          method: "POST",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/TaskQueues/WQaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          query_params: {},
          form_params: {:AssignmentActivitySid => "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", :FriendlyName => "friendly_name", :MaxReservedWorkers => 1, :ReservationActivitySid => "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", :TargetWorkers => "target_workers"})
      holodeck.mock(request,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "assignment_activity_name": "817ca1c5-3a05-11e5-9292-98e0d9a1eb73",
       "assignment_activity_sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "date_created": "2015-08-03T17:31:41Z",
       "date_updated": "2015-08-03T17:31:41Z",
       "friendly_name": "81f96435-3a05-11e5-9f81-98e0d9a1eb73",
       "links": {
        "assignment_activity": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Activities/WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
        "reservation_activity": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Activities/WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
        "workspace": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
       },
       "reservation_activity_name": "80fa2beb-3a05-11e5-8fc8-98e0d9a1eb73",
       "reservation_activity_sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "sid": "WQaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "target_workers": null,
       "url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/TaskQueues/WQaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "workspace_sid": "WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
          >))
      resource = client.workspaces.get('WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').task_queues.get('WQaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').update(:'AssignmentActivitySid' => "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", :'FriendlyName' => "friendly_name", :'MaxReservedWorkers' => 1, :'ReservationActivitySid' => "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", :'TargetWorkers' => "target_workers")
      expect(holodeck.requested?(request)).to equal(true)
    end
  
    it "and receive" do
      client = Twilio::REST::TaskrouterClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "assignment_activity_name": "817ca1c5-3a05-11e5-9292-98e0d9a1eb73",
       "assignment_activity_sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "date_created": "2015-08-03T17:31:41Z",
       "date_updated": "2015-08-03T17:31:41Z",
       "friendly_name": "81f96435-3a05-11e5-9f81-98e0d9a1eb73",
       "links": {
        "assignment_activity": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Activities/WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
        "reservation_activity": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Activities/WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
        "workspace": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
       },
       "reservation_activity_name": "80fa2beb-3a05-11e5-8fc8-98e0d9a1eb73",
       "reservation_activity_sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "sid": "WQaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "target_workers": null,
       "url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/TaskQueues/WQaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "workspace_sid": "WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
          >))
      resource = client.workspaces.get('WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').task_queues.get('WQaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.update(:'AssignmentActivitySid' => "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", :'FriendlyName' => "friendly_name", :'MaxReservedWorkers' => 1, :'ReservationActivitySid' => "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", :'TargetWorkers' => "target_workers") }.not_to raise_error
    end
  end

  context "should delete task_queues" do
    it "and succeed" do
      client = Twilio::REST::TaskrouterClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, '{}'))
      resource = client.workspaces.get('WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').task_queues.get('WQaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.delete }.not_to raise_error
    end
  
    it "and receive" do
      client = Twilio::REST::TaskrouterClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, '{}'))
      resource = client.workspaces.get('WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').task_queues.get('WQaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.delete }.not_to raise_error
    end
  end
end