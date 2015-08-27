require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::IncomingPhoneNumberList::MobileList do
  before do
    @read_client = Twilio::REST::Client.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::Client.new write_account_sid, write_auth_token
  
    it "can read incoming_phone_numbers" do
      @read_client go read it
    end
  
    it "can create incoming_phone_numbers" do
      @write_client go create it
    end
  end
end