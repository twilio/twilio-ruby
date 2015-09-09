require 'spec_helper'

describe Twilio::Resources::Monitor::EventList do
  context "should fetch events" do
    it "and succeed" do
      client = Twilio::REST::MonitorClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "actor_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "actor_type": "account",
       "description": null,
       "event_data": {
        "friendly_name": {
         "previous": "SubAccount Created at 2014-10-03 09:48 am",
         "updated": "Mr. Friendly"
        }
       },
       "event_date": "2014-10-03T16:48:25Z",
       "event_type": "account.updated",
       "links": {
        "actor": "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
        "resource": "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
       },
       "resource_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "resource_type": "account",
       "sid": "AEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "source": "api",
       "source_ip_address": "10.86.6.250",
       "url": "https://monitor.twilio.com/v1/Events/AEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
          >))
      resource = client.events.get('AEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.sid }.not_to raise_error
    end
  
    it "and receive" do
      client = Twilio::REST::MonitorClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "actor_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "actor_type": "account",
       "description": null,
       "event_data": {
        "friendly_name": {
         "previous": "SubAccount Created at 2014-10-03 09:48 am",
         "updated": "Mr. Friendly"
        }
       },
       "event_date": "2014-10-03T16:48:25Z",
       "event_type": "account.updated",
       "links": {
        "actor": "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
        "resource": "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
       },
       "resource_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "resource_type": "account",
       "sid": "AEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "source": "api",
       "source_ip_address": "10.86.6.250",
       "url": "https://monitor.twilio.com/v1/Events/AEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
          >))
      resource = client.events.get('AEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.sid }.not_to raise_error
    end
  end

  context "should read events" do
    it "and succeed" do
      client = Twilio::REST::MonitorClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "events": [
        {
         "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "actor_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "actor_type": "account",
         "description": null,
         "event_data": {
          "friendly_name": {
           "previous": "SubAccount Created at 2014-10-03 09:48 am",
           "updated": "Mr. Friendly"
          }
         },
         "event_date": "2014-10-03T16:48:25Z",
         "event_type": "account.updated",
         "links": {
          "actor": "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "resource": "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
         },
         "resource_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "resource_type": "account",
         "sid": "AEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "source": "api",
         "source_ip_address": "10.86.6.250",
         "url": "https://monitor.twilio.com/v1/Events/AEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
        }
       ],
       "meta": {
        "first_page_url": "https://monitor.twilio.com/v1/Events?PageSize=50&Page=0",
        "key": "events",
        "next_page_url": null,
        "page": 0,
        "page_size": 50,
        "previous_page_url": null,
        "url": "https://monitor.twilio.com/v1/Events?PageSize=50&Page=0"
       }
      }
          >))
      expect { client.events.list(:'ActorSid' => "USaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", :'EndDate' => Date.new(2008, 1, 1), :'EventType' => "event_type", :'ResourceSid' => "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", :'SourceIpAddress' => "source_ip_address", :'StartDate' => Date.new(2008, 1, 1)) }.not_to raise_error
    end
  
    it "and receive" do
      client = Twilio::REST::MonitorClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "events": [
        {
         "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "actor_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "actor_type": "account",
         "description": null,
         "event_data": {
          "friendly_name": {
           "previous": "SubAccount Created at 2014-10-03 09:48 am",
           "updated": "Mr. Friendly"
          }
         },
         "event_date": "2014-10-03T16:48:25Z",
         "event_type": "account.updated",
         "links": {
          "actor": "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "resource": "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
         },
         "resource_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "resource_type": "account",
         "sid": "AEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "source": "api",
         "source_ip_address": "10.86.6.250",
         "url": "https://monitor.twilio.com/v1/Events/AEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
        }
       ],
       "meta": {
        "first_page_url": "https://monitor.twilio.com/v1/Events?PageSize=50&Page=0",
        "key": "events",
        "next_page_url": null,
        "page": 0,
        "page_size": 50,
        "previous_page_url": null,
        "url": "https://monitor.twilio.com/v1/Events?PageSize=50&Page=0"
       }
      }
          >))
      expect { client.events.list(:'ActorSid' => "USaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", :'EndDate' => Date.new(2008, 1, 1), :'EventType' => "event_type", :'ResourceSid' => "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", :'SourceIpAddress' => "source_ip_address", :'StartDate' => Date.new(2008, 1, 1)) }.not_to raise_error
    end
  end
end