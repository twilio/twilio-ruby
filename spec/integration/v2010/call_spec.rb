require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::CallList do
  context "should create calls" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "annotation": null,
       "answered_by": null,
       "api_version": "2010-04-01",
       "caller_name": null,
       "date_created": "Tue, 31 Aug 2010 20:36:28 +0000",
       "date_updated": "Tue, 31 Aug 2010 20:36:44 +0000",
       "direction": "inbound",
       "duration": "15",
       "end_time": "Tue, 31 Aug 2010 20:36:44 +0000",
       "forwarded_from": "+141586753093",
       "from": "+141586753091",
       "group_sid": null,
       "parent_call_sid": null,
       "phone_number_sid": "PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "price": "-0.03000",
       "sid": "CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "start_time": "Tue, 31 Aug 2010 20:36:29 +0000",
       "status": "completed",
       "subresource_uris": {
        "notifications": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Calls/CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Notifications.json",
        "recordings": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Calls/CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Recordings.json"
       },
       "to": "+141586753093",
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Calls/CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
          >))
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').calls.create(:'FallbackMethod' => "GET", :'FallbackUrl' => "https://example.com", :'From' => "+987654321", :'IfMachine' => "if_machine", :'Method' => "GET", :'Record' => true, :'SendDigits' => "send_digits", :'StatusCallback' => "https://example.com", :'StatusCallbackMethod' => "GET", :'Timeout' => 1, :'To' => "+123456789", :'Url' => "https://example.com") }.not_to raise_error
    end
  
    it "and receive" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "annotation": null,
       "answered_by": null,
       "api_version": "2010-04-01",
       "caller_name": null,
       "date_created": "Tue, 31 Aug 2010 20:36:28 +0000",
       "date_updated": "Tue, 31 Aug 2010 20:36:44 +0000",
       "direction": "inbound",
       "duration": "15",
       "end_time": "Tue, 31 Aug 2010 20:36:44 +0000",
       "forwarded_from": "+141586753093",
       "from": "+141586753091",
       "group_sid": null,
       "parent_call_sid": null,
       "phone_number_sid": "PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "price": "-0.03000",
       "sid": "CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "start_time": "Tue, 31 Aug 2010 20:36:29 +0000",
       "status": "completed",
       "subresource_uris": {
        "notifications": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Calls/CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Notifications.json",
        "recordings": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Calls/CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Recordings.json"
       },
       "to": "+141586753093",
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Calls/CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
          >))
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').calls.create(:'FallbackMethod' => "GET", :'FallbackUrl' => "https://example.com", :'From' => "+987654321", :'IfMachine' => "if_machine", :'Method' => "GET", :'Record' => true, :'SendDigits' => "send_digits", :'StatusCallback' => "https://example.com", :'StatusCallbackMethod' => "GET", :'Timeout' => 1, :'To' => "+123456789", :'Url' => "https://example.com") }.not_to raise_error
    end
  end

  context "should fetch calls" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "annotation": null,
       "answered_by": null,
       "api_version": "2010-04-01",
       "caller_name": null,
       "date_created": "Tue, 31 Aug 2010 20:36:28 +0000",
       "date_updated": "Tue, 31 Aug 2010 20:36:44 +0000",
       "direction": "inbound",
       "duration": "15",
       "end_time": "Tue, 31 Aug 2010 20:36:44 +0000",
       "forwarded_from": "+141586753093",
       "from": "+141586753091",
       "group_sid": null,
       "parent_call_sid": null,
       "phone_number_sid": "PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "price": "-0.03000",
       "sid": "CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "start_time": "Tue, 31 Aug 2010 20:36:29 +0000",
       "status": "completed",
       "subresource_uris": {
        "notifications": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Calls/CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Notifications.json",
        "recordings": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Calls/CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Recordings.json"
       },
       "to": "+141586753093",
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Calls/CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
          >))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').calls.get('CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.sid }.not_to raise_error
    end
  
    it "and receive" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "annotation": null,
       "answered_by": null,
       "api_version": "2010-04-01",
       "caller_name": null,
       "date_created": "Tue, 31 Aug 2010 20:36:28 +0000",
       "date_updated": "Tue, 31 Aug 2010 20:36:44 +0000",
       "direction": "inbound",
       "duration": "15",
       "end_time": "Tue, 31 Aug 2010 20:36:44 +0000",
       "forwarded_from": "+141586753093",
       "from": "+141586753091",
       "group_sid": null,
       "parent_call_sid": null,
       "phone_number_sid": "PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "price": "-0.03000",
       "sid": "CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "start_time": "Tue, 31 Aug 2010 20:36:29 +0000",
       "status": "completed",
       "subresource_uris": {
        "notifications": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Calls/CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Notifications.json",
        "recordings": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Calls/CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Recordings.json"
       },
       "to": "+141586753093",
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Calls/CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
          >))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').calls.get('CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.sid }.not_to raise_error
    end
  end

  context "should read calls" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "calls": [
        {
         "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "annotation": null,
         "answered_by": null,
         "api_version": "2010-04-01",
         "caller_name": "",
         "date_created": "Fri, 04 Sep 2015 22:48:30 +0000",
         "date_updated": "Fri, 04 Sep 2015 22:48:35 +0000",
         "direction": "outbound-api",
         "duration": "0",
         "end_time": "Fri, 04 Sep 2015 22:48:35 +0000",
         "forwarded_from": null,
         "from": "kevin",
         "from_formatted": "kevin",
         "group_sid": null,
         "parent_call_sid": null,
         "phone_number_sid": "",
         "price": null,
         "price_unit": "USD",
         "sid": "CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "start_time": "Fri, 04 Sep 2015 22:48:31 +0000",
         "status": "failed",
         "subresource_uris": {
          "notifications": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Calls/CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Notifications.json",
          "recordings": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Calls/CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Recordings.json"
         },
         "to": "sip:kevin@example.com",
         "to_formatted": "sip:kevin@example.com",
         "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Calls/CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
        }
       ],
       "end": 0,
       "first_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Calls.json?PageSize=1&Page=0",
       "last_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Calls.json?PageSize=1&Page=9690",
       "next_page_uri": null,
       "num_pages": 9691,
       "page": 0,
       "page_size": 1,
       "previous_page_uri": null,
       "start": 0,
       "total": 9691,
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Calls.json?PageSize=1&Page=0"
      }
          >))
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').calls.list(:'EndTime' => Date.new(2008, 1, 1), :'From' => "+987654321", :'ParentCallSid' => "CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", :'StartTime' => Date.new(2008, 1, 1), :'Status' => "queued", :'To' => "+123456789") }.not_to raise_error
    end
  
    it "and receive" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "calls": [
        {
         "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "annotation": null,
         "answered_by": null,
         "api_version": "2010-04-01",
         "caller_name": "",
         "date_created": "Fri, 04 Sep 2015 22:48:30 +0000",
         "date_updated": "Fri, 04 Sep 2015 22:48:35 +0000",
         "direction": "outbound-api",
         "duration": "0",
         "end_time": "Fri, 04 Sep 2015 22:48:35 +0000",
         "forwarded_from": null,
         "from": "kevin",
         "from_formatted": "kevin",
         "group_sid": null,
         "parent_call_sid": null,
         "phone_number_sid": "",
         "price": null,
         "price_unit": "USD",
         "sid": "CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "start_time": "Fri, 04 Sep 2015 22:48:31 +0000",
         "status": "failed",
         "subresource_uris": {
          "notifications": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Calls/CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Notifications.json",
          "recordings": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Calls/CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Recordings.json"
         },
         "to": "sip:kevin@example.com",
         "to_formatted": "sip:kevin@example.com",
         "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Calls/CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
        }
       ],
       "end": 0,
       "first_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Calls.json?PageSize=1&Page=0",
       "last_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Calls.json?PageSize=1&Page=9690",
       "next_page_uri": null,
       "num_pages": 9691,
       "page": 0,
       "page_size": 1,
       "previous_page_uri": null,
       "start": 0,
       "total": 9691,
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Calls.json?PageSize=1&Page=0"
      }
          >))
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').calls.list(:'EndTime' => Date.new(2008, 1, 1), :'From' => "+987654321", :'ParentCallSid' => "CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", :'StartTime' => Date.new(2008, 1, 1), :'Status' => "queued", :'To' => "+123456789") }.not_to raise_error
    end
  end
