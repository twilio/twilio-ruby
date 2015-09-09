require 'spec_helper'

describe Twilio::Resources::Lookups::PhoneNumberList do
  context "should fetch None" do
    it "and succeed" do
      client = Twilio::REST::LookupsClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "carrier": {
        "error_code": null,
        "mobile_country_code": "310",
        "mobile_network_code": "456",
        "name": "verizon",
        "type": "mobile"
       },
       "country_code": "US",
       "national_format": "(510) 867-5309",
       "phone_number": "+15108675309",
       "url": "https://lookups.twilio.com/v1/PhoneNumbers/phone_number"
      }
          >))
      resource = client.phone_numbers.get("+987654321", {CountryCode: "country_code", Type: "type"})
      expect { resource.phone_number }.not_to raise_error
    end
  
    it "and receive" do
      client = Twilio::REST::LookupsClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "carrier": {
        "error_code": null,
        "mobile_country_code": "310",
        "mobile_network_code": "456",
        "name": "verizon",
        "type": "mobile"
       },
       "country_code": "US",
       "national_format": "(510) 867-5309",
       "phone_number": "+15108675309",
       "url": "https://lookups.twilio.com/v1/PhoneNumbers/phone_number"
      }
          >))
      resource = client.phone_numbers.get("+987654321", {CountryCode: "country_code", Type: "type"})
      expect { resource.phone_number }.not_to raise_error
    end
  end
end