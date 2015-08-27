require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::TokenList do
  before do
    @read_client = Twilio::REST::Client.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::Client.new write_account_sid, write_auth_token
  
    it "can create None" do
      @write_client go create it
    end
  end
end