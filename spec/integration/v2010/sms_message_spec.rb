require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::SmsList::SmsMessageList do
  context "should create sms_messages" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "api_version": "2008-08-01",
       "body": "n",
       "date_created": "Mon, 26 Jul 2010 21:46:42 +0000",
       "date_sent": "Mon, 26 Jul 2010 21:46:44 +0000",
       "date_updated": "Mon, 26 Jul 2010 21:46:44 +0000",
       "direction": "outbound-api",
       "from": "+141586753093",
       "price": "-0.03000",
       "sid": "SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "status": "sent",
       "to": "+141586753096",
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SMS/Messages/SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
          >))
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').sms.messages.create(:'ApplicationSid' => "APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", :'Body' => "body", :'From' => "+987654321", :'StatusCallback' => "https://example.com", :'To' => "+123456789") }.not_to raise_error
    end
  
    it "and receive" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "api_version": "2008-08-01",
       "body": "n",
       "date_created": "Mon, 26 Jul 2010 21:46:42 +0000",
       "date_sent": "Mon, 26 Jul 2010 21:46:44 +0000",
       "date_updated": "Mon, 26 Jul 2010 21:46:44 +0000",
       "direction": "outbound-api",
       "from": "+141586753093",
       "price": "-0.03000",
       "sid": "SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "status": "sent",
       "to": "+141586753096",
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SMS/Messages/SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
          >))
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').sms.messages.create(:'ApplicationSid' => "APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", :'Body' => "body", :'From' => "+987654321", :'StatusCallback' => "https://example.com", :'To' => "+123456789") }.not_to raise_error
    end
  end

  context "should fetch sms_messages" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "api_version": "2008-08-01",
       "body": "n",
       "date_created": "Mon, 26 Jul 2010 21:46:42 +0000",
       "date_sent": "Mon, 26 Jul 2010 21:46:44 +0000",
       "date_updated": "Mon, 26 Jul 2010 21:46:44 +0000",
       "direction": "outbound-api",
       "from": "+141586753093",
       "price": "-0.03000",
       "sid": "SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "status": "sent",
       "to": "+141586753096",
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SMS/Messages/SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
          >))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').sms.messages.get('SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
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
       "api_version": "2008-08-01",
       "body": "n",
       "date_created": "Mon, 26 Jul 2010 21:46:42 +0000",
       "date_sent": "Mon, 26 Jul 2010 21:46:44 +0000",
       "date_updated": "Mon, 26 Jul 2010 21:46:44 +0000",
       "direction": "outbound-api",
       "from": "+141586753093",
       "price": "-0.03000",
       "sid": "SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "status": "sent",
       "to": "+141586753096",
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SMS/Messages/SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
          >))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').sms.messages.get('SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.sid }.not_to raise_error
    end
  end

  context "should read sms_messages" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "end": 0,
       "first_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SMS/Messages.json?PageSize=1&Page=0",
       "last_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SMS/Messages.json?PageSize=1&Page=119771",
       "next_page_uri": null,
       "num_pages": 119772,
       "page": 0,
       "page_size": 1,
       "previous_page_uri": null,
       "sms_messages": [
        {
         "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "api_version": "2010-04-01",
         "body": "O Slash: \u00d8, PoP: \ud83d\udca9",
         "date_created": "Fri, 04 Sep 2015 22:54:39 +0000",
         "date_sent": "Fri, 04 Sep 2015 22:54:41 +0000",
         "date_updated": "Fri, 04 Sep 2015 22:54:41 +0000",
         "direction": "outbound-api",
         "from": "+14155552345",
         "num_segments": "1",
         "price": "-0.00750",
         "price_unit": "USD",
         "sid": "SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "status": "sent",
         "to": "+14155552345",
         "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SMS/Messages/SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
        }
       ],
       "start": 0,
       "total": 119772,
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SMS/Messages.json?PageSize=1&Page=0"
      }
          >))
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').sms.messages.list(:'DateSent' => Date.new(2008, 1, 1), :'From' => "+987654321", :'To' => "+123456789") }.not_to raise_error
    end
  
    it "and receive" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "end": 0,
       "first_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SMS/Messages.json?PageSize=1&Page=0",
       "last_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SMS/Messages.json?PageSize=1&Page=119771",
       "next_page_uri": null,
       "num_pages": 119772,
       "page": 0,
       "page_size": 1,
       "previous_page_uri": null,
       "sms_messages": [
        {
         "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "api_version": "2010-04-01",
         "body": "O Slash: \u00d8, PoP: \ud83d\udca9",
         "date_created": "Fri, 04 Sep 2015 22:54:39 +0000",
         "date_sent": "Fri, 04 Sep 2015 22:54:41 +0000",
         "date_updated": "Fri, 04 Sep 2015 22:54:41 +0000",
         "direction": "outbound-api",
         "from": "+14155552345",
         "num_segments": "1",
         "price": "-0.00750",
         "price_unit": "USD",
         "sid": "SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "status": "sent",
         "to": "+14155552345",
         "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SMS/Messages/SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
        }
       ],
       "start": 0,
       "total": 119772,
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SMS/Messages.json?PageSize=1&Page=0"
      }
          >))
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').sms.messages.list(:'DateSent' => Date.new(2008, 1, 1), :'From' => "+987654321", :'To' => "+123456789") }.not_to raise_error
    end
  end
end

describe Twilio::Resources::V2010::AccountInstance::SmsList::SmsMessageInstance do
  context "should delete sms_messages" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, '{}'))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').sms.messages.get('SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.delete }.not_to raise_error
    end
  
    it "and receive" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, '{}'))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').sms.messages.get('SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.delete }.not_to raise_error
    end
  end

  context "should update sms_messages" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      request = Hologram::Request.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SMS/Messages/SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          query_params: {},
          form_params: {:Body => "body"})
      holodeck.mock(request,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "api_version": "2008-08-01",
       "body": "n",
       "date_created": "Mon, 26 Jul 2010 21:46:42 +0000",
       "date_sent": "Mon, 26 Jul 2010 21:46:44 +0000",
       "date_updated": "Mon, 26 Jul 2010 21:46:44 +0000",
       "direction": "outbound-api",
       "from": "+141586753093",
       "price": "-0.03000",
       "sid": "SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "status": "sent",
       "to": "+141586753096",
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SMS/Messages/SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
          >))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').sms.messages.get('SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').update(:'Body' => "body")
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
       "api_version": "2008-08-01",
       "body": "n",
       "date_created": "Mon, 26 Jul 2010 21:46:42 +0000",
       "date_sent": "Mon, 26 Jul 2010 21:46:44 +0000",
       "date_updated": "Mon, 26 Jul 2010 21:46:44 +0000",
       "direction": "outbound-api",
       "from": "+141586753093",
       "price": "-0.03000",
       "sid": "SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "status": "sent",
       "to": "+141586753096",
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SMS/Messages/SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
          >))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').sms.messages.get('SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.update(:'Body' => "body") }.not_to raise_error
    end
  end
end