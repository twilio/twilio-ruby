require 'spec_helper'

describe Twilio::Resources::Taskrouter::WorkspaceInstance::WorkerList::StatisticsList do
  context "should fetch None" do
    it "and succeed" do
      client = Twilio::REST::TaskrouterClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "cumulative": {
        "activity_durations": [
         {
          "avg": 0.0,
          "friendly_name": "80fa2beb-3a05-11e5-8fc8-98e0d9a1eb73",
          "max": 0,
          "min": 0,
          "sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "total": 0
         },
         {
          "avg": 0.0,
          "friendly_name": "817ca1c5-3a05-11e5-9292-98e0d9a1eb73",
          "max": 0,
          "min": 0,
          "sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "total": 0
         },
         {
          "avg": 0.0,
          "friendly_name": "Busy",
          "max": 0,
          "min": 0,
          "sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "total": 0
         },
         {
          "avg": 0.0,
          "friendly_name": "Idle",
          "max": 0,
          "min": 0,
          "sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "total": 0
         },
         {
          "avg": 0.0,
          "friendly_name": "Offline",
          "max": 0,
          "min": 0,
          "sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "total": 0
         },
         {
          "avg": 0.0,
          "friendly_name": "Reserved",
          "max": 0,
          "min": 0,
          "sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "total": 0
         }
        ],
        "end_time": "2015-08-18T16:35:33Z",
        "reservations_accepted": 0,
        "reservations_canceled": 0,
        "reservations_created": 0,
        "reservations_rejected": 0,
        "reservations_rescinded": 0,
        "reservations_timed_out": 0,
        "start_time": "2015-08-18T16:20:33Z",
        "tasks_assigned": 0
       },
       "realtime": {
        "activity_statistics": [
         {
          "friendly_name": "Offline",
          "sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "workers": 1
         },
         {
          "friendly_name": "Idle",
          "sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "workers": 0
         },
         {
          "friendly_name": "80fa2beb-3a05-11e5-8fc8-98e0d9a1eb73",
          "sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "workers": 0
         },
         {
          "friendly_name": "Reserved",
          "sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "workers": 0
         },
         {
          "friendly_name": "Busy",
          "sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "workers": 0
         },
         {
          "friendly_name": "817ca1c5-3a05-11e5-9292-98e0d9a1eb73",
          "sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "workers": 0
         }
        ],
        "total_workers": 1
       },
       "workspace_sid": "WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
          >))
      resource = client.workspaces.get('WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').workers.statistics.get('', {EndDate: Date.new(2008, 1, 2), FriendlyName: "friendly_name", Minutes: 1, StartDate: Date.new(2008, 1, 2), TaskQueueName: "task_queue_name", TaskQueueSid: "WQaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"})
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
       "cumulative": {
        "activity_durations": [
         {
          "avg": 0.0,
          "friendly_name": "80fa2beb-3a05-11e5-8fc8-98e0d9a1eb73",
          "max": 0,
          "min": 0,
          "sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "total": 0
         },
         {
          "avg": 0.0,
          "friendly_name": "817ca1c5-3a05-11e5-9292-98e0d9a1eb73",
          "max": 0,
          "min": 0,
          "sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "total": 0
         },
         {
          "avg": 0.0,
          "friendly_name": "Busy",
          "max": 0,
          "min": 0,
          "sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "total": 0
         },
         {
          "avg": 0.0,
          "friendly_name": "Idle",
          "max": 0,
          "min": 0,
          "sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "total": 0
         },
         {
          "avg": 0.0,
          "friendly_name": "Offline",
          "max": 0,
          "min": 0,
          "sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "total": 0
         },
         {
          "avg": 0.0,
          "friendly_name": "Reserved",
          "max": 0,
          "min": 0,
          "sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "total": 0
         }
        ],
        "end_time": "2015-08-18T16:35:33Z",
        "reservations_accepted": 0,
        "reservations_canceled": 0,
        "reservations_created": 0,
        "reservations_rejected": 0,
        "reservations_rescinded": 0,
        "reservations_timed_out": 0,
        "start_time": "2015-08-18T16:20:33Z",
        "tasks_assigned": 0
       },
       "realtime": {
        "activity_statistics": [
         {
          "friendly_name": "Offline",
          "sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "workers": 1
         },
         {
          "friendly_name": "Idle",
          "sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "workers": 0
         },
         {
          "friendly_name": "80fa2beb-3a05-11e5-8fc8-98e0d9a1eb73",
          "sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "workers": 0
         },
         {
          "friendly_name": "Reserved",
          "sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "workers": 0
         },
         {
          "friendly_name": "Busy",
          "sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "workers": 0
         },
         {
          "friendly_name": "817ca1c5-3a05-11e5-9292-98e0d9a1eb73",
          "sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "workers": 0
         }
        ],
        "total_workers": 1
       },
       "workspace_sid": "WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
          >))
      resource = client.workspaces.get('WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').workers.statistics.get('', {EndDate: Date.new(2008, 1, 2), FriendlyName: "friendly_name", Minutes: 1, StartDate: Date.new(2008, 1, 2), TaskQueueName: "task_queue_name", TaskQueueSid: "WQaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"})
      expect { resource.sid }.not_to raise_error
    end
  end
end