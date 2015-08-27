require 'spec_helper'

describe Twilio::Resources::Pricing::VoiceList::NumberList do
  before do
    @read_client = Twilio::REST::PricingClient.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::PricingClient.new write_account_sid, write_auth_token
  
    it "can fetch None" do
      @read_client go fetch it voice.numbers
    end
  end
end