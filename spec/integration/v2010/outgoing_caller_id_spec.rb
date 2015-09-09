require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::OutgoingCallerIdList do
  context "should fetch outgoing_caller_ids" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "date_created": "Fri, 21 Aug 2009 00:11:24 +0000",
       "date_updated": "Fri, 21 Aug 2009 00:11:24 +0000",
       "friendly_name": "(415) 867-5309",
       "phone_number": "+141586753096",
       "sid": "PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/OutgoingCallerIds/PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
          >))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').outgoing_caller_ids.get('PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
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
       "date_created": "Fri, 21 Aug 2009 00:11:24 +0000",
       "date_updated": "Fri, 21 Aug 2009 00:11:24 +0000",
       "friendly_name": "(415) 867-5309",
       "phone_number": "+141586753096",
       "sid": "PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/OutgoingCallerIds/PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
          >))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').outgoing_caller_ids.get('PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.sid }.not_to raise_error
    end
  end

  context "should read outgoing_caller_ids" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "end": 0,
       "first_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/OutgoingCallerIds.json?Page=0&PageSize=50",
       "last_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/OutgoingCallerIds.json?Page=0&PageSize=50",
       "next_page_uri": null,
       "num_pages": 1,
       "outgoing_caller_ids": [
        {
         "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "date_created": "Fri, 21 Aug 2009 00:11:24 +0000",
         "date_updated": "Fri, 21 Aug 2009 00:11:24 +0000",
         "friendly_name": "(415) 867-5309",
         "phone_number": "+141586753096",
         "sid": "PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/OutgoingCallerIds/PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
        }
       ],
       "page": 0,
       "page_size": 50,
       "previous_page_uri": null,
       "start": 0,
       "total": 1,
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/OutgoingCallerIds.json"
      }
          >))
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').outgoing_caller_ids.list(:'FriendlyName' => "friendly_name", :'PhoneNumber' => "+987654321") }.not_to raise_error
    end
  
    it "and receive" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "end": 0,
       "first_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/OutgoingCallerIds.json?Page=0&PageSize=50",
       "last_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/OutgoingCallerIds.json?Page=0&PageSize=50",
       "next_page_uri": null,
       "num_pages": 1,
       "outgoing_caller_ids": [
        {
         "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "date_created": "Fri, 21 Aug 2009 00:11:24 +0000",
         "date_updated": "Fri, 21 Aug 2009 00:11:24 +0000",
         "friendly_name": "(415) 867-5309",
         "phone_number": "+141586753096",
         "sid": "PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/OutgoingCallerIds/PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
        }
       ],
       "page": 0,
       "page_size": 50,
       "previous_page_uri": null,
       "start": 0,
       "total": 1,
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/OutgoingCallerIds.json"
      }
          >))
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').outgoing_caller_ids.list(:'FriendlyName' => "friendly_name", :'PhoneNumber' => "+987654321") }.not_to raise_error
    end
  end

  context "should create outgoing_caller_ids" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "date_created": "Fri, 21 Aug 2009 00:11:24 +0000",
       "date_updated": "Fri, 21 Aug 2009 00:11:24 +0000",
       "friendly_name": "(415) 867-5309",
       "phone_number": "+141586753096",
       "sid": "PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/OutgoingCallerIds/PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
          >))
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').outgoing_caller_ids.create(:'CallDelay' => 1, :'Extension' => "extension", :'FriendlyName' => "friendly_name", :'PhoneNumber' => "+987654321", :'StatusCallback' => "https://example.com", :'StatusCallbackMethod' => "GET") }.not_to raise_error
    end
  
    it "and receive" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "date_created": "Fri, 21 Aug 2009 00:11:24 +0000",
       "date_updated": "Fri, 21 Aug 2009 00:11:24 +0000",
       "friendly_name": "(415) 867-5309",
       "phone_number": "+141586753096",
       "sid": "PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/OutgoingCallerIds/PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
          >))
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').outgoing_caller_ids.create(:'CallDelay' => 1, :'Extension' => "extension", :'FriendlyName' => "friendly_name", :'PhoneNumber' => "+987654321", :'StatusCallback' => "https://example.com", :'StatusCallbackMethod' => "GET") }.not_to raise_error
    end
  end
end

describe Twilio::Resources::V2010::AccountInstance::OutgoingCallerIdInstance do
  context "should update outgoing_caller_ids" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      request = Hologram::Request.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/OutgoingCallerIds/PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          query_params: {},
          form_params: {:FriendlyName => "friendly_name"})
      holodeck.mock(request,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "date_created": "Fri, 21 Aug 2009 00:11:24 +0000",
       "date_updated": "Fri, 21 Aug 2009 00:11:24 +0000",
       "friendly_name": "(415) 867-5309",
       "phone_number": "+141586753096",
       "sid": "PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/OutgoingCallerIds/PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
          >))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').outgoing_caller_ids.get('PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').update(:'FriendlyName' => "friendly_name")
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
       "date_created": "Fri, 21 Aug 2009 00:11:24 +0000",
       "date_updated": "Fri, 21 Aug 2009 00:11:24 +0000",
       "friendly_name": "(415) 867-5309",
       "phone_number": "+141586753096",
       "sid": "PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/OutgoingCallerIds/PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
          >))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').outgoing_caller_ids.get('PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.update(:'FriendlyName' => "friendly_name") }.not_to raise_error
    end
  end

  context "should delete outgoing_caller_ids" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, '{}'))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').outgoing_caller_ids.get('PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.delete }.not_to raise_error
    end
  
    it "and receive" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, '{}'))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').outgoing_caller_ids.get('PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.delete }.not_to raise_error
    end
  end
end