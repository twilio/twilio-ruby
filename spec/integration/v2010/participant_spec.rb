require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::ConferenceInstance::ParticipantList do
  before do
    @read_client = Twilio::REST::Client.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::Client.new write_account_sid, write_auth_token
  
    it "can fetch participants" do
      @read_client go fetch it accounts.conferences.participants
    end
  
    it "can read participants" do
      @read_client go read it
    end
  end
end

describe Twilio::Resources::V2010::AccountInstance::ConferenceInstance::ParticipantInstance do
  before do
    @read_client = Twilio::REST::Client.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::Client.new write_account_sid, write_auth_token
  
    it "can update participants" do
      @write_client go update it
    end
  
    it "can delete participants" do
      @write_client go delete it
    end
  end
end