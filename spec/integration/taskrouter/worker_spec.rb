require 'spec_helper'

describe Twilio::Resources::Taskrouter::WorkspaceInstance::WorkerList do
  context "should read workers" do
    it "and succeed" do
      client = Twilio::REST::TaskrouterClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "meta": {
        "first_page_url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workers?PageSize=50&Page=0",
        "key": "workers",
        "next_page_url": null,
        "page": 0,
        "page_size": 50,
        "previous_page_url": null,
        "url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workers?PageSize=50&Page=0"
       },
       "workers": [
        {
         "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "activity_name": "Offline",
         "activity_sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "attributes": "{}",
         "available": false,
         "date_created": "2015-08-03T17:34:12Z",
         "date_status_changed": "2015-08-03T17:34:12Z",
         "date_updated": "2015-08-03T17:34:12Z",
         "friendly_name": "dc7d5461-3a05-11e5-a889-98e0d9a1eb73",
         "links": {
          "activity": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Activities/WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "workspace": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
         },
         "sid": "WKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workers/WKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "workspace_sid": "WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
        }
       ]
      }
          >))
      expect { client.workspaces.get('WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').workers.list(:'ActivityName' => "activity_name", :'ActivitySid' => "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", :'Available' => "available", :'FriendlyName' => "friendly_name", :'TargetWorkersExpression' => "target_workers_expression", :'TaskQueueName' => "task_queue_name", :'TaskQueueSid' => "WQaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") }.not_to raise_error
    end
  
    it "and receive" do
      client = Twilio::REST::TaskrouterClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "meta": {
        "first_page_url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workers?PageSize=50&Page=0",
        "key": "workers",
        "next_page_url": null,
        "page": 0,
        "page_size": 50,
        "previous_page_url": null,
        "url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workers?PageSize=50&Page=0"
       },
       "workers": [
        {
         "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "activity_name": "Offline",
         "activity_sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "attributes": "{}",
         "available": false,
         "date_created": "2015-08-03T17:34:12Z",
         "date_status_changed": "2015-08-03T17:34:12Z",
         "date_updated": "2015-08-03T17:34:12Z",
         "friendly_name": "dc7d5461-3a05-11e5-a889-98e0d9a1eb73",
         "links": {
          "activity": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Activities/WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "workspace": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
         },
         "sid": "WKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workers/WKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "workspace_sid": "WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
        }
       ]
      }
          >))
      expect { client.workspaces.get('WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').workers.list(:'ActivityName' => "activity_name", :'ActivitySid' => "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", :'Available' => "available", :'FriendlyName' => "friendly_name", :'TargetWorkersExpression' => "target_workers_expression", :'TaskQueueName' => "task_queue_name", :'TaskQueueSid' => "WQaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") }.not_to raise_error
    end
  end

  context "should create workers" do
    it "and succeed" do
      client = Twilio::REST::TaskrouterClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "activity_name": "available",
       "activity_sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "attributes": "{\"email\": \"test@twilio.com\", \"phone\": \"8675309\"}",
       "available": true,
       "date_created": "2014-05-14T10:50:02Z",
       "date_status_changed": "2014-05-14T23:26:06Z",
       "date_updated": "2014-05-14T23:26:06Z",
       "friendly_name": "Test Worker",
       "sid": "WKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workers/WKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "workspace_sid": "WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
          >))
      expect { client.workspaces.get('WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').workers.create(:'ActivitySid' => "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", :'Attributes' => "attributes", :'FriendlyName' => "friendly_name") }.not_to raise_error
    end
  
    it "and receive" do
      client = Twilio::REST::TaskrouterClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "activity_name": "available",
       "activity_sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "attributes": "{\"email\": \"test@twilio.com\", \"phone\": \"8675309\"}",
       "available": true,
       "date_created": "2014-05-14T10:50:02Z",
       "date_status_changed": "2014-05-14T23:26:06Z",
       "date_updated": "2014-05-14T23:26:06Z",
       "friendly_name": "Test Worker",
       "sid": "WKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workers/WKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "workspace_sid": "WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
          >))
      expect { client.workspaces.get('WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').workers.create(:'ActivitySid' => "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", :'Attributes' => "attributes", :'FriendlyName' => "friendly_name") }.not_to raise_error
    end
  end

  context "should fetch workers" do
    it "and succeed" do
      client = Twilio::REST::TaskrouterClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "activity_name": "available",
       "activity_sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "attributes": "{\"email\": \"test@twilio.com\", \"phone\": \"8675309\"}",
       "available": true,
       "date_created": "2014-05-14T10:50:02Z",
       "date_status_changed": "2014-05-14T23:26:06Z",
       "date_updated": "2014-05-14T23:26:06Z",
       "friendly_name": "Test Worker",
       "sid": "WKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workers/WKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "workspace_sid": "WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
          >))
      resource = client.workspaces.get('WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').workers.get('WKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
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
       "activity_name": "available",
       "activity_sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "attributes": "{\"email\": \"test@twilio.com\", \"phone\": \"8675309\"}",
       "available": true,
       "date_created": "2014-05-14T10:50:02Z",
       "date_status_changed": "2014-05-14T23:26:06Z",
       "date_updated": "2014-05-14T23:26:06Z",
       "friendly_name": "Test Worker",
       "sid": "WKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workers/WKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "workspace_sid": "WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
          >))
      resource = client.workspaces.get('WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').workers.get('WKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.sid }.not_to raise_error
    end
  end
end

describe Twilio::Resources::Taskrouter::WorkspaceInstance::WorkerInstance do
  context "should update workers" do
    it "and succeed" do
      client = Twilio::REST::TaskrouterClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      request = Hologram::Request.new(
          method: "POST",
          url: "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workers/WKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          query_params: {},
          form_params: {:ActivitySid => "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", :Attributes => "attributes", :FriendlyName => "friendly_name"})
      holodeck.mock(request,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "activity_name": "available",
       "activity_sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "attributes": "{\"email\": \"test@twilio.com\", \"phone\": \"8675309\"}",
       "available": true,
       "date_created": "2014-05-14T10:50:02Z",
       "date_status_changed": "2014-05-14T23:26:06Z",
       "date_updated": "2014-05-14T23:26:06Z",
       "friendly_name": "Test Worker",
       "sid": "WKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workers/WKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "workspace_sid": "WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
          >))
      resource = client.workspaces.get('WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').workers.get('WKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').update(:'ActivitySid' => "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", :'Attributes' => "attributes", :'FriendlyName' => "friendly_name")
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
       "activity_name": "available",
       "activity_sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "attributes": "{\"email\": \"test@twilio.com\", \"phone\": \"8675309\"}",
       "available": true,
       "date_created": "2014-05-14T10:50:02Z",
       "date_status_changed": "2014-05-14T23:26:06Z",
       "date_updated": "2014-05-14T23:26:06Z",
       "friendly_name": "Test Worker",
       "sid": "WKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workers/WKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "workspace_sid": "WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
          >))
      resource = client.workspaces.get('WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').workers.get('WKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.update(:'ActivitySid' => "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", :'Attributes' => "attributes", :'FriendlyName' => "friendly_name") }.not_to raise_error
    end
  end

  context "should delete workers" do
    it "and succeed" do
      client = Twilio::REST::TaskrouterClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, '{}'))
      resource = client.workspaces.get('WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').workers.get('WKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.delete }.not_to raise_error
    end
  
    it "and receive" do
      client = Twilio::REST::TaskrouterClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, '{}'))
      resource = client.workspaces.get('WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').workers.get('WKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.delete }.not_to raise_error
    end
  end
end