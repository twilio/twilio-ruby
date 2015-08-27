require 'spec_helper'

describe Twilio::Resources::Pricing::VoiceList::CountryList do
  before do
    @read_client = Twilio::REST::PricingClient.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::PricingClient.new write_account_sid, write_auth_token
  
    it "can read countries" do
      @read_client go read it
    end
  
    it "can fetch countries" do
      @read_client go fetch it voice.countries
    end
  end
end