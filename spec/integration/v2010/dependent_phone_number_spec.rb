require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::AddressInstance::DependentPhoneNumberList do
  before do
    @read_client = Twilio::REST::Client.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::Client.new write_account_sid, write_auth_token
  
    it "can read dependent_phone_numbers" do
      @read_client go read it
    end
  end
end