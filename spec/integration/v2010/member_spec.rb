require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::QueueInstance::MemberList do
  before do
    @read_client = Twilio::REST::Client.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::Client.new write_account_sid, write_auth_token
  
    it "can fetch queue_members" do
      @read_client go fetch it accounts.queues.members
    end
  
    it "can read queue_members" do
      @read_client go read it
    end
  end
end

describe Twilio::Resources::V2010::AccountInstance::QueueInstance::MemberInstance do
  before do
    @read_client = Twilio::REST::Client.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::Client.new write_account_sid, write_auth_token
  
    it "can update queue_members" do
      @write_client go update it
    end
  end
end