require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::MessageList do
  context "should create messages" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "api_version": "2010-04-01",
       "body": "O Slash: \u00d8, PoP: \ud83d\udca9",
       "date_created": "Thu, 30 Jul 2015 20:12:31 +0000",
       "date_sent": "Thu, 30 Jul 2015 20:12:33 +0000",
       "date_updated": "Thu, 30 Jul 2015 20:12:33 +0000",
       "direction": "outbound-api",
       "error_code": null,
       "error_message": null,
       "from": "+14155552345",
       "num_media": "0",
       "num_segments": "1",
       "price": "-0.00750",
       "price_unit": "USD",
       "sid": "SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "status": "sent",
       "subresource_uris": {
        "media": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Media.json"
       },
       "to": "+14155552345",
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
          >))
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').messages.create(:'ApplicationSid' => "APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", :'Body' => "body", :'From' => "+987654321", :'StatusCallback' => "https://example.com", :'To' => "+123456789") }.not_to raise_error
    end
  
    it "and receive" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "api_version": "2010-04-01",
       "body": "O Slash: \u00d8, PoP: \ud83d\udca9",
       "date_created": "Thu, 30 Jul 2015 20:12:31 +0000",
       "date_sent": "Thu, 30 Jul 2015 20:12:33 +0000",
       "date_updated": "Thu, 30 Jul 2015 20:12:33 +0000",
       "direction": "outbound-api",
       "error_code": null,
       "error_message": null,
       "from": "+14155552345",
       "num_media": "0",
       "num_segments": "1",
       "price": "-0.00750",
       "price_unit": "USD",
       "sid": "SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "status": "sent",
       "subresource_uris": {
        "media": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Media.json"
       },
       "to": "+14155552345",
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
          >))
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').messages.create(:'ApplicationSid' => "APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", :'Body' => "body", :'From' => "+987654321", :'StatusCallback' => "https://example.com", :'To' => "+123456789") }.not_to raise_error
    end
  end

  context "should fetch messages" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "api_version": "2010-04-01",
       "body": "O Slash: \u00d8, PoP: \ud83d\udca9",
       "date_created": "Thu, 30 Jul 2015 20:12:31 +0000",
       "date_sent": "Thu, 30 Jul 2015 20:12:33 +0000",
       "date_updated": "Thu, 30 Jul 2015 20:12:33 +0000",
       "direction": "outbound-api",
       "error_code": null,
       "error_message": null,
       "from": "+14155552345",
       "num_media": "0",
       "num_segments": "1",
       "price": "-0.00750",
       "price_unit": "USD",
       "sid": "SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "status": "sent",
       "subresource_uris": {
        "media": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Media.json"
       },
       "to": "+14155552345",
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
          >))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').messages.get('SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
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
       "api_version": "2010-04-01",
       "body": "O Slash: \u00d8, PoP: \ud83d\udca9",
       "date_created": "Thu, 30 Jul 2015 20:12:31 +0000",
       "date_sent": "Thu, 30 Jul 2015 20:12:33 +0000",
       "date_updated": "Thu, 30 Jul 2015 20:12:33 +0000",
       "direction": "outbound-api",
       "error_code": null,
       "error_message": null,
       "from": "+14155552345",
       "num_media": "0",
       "num_segments": "1",
       "price": "-0.00750",
       "price_unit": "USD",
       "sid": "SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "status": "sent",
       "subresource_uris": {
        "media": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Media.json"
       },
       "to": "+14155552345",
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
          >))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').messages.get('SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.sid }.not_to raise_error
    end
  end

  context "should read messages" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "end": 0,
       "first_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages.json?PageSize=1&Page=0",
       "last_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages.json?PageSize=1&Page=119771",
       "messages": [
        {
         "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "api_version": "2010-04-01",
         "body": "O Slash: \u00d8, PoP: \ud83d\udca9",
         "date_created": "Fri, 04 Sep 2015 22:54:39 +0000",
         "date_sent": "Fri, 04 Sep 2015 22:54:41 +0000",
         "date_updated": "Fri, 04 Sep 2015 22:54:41 +0000",
         "direction": "outbound-api",
         "error_code": null,
         "error_message": null,
         "from": "+14155552345",
         "num_media": "0",
         "num_segments": "1",
         "price": "-0.00750",
         "price_unit": "USD",
         "sid": "SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "status": "sent",
         "subresource_uris": {
          "media": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Media.json"
         },
         "to": "+14155552345",
         "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
        }
       ],
       "next_page_uri": null,
       "num_pages": 119772,
       "page": 0,
       "page_size": 1,
       "previous_page_uri": null,
       "start": 0,
       "total": 119772,
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages.json?PageSize=1&Page=0"
      }
          >))
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').messages.list(:'DateSent' => Date.new(2008, 1, 1), :'From' => "+987654321", :'To' => "+123456789") }.not_to raise_error
    end
  
    it "and receive" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "end": 0,
       "first_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages.json?PageSize=1&Page=0",
       "last_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages.json?PageSize=1&Page=119771",
       "messages": [
        {
         "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "api_version": "2010-04-01",
         "body": "O Slash: \u00d8, PoP: \ud83d\udca9",
         "date_created": "Fri, 04 Sep 2015 22:54:39 +0000",
         "date_sent": "Fri, 04 Sep 2015 22:54:41 +0000",
         "date_updated": "Fri, 04 Sep 2015 22:54:41 +0000",
         "direction": "outbound-api",
         "error_code": null,
         "error_message": null,
         "from": "+14155552345",
         "num_media": "0",
         "num_segments": "1",
         "price": "-0.00750",
         "price_unit": "USD",
         "sid": "SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "status": "sent",
         "subresource_uris": {
          "media": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Media.json"
         },
         "to": "+14155552345",
         "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
        }
       ],
       "next_page_uri": null,
       "num_pages": 119772,
       "page": 0,
       "page_size": 1,
       "previous_page_uri": null,
       "start": 0,
       "total": 119772,
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages.json?PageSize=1&Page=0"
      }
          >))
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').messages.list(:'DateSent' => Date.new(2008, 1, 1), :'From' => "+987654321", :'To' => "+123456789") }.not_to raise_error
    end
  end
