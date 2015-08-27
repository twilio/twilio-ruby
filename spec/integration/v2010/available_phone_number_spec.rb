require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::AvailablePhoneNumberCountryList do
  before do
    @read_client = Twilio::REST::Client.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::Client.new write_account_sid, write_auth_token
  
    it "can read countries" do
      @read_client go read it
    end
  
    it "can fetch countries" do
      @read_client go fetch it accounts.available_phone_numbers
    end
  end
end