require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::SmsList::ShortCodeList do
  context "should fetch short_codes" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "api_version": "2010-04-01",
       "date_created": null,
       "date_updated": null,
       "friendly_name": "API_CLUSTER_TEST_SHORT_CODE",
       "short_code": "99990",
       "sid": "SCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "sms_fallback_method": "POST",
       "sms_fallback_url": null,
       "sms_method": "POST",
       "sms_url": null,
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SMS/ShortCodes/SCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
          >))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').sms.short_codes.get('SCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
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
       "date_created": null,
       "date_updated": null,
       "friendly_name": "API_CLUSTER_TEST_SHORT_CODE",
       "short_code": "99990",
       "sid": "SCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "sms_fallback_method": "POST",
       "sms_fallback_url": null,
       "sms_method": "POST",
       "sms_url": null,
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SMS/ShortCodes/SCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
          >))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').sms.short_codes.get('SCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.sid }.not_to raise_error
    end
  end

  context "should read short_codes" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "end": 0,
       "first_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SMS/ShortCodes.json?Page=0&PageSize=50",
       "last_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SMS/ShortCodes.json?Page=0&PageSize=50",
       "next_page_uri": null,
       "num_pages": 1,
       "page": 0,
       "page_size": 50,
       "previous_page_uri": null,
       "short_codes": [
        {
         "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "api_version": "2010-04-01",
         "date_created": null,
         "date_updated": null,
         "friendly_name": "API_CLUSTER_TEST_SHORT_CODE",
         "short_code": "99990",
         "sid": "SCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "sms_fallback_method": "POST",
         "sms_fallback_url": null,
         "sms_method": "POST",
         "sms_url": null,
         "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SMS/ShortCodes/SCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
        }
       ],
       "start": 0,
       "total": 1,
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SMS/ShortCodes.json"
      }
          >))
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').sms.short_codes.list(:'FriendlyName' => "friendly_name", :'ShortCode' => "short_code") }.not_to raise_error
    end
  
    it "and receive" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "end": 0,
       "first_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SMS/ShortCodes.json?Page=0&PageSize=50",
       "last_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SMS/ShortCodes.json?Page=0&PageSize=50",
       "next_page_uri": null,
       "num_pages": 1,
       "page": 0,
       "page_size": 50,
       "previous_page_uri": null,
       "short_codes": [
        {
         "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "api_version": "2010-04-01",
         "date_created": null,
         "date_updated": null,
         "friendly_name": "API_CLUSTER_TEST_SHORT_CODE",
         "short_code": "99990",
         "sid": "SCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "sms_fallback_method": "POST",
         "sms_fallback_url": null,
         "sms_method": "POST",
         "sms_url": null,
         "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SMS/ShortCodes/SCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
        }
       ],
       "start": 0,
       "total": 1,
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SMS/ShortCodes.json"
      }
          >))
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').sms.short_codes.list(:'FriendlyName' => "friendly_name", :'ShortCode' => "short_code") }.not_to raise_error
    end
  end
end

describe Twilio::Resources::V2010::AccountInstance::SmsList::ShortCodeInstance do
  context "should update short_codes" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      request = Hologram::Request.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SMS/ShortCodes/SCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          query_params: {},
          form_params: {:ApiVersion => "api_version", :FriendlyName => "friendly_name", :SmsFallbackMethod => "GET", :SmsFallbackUrl => "https://example.com", :SmsMethod => "GET", :SmsUrl => "https://example.com"})
      holodeck.mock(request,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "api_version": "2010-04-01",
       "date_created": null,
       "date_updated": null,
       "friendly_name": "API_CLUSTER_TEST_SHORT_CODE",
       "short_code": "99990",
       "sid": "SCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "sms_fallback_method": "POST",
       "sms_fallback_url": null,
       "sms_method": "POST",
       "sms_url": null,
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SMS/ShortCodes/SCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
          >))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').sms.short_codes.get('SCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').update(:'ApiVersion' => "api_version", :'FriendlyName' => "friendly_name", :'SmsFallbackMethod' => "GET", :'SmsFallbackUrl' => "https://example.com", :'SmsMethod' => "GET", :'SmsUrl' => "https://example.com")
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
       "date_created": null,
       "date_updated": null,
       "friendly_name": "API_CLUSTER_TEST_SHORT_CODE",
       "short_code": "99990",
       "sid": "SCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "sms_fallback_method": "POST",
       "sms_fallback_url": null,
       "sms_method": "POST",
       "sms_url": null,
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SMS/ShortCodes/SCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
          >))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').sms.short_codes.get('SCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.update(:'ApiVersion' => "api_version", :'FriendlyName' => "friendly_name", :'SmsFallbackMethod' => "GET", :'SmsFallbackUrl' => "https://example.com", :'SmsMethod' => "GET", :'SmsUrl' => "https://example.com") }.not_to raise_error
    end
  end
end