end

describe Twilio::Resources::V2010::AccountInstance::MessageInstance do
  context "should delete messages" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, '{}'))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').messages.get('SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.delete }.not_to raise_error
    end
  
    it "and receive" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, '{}'))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').messages.get('SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.delete }.not_to raise_error
    end
  end

  context "should update messages" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      request = Hologram::Request.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          query_params: {},
          form_params: {:Body => "body"})
      holodeck.mock(request,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "api_version": "2010-04-01",
       "body": "O Slash: \u00d8, PoP: \ud83d\udca9",
       "date_created": "Thu, 30 Jul 2015 20:12:31 +0000",
       "date_sent": "Thu, 30 Jul 2015 20:12:33 +0000",
       "date_updated": "Thu, 30 Jul 2015 20:12:33 +0000",
       "direction": "outbound-api",
       "error_code": null,
       "error_message": null,
       "from": "+14155552345",
       "num_media": "0",
       "num_segments": "1",
       "price": "-0.00750",
       "price_unit": "USD",
       "sid": "SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "status": "sent",
       "subresource_uris": {
        "media": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Media.json"
       },
       "to": "+14155552345",
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
          >))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').messages.get('SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').update(:'Body' => "body")
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
       "api_version": "2010-04-01",
       "body": "O Slash: \u00d8, PoP: \ud83d\udca9",
       "date_created": "Thu, 30 Jul 2015 20:12:31 +0000",
       "date_sent": "Thu, 30 Jul 2015 20:12:33 +0000",
       "date_updated": "Thu, 30 Jul 2015 20:12:33 +0000",
       "direction": "outbound-api",
       "error_code": null,
       "error_message": null,
       "from": "+14155552345",
       "num_media": "0",
       "num_segments": "1",
       "price": "-0.00750",
       "price_unit": "USD",
       "sid": "SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "status": "sent",
       "subresource_uris": {
        "media": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Media.json"
       },
       "to": "+14155552345",
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
          >))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').messages.get('SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.update(:'Body' => "body") }.not_to raise_error
    end
  end
end