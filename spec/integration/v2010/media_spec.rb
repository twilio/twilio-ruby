require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::MessageInstance::MediaList do
  before do
    @read_client = Twilio::REST::Client.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::Client.new write_account_sid, write_auth_token
  
    it "can fetch media_list" do
      @read_client go fetch it accounts.messages.media
    end
  
    it "can read media_list" do
      @read_client go read it
    end
  end
end

describe Twilio::Resources::V2010::AccountInstance::MessageInstance::MediaInstance do
  before do
    @read_client = Twilio::REST::Client.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::Client.new write_account_sid, write_auth_token
  
    it "can delete media_list" do
      @write_client go delete it
    end
  end
end