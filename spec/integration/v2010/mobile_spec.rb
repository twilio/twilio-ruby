require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::IncomingPhoneNumberList::MobileList do
  context "should read incoming_phone_numbers" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "end": 0,
       "first_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IncomingPhoneNumbers/Mobile.json?Page=0&PageSize=50",
       "incoming_phone_numbers": [
        {
         "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "address_requirements": "none",
         "api_version": "2010-04-01",
         "beta": null,
         "capabilities": {
          "mms": false,
          "sms": true,
          "voice": false
         },
         "date_created": "Tue, 08 Sep 2015 16:21:16 +0000",
         "date_updated": "Tue, 08 Sep 2015 16:21:16 +0000",
         "friendly_name": "61429099450",
         "phone_number": "+61429099450",
         "sid": "PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "sms_application_sid": "",
         "sms_fallback_method": "POST",
         "sms_fallback_url": "",
         "sms_method": "POST",
         "sms_url": "",
         "status_callback": "",
         "status_callback_method": "POST",
         "trunk_sid": null,
         "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IncomingPhoneNumbers/PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
         "voice_application_sid": "",
         "voice_caller_id_lookup": false,
         "voice_fallback_method": "POST",
         "voice_fallback_url": null,
         "voice_method": "POST",
         "voice_url": null
        }
       ],
       "last_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IncomingPhoneNumbers/Mobile.json?Page=0&PageSize=50",
       "next_page_uri": null,
       "num_pages": 1,
       "page": 0,
       "page_size": 50,
       "previous_page_uri": null,
       "start": 0,
       "total": 1,
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IncomingPhoneNumbers/Mobile.json"
      }
          >))
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').incoming_phone_numbers.mobile.list(:'Beta' => true, :'FriendlyName' => "friendly_name", :'PhoneNumber' => "+987654321") }.not_to raise_error
    end
  
    it "and receive" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "end": 0,
       "first_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IncomingPhoneNumbers/Mobile.json?Page=0&PageSize=50",
       "incoming_phone_numbers": [
        {
         "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "address_requirements": "none",
         "api_version": "2010-04-01",
         "beta": null,
         "capabilities": {
          "mms": false,
          "sms": true,
          "voice": false
         },
         "date_created": "Tue, 08 Sep 2015 16:21:16 +0000",
         "date_updated": "Tue, 08 Sep 2015 16:21:16 +0000",
         "friendly_name": "61429099450",
         "phone_number": "+61429099450",
         "sid": "PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "sms_application_sid": "",
         "sms_fallback_method": "POST",
         "sms_fallback_url": "",
         "sms_method": "POST",
         "sms_url": "",
         "status_callback": "",
         "status_callback_method": "POST",
         "trunk_sid": null,
         "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IncomingPhoneNumbers/PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
         "voice_application_sid": "",
         "voice_caller_id_lookup": false,
         "voice_fallback_method": "POST",
         "voice_fallback_url": null,
         "voice_method": "POST",
         "voice_url": null
        }
       ],
       "last_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IncomingPhoneNumbers/Mobile.json?Page=0&PageSize=50",
       "next_page_uri": null,
       "num_pages": 1,
       "page": 0,
       "page_size": 50,
       "previous_page_uri": null,
       "start": 0,
       "total": 1,
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IncomingPhoneNumbers/Mobile.json"
      }
          >))
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').incoming_phone_numbers.mobile.list(:'Beta' => true, :'FriendlyName' => "friendly_name", :'PhoneNumber' => "+987654321") }.not_to raise_error
    end
  end

  context "should create incoming_phone_numbers" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "address_requirements": "none",
       "api_version": "2010-04-01",
       "beta": false,
       "capabilities": {
        "mms": true,
        "sms": false,
        "voice": true
       },
       "date_created": "Thu, 30 Jul 2015 23:19:04 +0000",
       "date_updated": "Thu, 30 Jul 2015 23:19:04 +0000",
       "friendly_name": "(808) 925-5327",
       "phone_number": "+18089255327",
       "sid": "PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "sms_application_sid": "",
       "sms_fallback_method": "POST",
       "sms_fallback_url": "",
       "sms_method": "POST",
       "sms_url": "",
       "status_callback": "",
       "status_callback_method": "POST",
       "trunk_sid": null,
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IncomingPhoneNumbers/PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
       "voice_application_sid": "",
       "voice_caller_id_lookup": false,
       "voice_fallback_method": "POST",
       "voice_fallback_url": null,
       "voice_method": "POST",
       "voice_url": null
      }
          >))
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').incoming_phone_numbers.mobile.create(:'ApiVersion' => "api_version", :'AreaCode' => "area_code", :'FriendlyName' => "friendly_name", :'PhoneNumber' => "+987654321", :'SmsApplicationSid' => "APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", :'SmsFallbackMethod' => "GET", :'SmsFallbackUrl' => "https://example.com", :'SmsMethod' => "GET", :'SmsUrl' => "https://example.com", :'StatusCallback' => "https://example.com", :'StatusCallbackMethod' => "GET", :'VoiceApplicationSid' => "APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", :'VoiceCallerIdLookup' => true, :'VoiceFallbackMethod' => "GET", :'VoiceFallbackUrl' => "https://example.com", :'VoiceMethod' => "GET", :'VoiceUrl' => "https://example.com") }.not_to raise_error
    end
  
    it "and receive" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "address_requirements": "none",
       "api_version": "2010-04-01",
       "beta": false,
       "capabilities": {
        "mms": true,
        "sms": false,
        "voice": true
       },
       "date_created": "Thu, 30 Jul 2015 23:19:04 +0000",
       "date_updated": "Thu, 30 Jul 2015 23:19:04 +0000",
       "friendly_name": "(808) 925-5327",
       "phone_number": "+18089255327",
       "sid": "PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "sms_application_sid": "",
       "sms_fallback_method": "POST",
       "sms_fallback_url": "",
       "sms_method": "POST",
       "sms_url": "",
       "status_callback": "",
       "status_callback_method": "POST",
       "trunk_sid": null,
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IncomingPhoneNumbers/PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
       "voice_application_sid": "",
       "voice_caller_id_lookup": false,
       "voice_fallback_method": "POST",
       "voice_fallback_url": null,
       "voice_method": "POST",
       "voice_url": null
      }
          >))
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').incoming_phone_numbers.mobile.create(:'ApiVersion' => "api_version", :'AreaCode' => "area_code", :'FriendlyName' => "friendly_name", :'PhoneNumber' => "+987654321", :'SmsApplicationSid' => "APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", :'SmsFallbackMethod' => "GET", :'SmsFallbackUrl' => "https://example.com", :'SmsMethod' => "GET", :'SmsUrl' => "https://example.com", :'StatusCallback' => "https://example.com", :'StatusCallbackMethod' => "GET", :'VoiceApplicationSid' => "APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", :'VoiceCallerIdLookup' => true, :'VoiceFallbackMethod' => "GET", :'VoiceFallbackUrl' => "https://example.com", :'VoiceMethod' => "GET", :'VoiceUrl' => "https://example.com") }.not_to raise_error
    end
  end
end