require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::RecordingList do
  before do
    @read_client = Twilio::REST::Client.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::Client.new write_account_sid, write_auth_token
  
    it "can fetch recordings" do
      @read_client go fetch it accounts.recordings
    end
  
    it "can read recordings" do
      @read_client go read it
    end
  end
end

describe Twilio::Resources::V2010::AccountInstance::RecordingInstance do
  before do
    @read_client = Twilio::REST::Client.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::Client.new write_account_sid, write_auth_token
  
    it "can delete recordings" do
      @write_client go delete it
    end
  end
end