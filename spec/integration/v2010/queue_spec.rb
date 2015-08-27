require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::QueueList do
  before do
    @read_client = Twilio::REST::Client.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::Client.new write_account_sid, write_auth_token
  
    it "can fetch queues" do
      @read_client go fetch it accounts.queues
    end
  
    it "can read queues" do
      @read_client go read it
    end
  
    it "can create queues" do
      @write_client go create it
    end
  end
end

describe Twilio::Resources::V2010::AccountInstance::QueueInstance do
  before do
    @read_client = Twilio::REST::Client.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::Client.new write_account_sid, write_auth_token
  
    it "can update queues" do
      @write_client go update it
    end
  
    it "can delete queues" do
      @write_client go delete it
    end
  end
end