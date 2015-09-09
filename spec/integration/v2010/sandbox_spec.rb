require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::SandboxList do
  context "should fetch None" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "api_version": "2008-08-01",
       "date_created": "Sun, 15 Mar 2009 02:08:47 +0000",
       "date_updated": "Fri, 18 Feb 2011 17:37:18 +0000",
       "phone_number": "4155992671",
       "pin": "66528411",
       "sms_method": "POST",
       "sms_url": "http://demo.twilio.com/welcome/sms",
       "status_callback": null,
       "status_callback_method": null,
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Sandbox.json",
       "voice_method": "POST",
       "voice_url": "http://www.digg.com"
      }
          >))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').sandbox.get('')
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
       "date_created": "Sun, 15 Mar 2009 02:08:47 +0000",
       "date_updated": "Fri, 18 Feb 2011 17:37:18 +0000",
       "phone_number": "4155992671",
       "pin": "66528411",
       "sms_method": "POST",
       "sms_url": "http://demo.twilio.com/welcome/sms",
       "status_callback": null,
       "status_callback_method": null,
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Sandbox.json",
       "voice_method": "POST",
       "voice_url": "http://www.digg.com"
      }
          >))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').sandbox.get('')
      expect { resource.sid }.not_to raise_error
    end
  end
end

describe Twilio::Resources::V2010::AccountInstance::SandboxInstance do
  context "should update None" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      request = Hologram::Request.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Sandbox.json",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          query_params: {},
          form_params: {:SmsMethod => "GET", :SmsUrl => "https://example.com", :StatusCallback => "https://example.com", :StatusCallbackMethod => "GET", :VoiceMethod => "GET", :VoiceUrl => "https://example.com"})
      holodeck.mock(request,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "api_version": "2008-08-01",
       "date_created": "Sun, 15 Mar 2009 02:08:47 +0000",
       "date_updated": "Fri, 18 Feb 2011 17:37:18 +0000",
       "phone_number": "4155992671",
       "pin": "66528411",
       "sms_method": "POST",
       "sms_url": "http://demo.twilio.com/welcome/sms",
       "status_callback": null,
       "status_callback_method": null,
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Sandbox.json",
       "voice_method": "POST",
       "voice_url": "http://www.digg.com"
      }
          >))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').sandbox.get('').update(:'SmsMethod' => "GET", :'SmsUrl' => "https://example.com", :'StatusCallback' => "https://example.com", :'StatusCallbackMethod' => "GET", :'VoiceMethod' => "GET", :'VoiceUrl' => "https://example.com")
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
       "date_created": "Sun, 15 Mar 2009 02:08:47 +0000",
       "date_updated": "Fri, 18 Feb 2011 17:37:18 +0000",
       "phone_number": "4155992671",
       "pin": "66528411",
       "sms_method": "POST",
       "sms_url": "http://demo.twilio.com/welcome/sms",
       "status_callback": null,
       "status_callback_method": null,
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Sandbox.json",
       "voice_method": "POST",
       "voice_url": "http://www.digg.com"
      }
          >))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').sandbox.get('')
      expect { resource.update(:'SmsMethod' => "GET", :'SmsUrl' => "https://example.com", :'StatusCallback' => "https://example.com", :'StatusCallbackMethod' => "GET", :'VoiceMethod' => "GET", :'VoiceUrl' => "https://example.com") }.not_to raise_error
    end
  end
end