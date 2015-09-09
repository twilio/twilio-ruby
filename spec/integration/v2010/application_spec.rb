require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::ApplicationList do
  context "should create applications" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "api_version": "2010-04-01",
       "date_created": "Mon, 22 Aug 2011 20:59:45 +0000",
       "date_updated": "Tue, 18 Aug 2015 16:48:57 +0000",
       "friendly_name": "Application Friendly Name",
       "message_status_callback": "http://www.example.com/sms-status-callback",
       "sid": "APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "sms_fallback_method": "GET",
       "sms_fallback_url": "http://www.example.com/sms-fallback",
       "sms_method": "GET",
       "sms_status_callback": "http://www.example.com/sms-status-callback",
       "sms_url": "http://example.com",
       "status_callback": "http://example.com",
       "status_callback_method": "GET",
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Applications/APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
       "voice_caller_id_lookup": false,
       "voice_fallback_method": "GET",
       "voice_fallback_url": "http://www.example.com/voice-callback",
       "voice_method": "GET",
       "voice_url": "http://example.com"
      }
          >))
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').applications.create(:'ApiVersion' => "api_version", :'FriendlyName' => "friendly_name", :'MessageStatusCallback' => "https://example.com", :'SmsFallbackMethod' => "GET", :'SmsFallbackUrl' => "https://example.com", :'SmsMethod' => "GET", :'SmsStatusCallback' => "https://example.com", :'SmsUrl' => "https://example.com", :'StatusCallback' => "https://example.com", :'StatusCallbackMethod' => "GET", :'VoiceCallerIdLookup' => true, :'VoiceFallbackMethod' => "GET", :'VoiceFallbackUrl' => "https://example.com", :'VoiceMethod' => "GET", :'VoiceUrl' => "https://example.com") }.not_to raise_error
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
       "date_created": "Mon, 22 Aug 2011 20:59:45 +0000",
       "date_updated": "Tue, 18 Aug 2015 16:48:57 +0000",
       "friendly_name": "Application Friendly Name",
       "message_status_callback": "http://www.example.com/sms-status-callback",
       "sid": "APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "sms_fallback_method": "GET",
       "sms_fallback_url": "http://www.example.com/sms-fallback",
       "sms_method": "GET",
       "sms_status_callback": "http://www.example.com/sms-status-callback",
       "sms_url": "http://example.com",
       "status_callback": "http://example.com",
       "status_callback_method": "GET",
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Applications/APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
       "voice_caller_id_lookup": false,
       "voice_fallback_method": "GET",
       "voice_fallback_url": "http://www.example.com/voice-callback",
       "voice_method": "GET",
       "voice_url": "http://example.com"
      }
          >))
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').applications.create(:'ApiVersion' => "api_version", :'FriendlyName' => "friendly_name", :'MessageStatusCallback' => "https://example.com", :'SmsFallbackMethod' => "GET", :'SmsFallbackUrl' => "https://example.com", :'SmsMethod' => "GET", :'SmsStatusCallback' => "https://example.com", :'SmsUrl' => "https://example.com", :'StatusCallback' => "https://example.com", :'StatusCallbackMethod' => "GET", :'VoiceCallerIdLookup' => true, :'VoiceFallbackMethod' => "GET", :'VoiceFallbackUrl' => "https://example.com", :'VoiceMethod' => "GET", :'VoiceUrl' => "https://example.com") }.not_to raise_error
    end
  end

  context "should fetch applications" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "api_version": "2010-04-01",
       "date_created": "Mon, 22 Aug 2011 20:59:45 +0000",
       "date_updated": "Tue, 18 Aug 2015 16:48:57 +0000",
       "friendly_name": "Application Friendly Name",
       "message_status_callback": "http://www.example.com/sms-status-callback",
       "sid": "APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "sms_fallback_method": "GET",
       "sms_fallback_url": "http://www.example.com/sms-fallback",
       "sms_method": "GET",
       "sms_status_callback": "http://www.example.com/sms-status-callback",
       "sms_url": "http://example.com",
       "status_callback": "http://example.com",
       "status_callback_method": "GET",
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Applications/APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
       "voice_caller_id_lookup": false,
       "voice_fallback_method": "GET",
       "voice_fallback_url": "http://www.example.com/voice-callback",
       "voice_method": "GET",
       "voice_url": "http://example.com"
      }
          >))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').applications.get('APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
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
       "date_created": "Mon, 22 Aug 2011 20:59:45 +0000",
       "date_updated": "Tue, 18 Aug 2015 16:48:57 +0000",
       "friendly_name": "Application Friendly Name",
       "message_status_callback": "http://www.example.com/sms-status-callback",
       "sid": "APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "sms_fallback_method": "GET",
       "sms_fallback_url": "http://www.example.com/sms-fallback",
       "sms_method": "GET",
       "sms_status_callback": "http://www.example.com/sms-status-callback",
       "sms_url": "http://example.com",
       "status_callback": "http://example.com",
       "status_callback_method": "GET",
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Applications/APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
       "voice_caller_id_lookup": false,
       "voice_fallback_method": "GET",
       "voice_fallback_url": "http://www.example.com/voice-callback",
       "voice_method": "GET",
       "voice_url": "http://example.com"
      }
          >))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').applications.get('APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.sid }.not_to raise_error
    end
  end

  context "should read applications" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "applications": [
        {
         "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "api_version": "2010-04-01",
         "date_created": "Fri, 21 Aug 2015 00:07:25 +0000",
         "date_updated": "Fri, 21 Aug 2015 00:07:25 +0000",
         "friendly_name": "d8821fb7-4d01-48b2-bdc5-34e46252b90b",
         "message_status_callback": null,
         "sid": "APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "sms_fallback_method": "POST",
         "sms_fallback_url": null,
         "sms_method": "POST",
         "sms_status_callback": null,
         "sms_url": null,
         "status_callback": null,
         "status_callback_method": "POST",
         "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Applications/APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
         "voice_caller_id_lookup": false,
         "voice_fallback_method": "POST",
         "voice_fallback_url": null,
         "voice_method": "POST",
         "voice_url": null
        }
       ],
       "end": 0,
       "first_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Applications.json?PageSize=1&Page=0",
       "last_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Applications.json?PageSize=1&Page=35",
       "next_page_uri": null,
       "num_pages": 36,
       "page": 0,
       "page_size": 1,
       "previous_page_uri": null,
       "start": 0,
       "total": 36,
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Applications.json?PageSize=1&Page=0"
      }
          >))
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').applications.list(:'FriendlyName' => "friendly_name") }.not_to raise_error
    end
  
    it "and receive" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "applications": [
        {
         "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "api_version": "2010-04-01",
         "date_created": "Fri, 21 Aug 2015 00:07:25 +0000",
         "date_updated": "Fri, 21 Aug 2015 00:07:25 +0000",
         "friendly_name": "d8821fb7-4d01-48b2-bdc5-34e46252b90b",
         "message_status_callback": null,
         "sid": "APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "sms_fallback_method": "POST",
         "sms_fallback_url": null,
         "sms_method": "POST",
         "sms_status_callback": null,
         "sms_url": null,
         "status_callback": null,
         "status_callback_method": "POST",
         "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Applications/APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
         "voice_caller_id_lookup": false,
         "voice_fallback_method": "POST",
         "voice_fallback_url": null,
         "voice_method": "POST",
         "voice_url": null
        }
       ],
       "end": 0,
       "first_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Applications.json?PageSize=1&Page=0",
       "last_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Applications.json?PageSize=1&Page=35",
       "next_page_uri": null,
       "num_pages": 36,
       "page": 0,
       "page_size": 1,
       "previous_page_uri": null,
       "start": 0,
       "total": 36,
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Applications.json?PageSize=1&Page=0"
      }
          >))
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').applications.list(:'FriendlyName' => "friendly_name") }.not_to raise_error
    end
  end
