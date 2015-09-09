require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::SipList::IpAccessControlListInstance::IpAddressList do
  context "should read ip_addresses" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "end": 0,
       "first_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/IpAccessControlLists/ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IpAddresses.json?PageSize=50&Page=0",
       "ip_addresses": [
        {
         "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "date_created": "Mon, 20 Jul 2015 17:27:10 +0000",
         "date_updated": "Mon, 20 Jul 2015 17:27:10 +0000",
         "friendly_name": "aaa",
         "ip_access_control_list_sid": "ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "ip_address": "192.1.1.2",
         "sid": "IPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/IpAccessControlLists/ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IpAddresses/IPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
        }
       ],
       "last_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/IpAccessControlLists/ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IpAddresses.json?PageSize=50&Page=0",
       "next_page_uri": null,
       "num_pages": 1,
       "page": 0,
       "page_size": 50,
       "previous_page_uri": null,
       "start": 0,
       "total": 1,
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/IpAccessControlLists/ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IpAddresses.json?PageSize=50&Page=0"
      }
          >))
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').sip.ip_access_control_lists.get('ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').ip_addresses.list() }.not_to raise_error
    end
  
    it "and receive" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "end": 0,
       "first_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/IpAccessControlLists/ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IpAddresses.json?PageSize=50&Page=0",
       "ip_addresses": [
        {
         "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "date_created": "Mon, 20 Jul 2015 17:27:10 +0000",
         "date_updated": "Mon, 20 Jul 2015 17:27:10 +0000",
         "friendly_name": "aaa",
         "ip_access_control_list_sid": "ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "ip_address": "192.1.1.2",
         "sid": "IPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/IpAccessControlLists/ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IpAddresses/IPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
        }
       ],
       "last_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/IpAccessControlLists/ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IpAddresses.json?PageSize=50&Page=0",
       "next_page_uri": null,
       "num_pages": 1,
       "page": 0,
       "page_size": 50,
       "previous_page_uri": null,
       "start": 0,
       "total": 1,
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/IpAccessControlLists/ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IpAddresses.json?PageSize=50&Page=0"
      }
          >))
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').sip.ip_access_control_lists.get('ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').ip_addresses.list() }.not_to raise_error
    end
  end

  context "should create ip_addresses" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "date_created": "Mon, 20 Jul 2015 17:27:10 +0000",
       "date_updated": "Mon, 20 Jul 2015 17:27:10 +0000",
       "friendly_name": "aaa",
       "ip_access_control_list_sid": "ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "ip_address": "192.1.1.2",
       "sid": "IPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/IpAccessControlLists/ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IpAddresses/IPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
          >))
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').sip.ip_access_control_lists.get('ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').ip_addresses.create(:'FriendlyName' => "friendly_name", :'IpAddress' => "ip_address") }.not_to raise_error
    end
  
    it "and receive" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "date_created": "Mon, 20 Jul 2015 17:27:10 +0000",
       "date_updated": "Mon, 20 Jul 2015 17:27:10 +0000",
       "friendly_name": "aaa",
       "ip_access_control_list_sid": "ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "ip_address": "192.1.1.2",
       "sid": "IPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/IpAccessControlLists/ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IpAddresses/IPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
          >))
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').sip.ip_access_control_lists.get('ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').ip_addresses.create(:'FriendlyName' => "friendly_name", :'IpAddress' => "ip_address") }.not_to raise_error
    end
  end

  context "should fetch ip_addresses" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "date_created": "Mon, 20 Jul 2015 17:27:10 +0000",
       "date_updated": "Mon, 20 Jul 2015 17:27:10 +0000",
       "friendly_name": "aaa",
       "ip_access_control_list_sid": "ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "ip_address": "192.1.1.2",
       "sid": "IPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/IpAccessControlLists/ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IpAddresses/IPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
          >))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').sip.ip_access_control_lists.get('ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').ip_addresses.get('IPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
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
       "date_created": "Mon, 20 Jul 2015 17:27:10 +0000",
       "date_updated": "Mon, 20 Jul 2015 17:27:10 +0000",
       "friendly_name": "aaa",
       "ip_access_control_list_sid": "ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "ip_address": "192.1.1.2",
       "sid": "IPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/IpAccessControlLists/ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IpAddresses/IPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
          >))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').sip.ip_access_control_lists.get('ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').ip_addresses.get('IPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.sid }.not_to raise_error
    end
  end
end

describe Twilio::Resources::V2010::AccountInstance::SipList::IpAccessControlListInstance::IpAddressInstance do
  context "should update ip_addresses" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      request = Hologram::Request.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/IpAccessControlLists/ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IpAddresses/IPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          query_params: {},
          form_params: {:FriendlyName => "friendly_name", :IpAddress => "ip_address"})
      holodeck.mock(request,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "date_created": "Mon, 20 Jul 2015 17:27:10 +0000",
       "date_updated": "Mon, 20 Jul 2015 17:27:10 +0000",
       "friendly_name": "aaa",
       "ip_access_control_list_sid": "ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "ip_address": "192.1.1.2",
       "sid": "IPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/IpAccessControlLists/ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IpAddresses/IPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
          >))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').sip.ip_access_control_lists.get('ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').ip_addresses.get('IPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').update(:'FriendlyName' => "friendly_name", :'IpAddress' => "ip_address")
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
       "date_created": "Mon, 20 Jul 2015 17:27:10 +0000",
       "date_updated": "Mon, 20 Jul 2015 17:27:10 +0000",
       "friendly_name": "aaa",
       "ip_access_control_list_sid": "ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "ip_address": "192.1.1.2",
       "sid": "IPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP/IpAccessControlLists/ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IpAddresses/IPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
          >))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').sip.ip_access_control_lists.get('ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').ip_addresses.get('IPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.update(:'FriendlyName' => "friendly_name", :'IpAddress' => "ip_address") }.not_to raise_error
    end
  end

  context "should delete ip_addresses" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, '{}'))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').sip.ip_access_control_lists.get('ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').ip_addresses.get('IPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.delete }.not_to raise_error
    end
  
    it "and receive" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, '{}'))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').sip.ip_access_control_lists.get('ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').ip_addresses.get('IPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.delete }.not_to raise_error
    end
  end
end