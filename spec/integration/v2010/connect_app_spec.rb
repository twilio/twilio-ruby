require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::ConnectAppList do
  context "should fetch connect_apps" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "authorize_redirect_url": "http://example.com/redirect",
       "company_name": "Twilio",
       "deauthorize_callback_method": "GET",
       "deauthorize_callback_url": "http://example.com/deauth",
       "description": null,
       "friendly_name": "Connect app for deletion",
       "homepage_url": "http://example.com/home",
       "permissions": [],
       "sid": "CNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/ConnectApps/CNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
          >))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').connect_apps.get('CNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
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
       "authorize_redirect_url": "http://example.com/redirect",
       "company_name": "Twilio",
       "deauthorize_callback_method": "GET",
       "deauthorize_callback_url": "http://example.com/deauth",
       "description": null,
       "friendly_name": "Connect app for deletion",
       "homepage_url": "http://example.com/home",
       "permissions": [],
       "sid": "CNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/ConnectApps/CNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
          >))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').connect_apps.get('CNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.sid }.not_to raise_error
    end
  end

  context "should read connect_apps" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "connect_apps": [
        {
         "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "authorize_redirect_url": "http://example.com/redirect",
         "company_name": "Twilio",
         "deauthorize_callback_method": "GET",
         "deauthorize_callback_url": "http://example.com/deauth",
         "description": null,
         "friendly_name": "Connect app for deletion",
         "homepage_url": "http://example.com/home",
         "permissions": [],
         "sid": "CNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/ConnectApps/CNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
        }
       ],
       "end": 0,
       "first_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/ConnectApps.json?Page=0&PageSize=50",
       "last_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/ConnectApps.json?Page=0&PageSize=50",
       "next_page_uri": null,
       "num_pages": 1,
       "page": 0,
       "page_size": 50,
       "previous_page_uri": null,
       "start": 0,
       "total": 1,
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/ConnectApps.json"
      }
          >))
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').connect_apps.list() }.not_to raise_error
    end
  
    it "and receive" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "connect_apps": [
        {
         "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "authorize_redirect_url": "http://example.com/redirect",
         "company_name": "Twilio",
         "deauthorize_callback_method": "GET",
         "deauthorize_callback_url": "http://example.com/deauth",
         "description": null,
         "friendly_name": "Connect app for deletion",
         "homepage_url": "http://example.com/home",
         "permissions": [],
         "sid": "CNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/ConnectApps/CNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
        }
       ],
       "end": 0,
       "first_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/ConnectApps.json?Page=0&PageSize=50",
       "last_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/ConnectApps.json?Page=0&PageSize=50",
       "next_page_uri": null,
       "num_pages": 1,
       "page": 0,
       "page_size": 50,
       "previous_page_uri": null,
       "start": 0,
       "total": 1,
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/ConnectApps.json"
      }
          >))
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').connect_apps.list() }.not_to raise_error
    end
  end
end

describe Twilio::Resources::V2010::AccountInstance::ConnectAppInstance do
  context "should update connect_apps" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      request = Hologram::Request.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/ConnectApps/CNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          query_params: {},
          form_params: {:AuthorizeRedirectUrl => "https://example.com", :CompanyName => "company_name", :DeauthorizeCallbackMethod => "GET", :DeauthorizeCallbackUrl => "https://example.com", :Description => "description", :FriendlyName => "friendly_name", :HomepageUrl => "https://example.com", :Permissions => ["get-all"]})
      holodeck.mock(request,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "authorize_redirect_url": "http://example.com/redirect",
       "company_name": "Twilio",
       "deauthorize_callback_method": "GET",
       "deauthorize_callback_url": "http://example.com/deauth",
       "description": null,
       "friendly_name": "Connect app for deletion",
       "homepage_url": "http://example.com/home",
       "permissions": [],
       "sid": "CNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/ConnectApps/CNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
          >))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').connect_apps.get('CNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').update(:'AuthorizeRedirectUrl' => "https://example.com", :'CompanyName' => "company_name", :'DeauthorizeCallbackMethod' => "GET", :'DeauthorizeCallbackUrl' => "https://example.com", :'Description' => "description", :'FriendlyName' => "friendly_name", :'HomepageUrl' => "https://example.com", :'Permissions' => ['get-all'])
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
       "authorize_redirect_url": "http://example.com/redirect",
       "company_name": "Twilio",
       "deauthorize_callback_method": "GET",
       "deauthorize_callback_url": "http://example.com/deauth",
       "description": null,
       "friendly_name": "Connect app for deletion",
       "homepage_url": "http://example.com/home",
       "permissions": [],
       "sid": "CNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/ConnectApps/CNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
          >))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').connect_apps.get('CNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.update(:'AuthorizeRedirectUrl' => "https://example.com", :'CompanyName' => "company_name", :'DeauthorizeCallbackMethod' => "GET", :'DeauthorizeCallbackUrl' => "https://example.com", :'Description' => "description", :'FriendlyName' => "friendly_name", :'HomepageUrl' => "https://example.com", :'Permissions' => ['get-all']) }.not_to raise_error
    end
  end
end