end

describe Twilio::Resources::V2010::AccountInstance::ApplicationInstance do
  context "should delete applications" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, '{}'))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').applications.get('APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.delete }.not_to raise_error
    end
  
    it "and receive" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, '{}'))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').applications.get('APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.delete }.not_to raise_error
    end
  end

  context "should update applications" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      request = Hologram::Request.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Applications/APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          query_params: {},
          form_params: {:ApiVersion => "api_version", :FriendlyName => "friendly_name", :MessageStatusCallback => "https://example.com", :SmsFallbackMethod => "GET", :SmsFallbackUrl => "https://example.com", :SmsMethod => "GET", :SmsStatusCallback => "https://example.com", :SmsUrl => "https://example.com", :StatusCallback => "https://example.com", :StatusCallbackMethod => "GET", :VoiceCallerIdLookup => "true", :VoiceFallbackMethod => "GET", :VoiceFallbackUrl => "https://example.com", :VoiceMethod => "GET", :VoiceUrl => "https://example.com"})
      holodeck.mock(request,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "api_version": "2010-04-01",
       "date_created": "Mon, 22 Aug 2011 20:59:45 +0000",
       "date_updated": "Tue, 18 Aug 2015 16:48:57 +0000",
       "friendly_name": "Application Friendly Name",
       "message_status_callback": "http://www.example.com/sms-status-callback",
       "sid": "APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "sms_fallback_method": "GET",
       "sms_fallback_url": "http://www.example.com/sms-fallback",
       "sms_method": "GET",
       "sms_status_callback": "http://www.example.com/sms-status-callback",
       "sms_url": "http://example.com",
       "status_callback": "http://example.com",
       "status_callback_method": "GET",
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Applications/APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
       "voice_caller_id_lookup": false,
       "voice_fallback_method": "GET",
       "voice_fallback_url": "http://www.example.com/voice-callback",
       "voice_method": "GET",
       "voice_url": "http://example.com"
      }
          >))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').applications.get('APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').update(:'ApiVersion' => "api_version", :'FriendlyName' => "friendly_name", :'MessageStatusCallback' => "https://example.com", :'SmsFallbackMethod' => "GET", :'SmsFallbackUrl' => "https://example.com", :'SmsMethod' => "GET", :'SmsStatusCallback' => "https://example.com", :'SmsUrl' => "https://example.com", :'StatusCallback' => "https://example.com", :'StatusCallbackMethod' => "GET", :'VoiceCallerIdLookup' => true, :'VoiceFallbackMethod' => "GET", :'VoiceFallbackUrl' => "https://example.com", :'VoiceMethod' => "GET", :'VoiceUrl' => "https://example.com")
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
       "date_created": "Mon, 22 Aug 2011 20:59:45 +0000",
       "date_updated": "Tue, 18 Aug 2015 16:48:57 +0000",
       "friendly_name": "Application Friendly Name",
       "message_status_callback": "http://www.example.com/sms-status-callback",
       "sid": "APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "sms_fallback_method": "GET",
       "sms_fallback_url": "http://www.example.com/sms-fallback",
       "sms_method": "GET",
       "sms_status_callback": "http://www.example.com/sms-status-callback",
       "sms_url": "http://example.com",
       "status_callback": "http://example.com",
       "status_callback_method": "GET",
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Applications/APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
       "voice_caller_id_lookup": false,
       "voice_fallback_method": "GET",
       "voice_fallback_url": "http://www.example.com/voice-callback",
       "voice_method": "GET",
       "voice_url": "http://example.com"
      }
          >))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').applications.get('APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.update(:'ApiVersion' => "api_version", :'FriendlyName' => "friendly_name", :'MessageStatusCallback' => "https://example.com", :'SmsFallbackMethod' => "GET", :'SmsFallbackUrl' => "https://example.com", :'SmsMethod' => "GET", :'SmsStatusCallback' => "https://example.com", :'SmsUrl' => "https://example.com", :'StatusCallback' => "https://example.com", :'StatusCallbackMethod' => "GET", :'VoiceCallerIdLookup' => true, :'VoiceFallbackMethod' => "GET", :'VoiceFallbackUrl' => "https://example.com", :'VoiceMethod' => "GET", :'VoiceUrl' => "https://example.com") }.not_to raise_error
    end
  end
end