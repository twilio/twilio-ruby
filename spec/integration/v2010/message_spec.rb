require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::MessageList do
  before do
    @read_client = Twilio::REST::Client.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::Client.new write_account_sid, write_auth_token
  
    it "can create messages" do
      @write_client go create it
    end
  
    it "can fetch messages" do
      @read_client go fetch it accounts.messages
    end
  
    it "can read messages" do
      @read_client go read it
    end
  end
end

describe Twilio::Resources::V2010::AccountInstance::MessageInstance do
  before do
    @read_client = Twilio::REST::Client.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::Client.new write_account_sid, write_auth_token
  
    it "can delete messages" do
      @write_client go delete it
    end
  
    it "can update messages" do
      @write_client go update it
    end
  end
end