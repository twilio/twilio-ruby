require 'spec_helper'

describe Twilio::Resources::Pricing::VoiceList::NumberList do
  context "should fetch None" do
    it "and succeed" do
      client = Twilio::REST::PricingClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "country": "United States",
       "inbound_call_price": {
        "base_price": null,
        "current_price": null,
        "number_type": null
       },
       "iso_country": "US",
       "number": "+987654321",
       "outbound_call_price": {
        "base_price": "0.015",
        "current_price": "0.015"
       },
       "price_unit": "USD",
       "url": "https://pricing.twilio.com/v1/Voice/Numbers/+987654321"
      }
          >))
      resource = client.voice.numbers.get('e164aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.number }.not_to raise_error
    end
  
    it "and receive" do
      client = Twilio::REST::PricingClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "country": "United States",
       "inbound_call_price": {
        "base_price": null,
        "current_price": null,
        "number_type": null
       },
       "iso_country": "US",
       "number": "+987654321",
       "outbound_call_price": {
        "base_price": "0.015",
        "current_price": "0.015"
       },
       "price_unit": "USD",
       "url": "https://pricing.twilio.com/v1/Voice/Numbers/+987654321"
      }
          >))
      resource = client.voice.numbers.get('e164aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.number }.not_to raise_error
    end
  end
end