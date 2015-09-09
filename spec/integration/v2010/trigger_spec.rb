require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::UsageList::TriggerList do
  context "should fetch usage_triggers" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "api_version": "2010-04-01",
       "callback_method": "GET",
       "callback_url": "http://cap.com/streetfight",
       "current_value": "0",
       "date_created": "Sun, 06 Sep 2015 12:58:45 +0000",
       "date_fired": null,
       "date_updated": "Sun, 06 Sep 2015 12:58:45 +0000",
       "friendly_name": "raphael-cluster-1441544325.86",
       "recurring": "yearly",
       "sid": "UTaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "trigger_by": "price",
       "trigger_value": "50",
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Usage/Triggers/UTaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "usage_category": "totalprice",
       "usage_record_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Usage/Records?Category=totalprice"
      }
          >))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').usage.triggers.get('UTaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
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
       "callback_method": "GET",
       "callback_url": "http://cap.com/streetfight",
       "current_value": "0",
       "date_created": "Sun, 06 Sep 2015 12:58:45 +0000",
       "date_fired": null,
       "date_updated": "Sun, 06 Sep 2015 12:58:45 +0000",
       "friendly_name": "raphael-cluster-1441544325.86",
       "recurring": "yearly",
       "sid": "UTaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "trigger_by": "price",
       "trigger_value": "50",
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Usage/Triggers/UTaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "usage_category": "totalprice",
       "usage_record_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Usage/Records?Category=totalprice"
      }
          >))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').usage.triggers.get('UTaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.sid }.not_to raise_error
    end
  end

  context "should create usage_triggers" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "api_version": "2010-04-01",
       "callback_method": "GET",
       "callback_url": "http://cap.com/streetfight",
       "current_value": "0",
       "date_created": "Sun, 06 Sep 2015 12:58:45 +0000",
       "date_fired": null,
       "date_updated": "Sun, 06 Sep 2015 12:58:45 +0000",
       "friendly_name": "raphael-cluster-1441544325.86",
       "recurring": "yearly",
       "sid": "UTaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "trigger_by": "price",
       "trigger_value": "50",
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Usage/Triggers/UTaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "usage_category": "totalprice",
       "usage_record_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Usage/Records?Category=totalprice"
      }
          >))
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').usage.triggers.create(:'CallbackMethod' => "GET", :'CallbackUrl' => "https://example.com", :'FriendlyName' => "friendly_name", :'Recurring' => "daily", :'TriggerBy' => "count", :'TriggerValue' => "trigger_value", :'UsageCategory' => "calleridlookups") }.not_to raise_error
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
       "callback_method": "GET",
       "callback_url": "http://cap.com/streetfight",
       "current_value": "0",
       "date_created": "Sun, 06 Sep 2015 12:58:45 +0000",
       "date_fired": null,
       "date_updated": "Sun, 06 Sep 2015 12:58:45 +0000",
       "friendly_name": "raphael-cluster-1441544325.86",
       "recurring": "yearly",
       "sid": "UTaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "trigger_by": "price",
       "trigger_value": "50",
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Usage/Triggers/UTaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "usage_category": "totalprice",
       "usage_record_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Usage/Records?Category=totalprice"
      }
          >))
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').usage.triggers.create(:'CallbackMethod' => "GET", :'CallbackUrl' => "https://example.com", :'FriendlyName' => "friendly_name", :'Recurring' => "daily", :'TriggerBy' => "count", :'TriggerValue' => "trigger_value", :'UsageCategory' => "calleridlookups") }.not_to raise_error
    end
  end

  context "should read usage_triggers" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "end": 0,
       "first_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Usage/Triggers?PageSize=1&Page=0",
       "last_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Usage/Triggers?PageSize=1&Page=626",
       "next_page_uri": null,
       "num_pages": 627,
       "page": 0,
       "page_size": 1,
       "previous_page_uri": null,
       "start": 0,
       "total": 627,
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Usage/Triggers",
       "usage_triggers": [
        {
         "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "api_version": "2010-04-01",
         "callback_method": "GET",
         "callback_url": "http://cap.com/streetfight",
         "current_value": "0",
         "date_created": "Sun, 06 Sep 2015 12:58:45 +0000",
         "date_fired": null,
         "date_updated": "Sun, 06 Sep 2015 12:58:45 +0000",
         "friendly_name": "raphael-cluster-1441544325.86",
         "recurring": "yearly",
         "sid": "UTaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "trigger_by": "price",
         "trigger_value": "50",
         "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Usage/Triggers/UTaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "usage_category": "totalprice",
         "usage_record_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Usage/Records?Category=totalprice"
        }
       ]
      }
          >))
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').usage.triggers.list(:'Recurring' => "daily", :'TriggerBy' => "count", :'UsageCategory' => "calleridlookups") }.not_to raise_error
    end
  
    it "and receive" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "end": 0,
       "first_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Usage/Triggers?PageSize=1&Page=0",
       "last_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Usage/Triggers?PageSize=1&Page=626",
       "next_page_uri": null,
       "num_pages": 627,
       "page": 0,
       "page_size": 1,
       "previous_page_uri": null,
       "start": 0,
       "total": 627,
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Usage/Triggers",
       "usage_triggers": [
        {
         "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "api_version": "2010-04-01",
         "callback_method": "GET",
         "callback_url": "http://cap.com/streetfight",
         "current_value": "0",
         "date_created": "Sun, 06 Sep 2015 12:58:45 +0000",
         "date_fired": null,
         "date_updated": "Sun, 06 Sep 2015 12:58:45 +0000",
         "friendly_name": "raphael-cluster-1441544325.86",
         "recurring": "yearly",
         "sid": "UTaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "trigger_by": "price",
         "trigger_value": "50",
         "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Usage/Triggers/UTaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "usage_category": "totalprice",
         "usage_record_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Usage/Records?Category=totalprice"
        }
       ]
      }
          >))
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').usage.triggers.list(:'Recurring' => "daily", :'TriggerBy' => "count", :'UsageCategory' => "calleridlookups") }.not_to raise_error
    end
  end
