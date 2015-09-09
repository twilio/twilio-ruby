require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::TokenList do
  context "should create None" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "date_created": "Fri, 24 Jul 2015 18:43:58 +0000",
       "date_updated": "Fri, 24 Jul 2015 18:43:58 +0000",
       "ice_servers": [
        {
         "url": "stun:global.stun:3478?transport=udp"
        },
        {
         "credential": "5SR2x8mZK1lTFJW3NVgLGw6UM9C0dja4jI/Hdw3xr+w=",
         "url": "turn:global.turn:3478?transport=udp",
         "username": "cda92e5006c7810494639fc466ecc80182cef8183fdf400f84c4126f3b59d0bb"
        }
       ],
       "password": "5SR2x8mZK1lTFJW3NVgLGw6UM9C0dja4jI/Hdw3xr+w=",
       "ttl": "86400",
       "username": "cda92e5006c7810494639fc466ecc80182cef8183fdf400f84c4126f3b59d0bb"
      }
          >))
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').tokens.create(:'Ttl' => 1) }.not_to raise_error
    end
  
    it "and receive" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "date_created": "Fri, 24 Jul 2015 18:43:58 +0000",
       "date_updated": "Fri, 24 Jul 2015 18:43:58 +0000",
       "ice_servers": [
        {
         "url": "stun:global.stun:3478?transport=udp"
        },
        {
         "credential": "5SR2x8mZK1lTFJW3NVgLGw6UM9C0dja4jI/Hdw3xr+w=",
         "url": "turn:global.turn:3478?transport=udp",
         "username": "cda92e5006c7810494639fc466ecc80182cef8183fdf400f84c4126f3b59d0bb"
        }
       ],
       "password": "5SR2x8mZK1lTFJW3NVgLGw6UM9C0dja4jI/Hdw3xr+w=",
       "ttl": "86400",
       "username": "cda92e5006c7810494639fc466ecc80182cef8183fdf400f84c4126f3b59d0bb"
      }
          >))
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').tokens.create(:'Ttl' => 1) }.not_to raise_error
    end
  end
end