require 'spec_helper'

describe Twilio::Resources::Lookups::PhoneNumberList do
  before do
    @read_client = Twilio::REST::LookupsClient.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::LookupsClient.new write_account_sid, write_auth_token
  
    it "can fetch None" do
      @read_client go fetch it phone_numbers
    end
  end
end