end

describe Twilio::Resources::V2010::AccountInstance::UsageList::TriggerInstance do
  context "should update usage_triggers" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      request = Hologram::Request.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Usage/Triggers/UTaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          query_params: {},
          form_params: {:CallbackMethod => "GET", :CallbackUrl => "https://example.com", :FriendlyName => "friendly_name"})
      holodeck.mock(request,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "api_version": "2010-04-01",
       "callback_method": "GET",
       "callback_url": "http://cap.com/streetfight",
       "current_value": "0",
       "date_created": "Sun, 06 Sep 2015 12:58:45 +0000",
       "date_fired": null,
       "date_updated": "Sun, 06 Sep 2015 12:58:45 +0000",
       "friendly_name": "raphael-cluster-1441544325.86",
       "recurring": "yearly",
       "sid": "UTaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "trigger_by": "price",
       "trigger_value": "50",
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Usage/Triggers/UTaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "usage_category": "totalprice",
       "usage_record_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Usage/Records?Category=totalprice"
      }
          >))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').usage.triggers.get('UTaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').update(:'CallbackMethod' => "GET", :'CallbackUrl' => "https://example.com", :'FriendlyName' => "friendly_name")
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
       "callback_method": "GET",
       "callback_url": "http://cap.com/streetfight",
       "current_value": "0",
       "date_created": "Sun, 06 Sep 2015 12:58:45 +0000",
       "date_fired": null,
       "date_updated": "Sun, 06 Sep 2015 12:58:45 +0000",
       "friendly_name": "raphael-cluster-1441544325.86",
       "recurring": "yearly",
       "sid": "UTaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "trigger_by": "price",
       "trigger_value": "50",
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Usage/Triggers/UTaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "usage_category": "totalprice",
       "usage_record_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Usage/Records?Category=totalprice"
      }
          >))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').usage.triggers.get('UTaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.update(:'CallbackMethod' => "GET", :'CallbackUrl' => "https://example.com", :'FriendlyName' => "friendly_name") }.not_to raise_error
    end
  end

  context "should delete usage_triggers" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, '{}'))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').usage.triggers.get('UTaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.delete }.not_to raise_error
    end
  
    it "and receive" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, '{}'))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').usage.triggers.get('UTaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.delete }.not_to raise_error
    end
  end
end