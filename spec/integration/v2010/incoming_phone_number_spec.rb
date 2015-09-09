require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::IncomingPhoneNumberList do
  context "should fetch incoming_phone_numbers" do
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
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').incoming_phone_numbers.get('PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
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
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').incoming_phone_numbers.get('PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.sid }.not_to raise_error
    end
  end

  context "should read incoming_phone_numbers" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "end": 0,
       "first_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IncomingPhoneNumbers.json?PageSize=1&Page=0",
       "incoming_phone_numbers": [
        {
         "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "address_requirements": "none",
         "api_version": "2010-04-01",
         "beta": null,
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
       ],
       "last_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IncomingPhoneNumbers.json?PageSize=1&Page=2",
       "next_page_uri": null,
       "num_pages": 3,
       "page": 0,
       "page_size": 1,
       "previous_page_uri": null,
       "start": 0,
       "total": 3,
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IncomingPhoneNumbers.json?PageSize=1"
      }
          >))
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').incoming_phone_numbers.list(:'Beta' => true, :'FriendlyName' => "friendly_name", :'PhoneNumber' => "+987654321") }.not_to raise_error
    end
  
    it "and receive" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "end": 0,
       "first_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IncomingPhoneNumbers.json?PageSize=1&Page=0",
       "incoming_phone_numbers": [
        {
         "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "address_requirements": "none",
         "api_version": "2010-04-01",
         "beta": null,
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
       ],
       "last_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IncomingPhoneNumbers.json?PageSize=1&Page=2",
       "next_page_uri": null,
       "num_pages": 3,
       "page": 0,
       "page_size": 1,
       "previous_page_uri": null,
       "start": 0,
       "total": 3,
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IncomingPhoneNumbers.json?PageSize=1"
      }
          >))
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').incoming_phone_numbers.list(:'Beta' => true, :'FriendlyName' => "friendly_name", :'PhoneNumber' => "+987654321") }.not_to raise_error
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
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').incoming_phone_numbers.create(:'ApiVersion' => "api_version", :'FriendlyName' => "friendly_name", :'PhoneNumber' => "+987654321", :'SmsApplicationSid' => "APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", :'SmsFallbackMethod' => "GET", :'SmsFallbackUrl' => "https://example.com", :'SmsMethod' => "GET", :'SmsUrl' => "https://example.com", :'StatusCallback' => "https://example.com", :'StatusCallbackMethod' => "GET", :'VoiceApplicationSid' => "APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", :'VoiceCallerIdLookup' => true, :'VoiceFallbackMethod' => "GET", :'VoiceFallbackUrl' => "https://example.com", :'VoiceMethod' => "GET", :'VoiceUrl' => "https://example.com") }.not_to raise_error
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
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').incoming_phone_numbers.create(:'ApiVersion' => "api_version", :'FriendlyName' => "friendly_name", :'PhoneNumber' => "+987654321", :'SmsApplicationSid' => "APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", :'SmsFallbackMethod' => "GET", :'SmsFallbackUrl' => "https://example.com", :'SmsMethod' => "GET", :'SmsUrl' => "https://example.com", :'StatusCallback' => "https://example.com", :'StatusCallbackMethod' => "GET", :'VoiceApplicationSid' => "APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", :'VoiceCallerIdLookup' => true, :'VoiceFallbackMethod' => "GET", :'VoiceFallbackUrl' => "https://example.com", :'VoiceMethod' => "GET", :'VoiceUrl' => "https://example.com") }.not_to raise_error
    end
  end
end

describe Twilio::Resources::V2010::AccountInstance::IncomingPhoneNumberInstance do
  context "should update incoming_phone_numbers" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      request = Hologram::Request.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IncomingPhoneNumbers/PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          query_params: {},
          form_params: {:AccountSid => "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", :ApiVersion => "api_version", :FriendlyName => "friendly_name", :SmsApplicationSid => "APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", :SmsFallbackMethod => "GET", :SmsFallbackUrl => "https://example.com", :SmsMethod => "GET", :SmsUrl => "https://example.com", :StatusCallback => "https://example.com", :StatusCallbackMethod => "GET", :VoiceApplicationSid => "APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", :VoiceCallerIdLookup => "true", :VoiceFallbackMethod => "GET", :VoiceFallbackUrl => "https://example.com", :VoiceMethod => "GET", :VoiceUrl => "https://example.com"})
      holodeck.mock(request,
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
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').incoming_phone_numbers.get('PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').update(:'AccountSid' => "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", :'ApiVersion' => "api_version", :'FriendlyName' => "friendly_name", :'SmsApplicationSid' => "APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", :'SmsFallbackMethod' => "GET", :'SmsFallbackUrl' => "https://example.com", :'SmsMethod' => "GET", :'SmsUrl' => "https://example.com", :'StatusCallback' => "https://example.com", :'StatusCallbackMethod' => "GET", :'VoiceApplicationSid' => "APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", :'VoiceCallerIdLookup' => true, :'VoiceFallbackMethod' => "GET", :'VoiceFallbackUrl' => "https://example.com", :'VoiceMethod' => "GET", :'VoiceUrl' => "https://example.com")
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
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').incoming_phone_numbers.get('PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.update(:'AccountSid' => "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", :'ApiVersion' => "api_version", :'FriendlyName' => "friendly_name", :'SmsApplicationSid' => "APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", :'SmsFallbackMethod' => "GET", :'SmsFallbackUrl' => "https://example.com", :'SmsMethod' => "GET", :'SmsUrl' => "https://example.com", :'StatusCallback' => "https://example.com", :'StatusCallbackMethod' => "GET", :'VoiceApplicationSid' => "APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", :'VoiceCallerIdLookup' => true, :'VoiceFallbackMethod' => "GET", :'VoiceFallbackUrl' => "https://example.com", :'VoiceMethod' => "GET", :'VoiceUrl' => "https://example.com") }.not_to raise_error
    end
  end

  context "should delete incoming_phone_numbers" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, '{}'))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').incoming_phone_numbers.get('PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.delete }.not_to raise_error
    end
  
    it "and receive" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, '{}'))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').incoming_phone_numbers.get('PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.delete }.not_to raise_error
    end
  end
end