require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::SipList::DomainList do
  context "should read domains" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "domains": [
        {
         "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "api_version": "2010-04-01",
         "auth_type": "",
         "date_created": "Fri, 06 Sep 2013 18:48:50 -0000",
         "date_updated": "Fri, 06 Sep 2013 18:48:50 -0000",
         "domain_name": "dunder-mifflin-scranton.api.twilio.com",
         "friendly_name": "Scranton Office",
         "sid": "SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "subresource_uris": {
          "credential_list_mappings": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/Domains/SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/CredentialListMappings.json",
          "ip_access_control_list_mappings": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/Domains/SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IpAccessControlListMappings.json"
         },
         "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/Domains/SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
         "voice_fallback_method": "POST",
         "voice_fallback_url": null,
         "voice_method": "POST",
         "voice_status_callback_method": "POST",
         "voice_status_callback_url": null,
         "voice_url": "https://dundermifflin.example.com/twilio/app.php"
        }
       ],
       "first_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/Domains.json?PageSize=50&Page=0",
       "next_page_uri": null,
       "page": 0,
       "page_size": 50,
       "previous_page_uri": null,
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/Domains.json?PageSize=50&Page=0"
      }
          >))
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').sip.domains.list() }.not_to raise_error
    end
  
    it "and receive" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "domains": [
        {
         "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "api_version": "2010-04-01",
         "auth_type": "",
         "date_created": "Fri, 06 Sep 2013 18:48:50 -0000",
         "date_updated": "Fri, 06 Sep 2013 18:48:50 -0000",
         "domain_name": "dunder-mifflin-scranton.api.twilio.com",
         "friendly_name": "Scranton Office",
         "sid": "SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "subresource_uris": {
          "credential_list_mappings": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/Domains/SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/CredentialListMappings.json",
          "ip_access_control_list_mappings": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/Domains/SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IpAccessControlListMappings.json"
         },
         "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/Domains/SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
         "voice_fallback_method": "POST",
         "voice_fallback_url": null,
         "voice_method": "POST",
         "voice_status_callback_method": "POST",
         "voice_status_callback_url": null,
         "voice_url": "https://dundermifflin.example.com/twilio/app.php"
        }
       ],
       "first_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/Domains.json?PageSize=50&Page=0",
       "next_page_uri": null,
       "page": 0,
       "page_size": 50,
       "previous_page_uri": null,
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/Domains.json?PageSize=50&Page=0"
      }
          >))
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').sip.domains.list() }.not_to raise_error
    end
  end

  context "should create domains" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "api_version": "2010-04-01",
       "auth_type": "IP_ACL",
       "date_created": "Fri, 06 Sep 2013 19:18:30 -0000",
       "date_updated": "Fri, 06 Sep 2013 19:18:30 -0000",
       "domain_name": "dunder-mifflin-scranton.sip.twilio.com",
       "friendly_name": "Scranton Office",
       "sid": "SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "subresource_uris": {
        "credential_list_mappings": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/Domains/SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/CredentialListMappings.json",
        "ip_access_control_list_mappings": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/Domains/SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IpAccessControlListMappings.json"
       },
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/Domains/SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
       "voice_fallback_method": "POST",
       "voice_fallback_url": null,
       "voice_method": "POST",
       "voice_status_callback_method": "POST",
       "voice_status_callback_url": null,
       "voice_url": "https://dundermifflin.example.com/twilio/app.php"
      }
          >))
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').sip.domains.create(:'DomainName' => "domain_name", :'FriendlyName' => "friendly_name", :'VoiceFallbackMethod' => "GET", :'VoiceFallbackUrl' => "https://example.com", :'VoiceMethod' => "GET", :'VoiceStatusCallbackMethod' => "GET", :'VoiceStatusCallbackUrl' => "https://example.com", :'VoiceUrl' => "https://example.com") }.not_to raise_error
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
       "auth_type": "IP_ACL",
       "date_created": "Fri, 06 Sep 2013 19:18:30 -0000",
       "date_updated": "Fri, 06 Sep 2013 19:18:30 -0000",
       "domain_name": "dunder-mifflin-scranton.sip.twilio.com",
       "friendly_name": "Scranton Office",
       "sid": "SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "subresource_uris": {
        "credential_list_mappings": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/Domains/SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/CredentialListMappings.json",
        "ip_access_control_list_mappings": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/Domains/SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IpAccessControlListMappings.json"
       },
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/Domains/SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
       "voice_fallback_method": "POST",
       "voice_fallback_url": null,
       "voice_method": "POST",
       "voice_status_callback_method": "POST",
       "voice_status_callback_url": null,
       "voice_url": "https://dundermifflin.example.com/twilio/app.php"
      }
          >))
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').sip.domains.create(:'DomainName' => "domain_name", :'FriendlyName' => "friendly_name", :'VoiceFallbackMethod' => "GET", :'VoiceFallbackUrl' => "https://example.com", :'VoiceMethod' => "GET", :'VoiceStatusCallbackMethod' => "GET", :'VoiceStatusCallbackUrl' => "https://example.com", :'VoiceUrl' => "https://example.com") }.not_to raise_error
    end
  end

  context "should fetch domains" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "api_version": "2010-04-01",
       "auth_type": "IP_ACL",
       "date_created": "Fri, 06 Sep 2013 19:18:30 -0000",
       "date_updated": "Fri, 06 Sep 2013 19:18:30 -0000",
       "domain_name": "dunder-mifflin-scranton.sip.twilio.com",
       "friendly_name": "Scranton Office",
       "sid": "SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "subresource_uris": {
        "credential_list_mappings": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/Domains/SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/CredentialListMappings.json",
        "ip_access_control_list_mappings": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/Domains/SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IpAccessControlListMappings.json"
       },
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/Domains/SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
       "voice_fallback_method": "POST",
       "voice_fallback_url": null,
       "voice_method": "POST",
       "voice_status_callback_method": "POST",
       "voice_status_callback_url": null,
       "voice_url": "https://dundermifflin.example.com/twilio/app.php"
      }
          >))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').sip.domains.get('SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
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
       "auth_type": "IP_ACL",
       "date_created": "Fri, 06 Sep 2013 19:18:30 -0000",
       "date_updated": "Fri, 06 Sep 2013 19:18:30 -0000",
       "domain_name": "dunder-mifflin-scranton.sip.twilio.com",
       "friendly_name": "Scranton Office",
       "sid": "SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "subresource_uris": {
        "credential_list_mappings": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/Domains/SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/CredentialListMappings.json",
        "ip_access_control_list_mappings": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/Domains/SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IpAccessControlListMappings.json"
       },
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/Domains/SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
       "voice_fallback_method": "POST",
       "voice_fallback_url": null,
       "voice_method": "POST",
       "voice_status_callback_method": "POST",
       "voice_status_callback_url": null,
       "voice_url": "https://dundermifflin.example.com/twilio/app.php"
      }
          >))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').sip.domains.get('SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.sid }.not_to raise_error
    end
  end
