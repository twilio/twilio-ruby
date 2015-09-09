require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::AddressInstance::DependentPhoneNumberList do
  context "should read dependent_phone_numbers" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "dependent_phone_numbers": [
        {
         "address_requirements": "any",
         "capabilities": {
          "MMS": "false",
          "SMS": "true",
          "voice": "true"
         },
         "friendly_name": "(510) 555-1212",
         "iso_country": "US",
         "lata": "722",
         "latitude": "37.780000",
         "longitude": "-122.380000",
         "phone_number": "+15105551212",
         "postal_code": "94703",
         "rate_center": "OKLD TRNID",
         "region": "CA"
        }
       ],
       "first_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Addresses/ADaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/DependentPhoneNumbers.json?Page=0&PageSize=50",
       "next_page_uri": null,
       "page": 0,
       "page_size": 50,
       "previous_page_uri": null,
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Addresses/ADaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/DependentPhoneNumbers.json"
      }
          >))
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').addresses.get('ADaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').dependent_phone_numbers.list() }.not_to raise_error
    end
  
    it "and receive" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "dependent_phone_numbers": [
        {
         "address_requirements": "any",
         "capabilities": {
          "MMS": "false",
          "SMS": "true",
          "voice": "true"
         },
         "friendly_name": "(510) 555-1212",
         "iso_country": "US",
         "lata": "722",
         "latitude": "37.780000",
         "longitude": "-122.380000",
         "phone_number": "+15105551212",
         "postal_code": "94703",
         "rate_center": "OKLD TRNID",
         "region": "CA"
        }
       ],
       "first_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Addresses/ADaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/DependentPhoneNumbers.json?Page=0&PageSize=50",
       "next_page_uri": null,
       "page": 0,
       "page_size": 50,
       "previous_page_uri": null,
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Addresses/ADaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/DependentPhoneNumbers.json"
      }
          >))
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').addresses.get('ADaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').dependent_phone_numbers.list() }.not_to raise_error
    end
  end
end