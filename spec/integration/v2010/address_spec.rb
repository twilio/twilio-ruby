require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::AddressList do
  context "should create addresses" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "city": "SF",
       "customer_name": "name",
       "date_created": "Tue, 18 Aug 2015 17:07:30 +0000",
       "date_updated": "Tue, 18 Aug 2015 17:07:30 +0000",
       "friendly_name": null,
       "iso_country": "US",
       "postal_code": "94019",
       "region": "CA",
       "sid": "ADaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "street": "4th",
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Addresses/ADaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
          >))
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').addresses.create(:'City' => "city", :'CustomerName' => "customer_name", :'FriendlyName' => "friendly_name", :'IsoCountry' => "US", :'PostalCode' => "postal_code", :'Region' => "region", :'Street' => "street") }.not_to raise_error
    end
  
    it "and receive" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "city": "SF",
       "customer_name": "name",
       "date_created": "Tue, 18 Aug 2015 17:07:30 +0000",
       "date_updated": "Tue, 18 Aug 2015 17:07:30 +0000",
       "friendly_name": null,
       "iso_country": "US",
       "postal_code": "94019",
       "region": "CA",
       "sid": "ADaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "street": "4th",
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Addresses/ADaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
          >))
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').addresses.create(:'City' => "city", :'CustomerName' => "customer_name", :'FriendlyName' => "friendly_name", :'IsoCountry' => "US", :'PostalCode' => "postal_code", :'Region' => "region", :'Street' => "street") }.not_to raise_error
    end
  end

  context "should fetch addresses" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "city": "SF",
       "customer_name": "name",
       "date_created": "Tue, 18 Aug 2015 17:07:30 +0000",
       "date_updated": "Tue, 18 Aug 2015 17:07:30 +0000",
       "friendly_name": null,
       "iso_country": "US",
       "postal_code": "94019",
       "region": "CA",
       "sid": "ADaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "street": "4th",
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Addresses/ADaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
          >))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').addresses.get('ADaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
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
       "city": "SF",
       "customer_name": "name",
       "date_created": "Tue, 18 Aug 2015 17:07:30 +0000",
       "date_updated": "Tue, 18 Aug 2015 17:07:30 +0000",
       "friendly_name": null,
       "iso_country": "US",
       "postal_code": "94019",
       "region": "CA",
       "sid": "ADaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "street": "4th",
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Addresses/ADaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
          >))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').addresses.get('ADaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.sid }.not_to raise_error
    end
  end

  context "should read addresses" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "addresses": [
        {
         "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "city": "SF",
         "customer_name": "name",
         "date_created": "Tue, 18 Aug 2015 17:07:30 +0000",
         "date_updated": "Tue, 18 Aug 2015 17:07:30 +0000",
         "friendly_name": null,
         "iso_country": "US",
         "postal_code": "94019",
         "region": "CA",
         "sid": "ADaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "street": "4th",
         "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Addresses/ADaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
        }
       ],
       "end": 0,
       "first_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Addresses.json?PageSize=50&Page=0",
       "last_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Addresses.json?PageSize=50&Page=0",
       "next_page_uri": null,
       "num_pages": 1,
       "page": 0,
       "page_size": 50,
       "previous_page_uri": null,
       "start": 0,
       "total": 1,
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Addresses.json?PageSize=50&Page=0"
      }
          >))
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').addresses.list(:'CustomerName' => "customer_name", :'FriendlyName' => "friendly_name", :'IsoCountry' => "US") }.not_to raise_error
    end
  
    it "and receive" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "addresses": [
        {
         "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "city": "SF",
         "customer_name": "name",
         "date_created": "Tue, 18 Aug 2015 17:07:30 +0000",
         "date_updated": "Tue, 18 Aug 2015 17:07:30 +0000",
         "friendly_name": null,
         "iso_country": "US",
         "postal_code": "94019",
         "region": "CA",
         "sid": "ADaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "street": "4th",
         "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Addresses/ADaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
        }
       ],
       "end": 0,
       "first_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Addresses.json?PageSize=50&Page=0",
       "last_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Addresses.json?PageSize=50&Page=0",
       "next_page_uri": null,
       "num_pages": 1,
       "page": 0,
       "page_size": 50,
       "previous_page_uri": null,
       "start": 0,
       "total": 1,
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Addresses.json?PageSize=50&Page=0"
      }
          >))
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').addresses.list(:'CustomerName' => "customer_name", :'FriendlyName' => "friendly_name", :'IsoCountry' => "US") }.not_to raise_error
    end
  end
end

describe Twilio::Resources::V2010::AccountInstance::AddressInstance do
  context "should delete addresses" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, '{}'))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').addresses.get('ADaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.delete }.not_to raise_error
    end
  
    it "and receive" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, '{}'))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').addresses.get('ADaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.delete }.not_to raise_error
    end
  end

  context "should update addresses" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      request = Hologram::Request.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Addresses/ADaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          query_params: {},
          form_params: {:City => "city", :CustomerName => "customer_name", :FriendlyName => "friendly_name", :PostalCode => "postal_code", :Region => "region", :Street => "street"})
      holodeck.mock(request,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "city": "SF",
       "customer_name": "name",
       "date_created": "Tue, 18 Aug 2015 17:07:30 +0000",
       "date_updated": "Tue, 18 Aug 2015 17:07:30 +0000",
       "friendly_name": null,
       "iso_country": "US",
       "postal_code": "94019",
       "region": "CA",
       "sid": "ADaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "street": "4th",
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Addresses/ADaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
          >))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').addresses.get('ADaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').update(:'City' => "city", :'CustomerName' => "customer_name", :'FriendlyName' => "friendly_name", :'PostalCode' => "postal_code", :'Region' => "region", :'Street' => "street")
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
       "city": "SF",
       "customer_name": "name",
       "date_created": "Tue, 18 Aug 2015 17:07:30 +0000",
       "date_updated": "Tue, 18 Aug 2015 17:07:30 +0000",
       "friendly_name": null,
       "iso_country": "US",
       "postal_code": "94019",
       "region": "CA",
       "sid": "ADaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "street": "4th",
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Addresses/ADaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
          >))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').addresses.get('ADaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.update(:'City' => "city", :'CustomerName' => "customer_name", :'FriendlyName' => "friendly_name", :'PostalCode' => "postal_code", :'Region' => "region", :'Street' => "street") }.not_to raise_error
    end
  end
end