end

describe Twilio::Resources::V2010::AccountInstance::CallInstance do
  context "should delete calls" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, '{}'))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').calls.get('CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.delete }.not_to raise_error
    end
  
    it "and receive" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, '{}'))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').calls.get('CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.delete }.not_to raise_error
    end
  end

  context "should update calls" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      request = Hologram::Request.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Calls/CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          query_params: {},
          form_params: {:FallbackMethod => "GET", :FallbackUrl => "https://example.com", :Method => "GET", :Status => "queued", :StatusCallback => "https://example.com", :StatusCallbackMethod => "GET", :Url => "https://example.com"})
      holodeck.mock(request,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "annotation": null,
       "answered_by": null,
       "api_version": "2010-04-01",
       "caller_name": null,
       "date_created": "Tue, 31 Aug 2010 20:36:28 +0000",
       "date_updated": "Tue, 31 Aug 2010 20:36:44 +0000",
       "direction": "inbound",
       "duration": "15",
       "end_time": "Tue, 31 Aug 2010 20:36:44 +0000",
       "forwarded_from": "+141586753093",
       "from": "+141586753091",
       "group_sid": null,
       "parent_call_sid": null,
       "phone_number_sid": "PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "price": "-0.03000",
       "sid": "CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "start_time": "Tue, 31 Aug 2010 20:36:29 +0000",
       "status": "completed",
       "subresource_uris": {
        "notifications": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Calls/CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Notifications.json",
        "recordings": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Calls/CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Recordings.json"
       },
       "to": "+141586753093",
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Calls/CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
          >))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').calls.get('CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').update(:'FallbackMethod' => "GET", :'FallbackUrl' => "https://example.com", :'Method' => "GET", :'Status' => "queued", :'StatusCallback' => "https://example.com", :'StatusCallbackMethod' => "GET", :'Url' => "https://example.com")
      expect(holodeck.requested?(request)).to equal(true)
    end
  
    it "and receive" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "annotation": null,
       "answered_by": null,
       "api_version": "2010-04-01",
       "caller_name": null,
       "date_created": "Tue, 31 Aug 2010 20:36:28 +0000",
       "date_updated": "Tue, 31 Aug 2010 20:36:44 +0000",
       "direction": "inbound",
       "duration": "15",
       "end_time": "Tue, 31 Aug 2010 20:36:44 +0000",
       "forwarded_from": "+141586753093",
       "from": "+141586753091",
       "group_sid": null,
       "parent_call_sid": null,
       "phone_number_sid": "PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "price": "-0.03000",
       "sid": "CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "start_time": "Tue, 31 Aug 2010 20:36:29 +0000",
       "status": "completed",
       "subresource_uris": {
        "notifications": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Calls/CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Notifications.json",
        "recordings": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Calls/CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Recordings.json"
       },
       "to": "+141586753093",
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Calls/CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
          >))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').calls.get('CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.update(:'FallbackMethod' => "GET", :'FallbackUrl' => "https://example.com", :'Method' => "GET", :'Status' => "queued", :'StatusCallback' => "https://example.com", :'StatusCallbackMethod' => "GET", :'Url' => "https://example.com") }.not_to raise_error
    end
  end
end