end

describe Twilio::Resources::V2010::AccountInstance::SipList::DomainInstance do
  context "should update domains" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      request = Hologram::Request.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/Domains/SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          query_params: {},
          form_params: {:ApiVersion => "api_version", :FriendlyName => "friendly_name", :VoiceFallbackMethod => "GET", :VoiceFallbackUrl => "https://example.com", :VoiceMethod => "GET", :VoiceStatusCallbackMethod => "GET", :VoiceStatusCallbackUrl => "https://example.com", :VoiceUrl => "https://example.com"})
      holodeck.mock(request,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "api_version": "2010-04-01",
       "auth_type": "IP_ACL",
       "date_created": "Fri, 06 Sep 2013 19:18:30 -0000",
       "date_updated": "Fri, 06 Sep 2013 19:18:30 -0000",
       "domain_name": "dunder-mifflin-scranton.sip.twilio.com",
       "friendly_name": "Scranton Office",
       "sid": "SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "subresource_uris": {
        "credential_list_mappings": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/Domains/SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/CredentialListMappings.json",
        "ip_access_control_list_mappings": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/Domains/SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IpAccessControlListMappings.json"
       },
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/Domains/SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
       "voice_fallback_method": "POST",
       "voice_fallback_url": null,
       "voice_method": "POST",
       "voice_status_callback_method": "POST",
       "voice_status_callback_url": null,
       "voice_url": "https://dundermifflin.example.com/twilio/app.php"
      }
          >))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').sip.domains.get('SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').update(:'ApiVersion' => "api_version", :'FriendlyName' => "friendly_name", :'VoiceFallbackMethod' => "GET", :'VoiceFallbackUrl' => "https://example.com", :'VoiceMethod' => "GET", :'VoiceStatusCallbackMethod' => "GET", :'VoiceStatusCallbackUrl' => "https://example.com", :'VoiceUrl' => "https://example.com")
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
       "auth_type": "IP_ACL",
       "date_created": "Fri, 06 Sep 2013 19:18:30 -0000",
       "date_updated": "Fri, 06 Sep 2013 19:18:30 -0000",
       "domain_name": "dunder-mifflin-scranton.sip.twilio.com",
       "friendly_name": "Scranton Office",
       "sid": "SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "subresource_uris": {
        "credential_list_mappings": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/Domains/SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/CredentialListMappings.json",
        "ip_access_control_list_mappings": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/Domains/SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IpAccessControlListMappings.json"
       },
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/Domains/SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
       "voice_fallback_method": "POST",
       "voice_fallback_url": null,
       "voice_method": "POST",
       "voice_status_callback_method": "POST",
       "voice_status_callback_url": null,
       "voice_url": "https://dundermifflin.example.com/twilio/app.php"
      }
          >))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').sip.domains.get('SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.update(:'ApiVersion' => "api_version", :'FriendlyName' => "friendly_name", :'VoiceFallbackMethod' => "GET", :'VoiceFallbackUrl' => "https://example.com", :'VoiceMethod' => "GET", :'VoiceStatusCallbackMethod' => "GET", :'VoiceStatusCallbackUrl' => "https://example.com", :'VoiceUrl' => "https://example.com") }.not_to raise_error
    end
  end

  context "should delete domains" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, '{}'))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').sip.domains.get('SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.delete }.not_to raise_error
    end
  
    it "and receive" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, '{}'))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').sip.domains.get('SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.delete }.not_to raise_error
    end
  end
end