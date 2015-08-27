require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::OutgoingCallerIdList do
  before do
    @read_client = Twilio::REST::Client.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::Client.new write_account_sid, write_auth_token
  
    it "can fetch outgoing_caller_ids" do
      @read_client go fetch it accounts.outgoing_caller_ids
    end
  
    it "can read outgoing_caller_ids" do
      @read_client go read it
    end
  
    it "can create outgoing_caller_ids" do
      @write_client go create it
    end
  end
end

describe Twilio::Resources::V2010::AccountInstance::OutgoingCallerIdInstance do
  before do
    @read_client = Twilio::REST::Client.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::Client.new write_account_sid, write_auth_token
  
    it "can update outgoing_caller_ids" do
      @write_client go update it
    end
  
    it "can delete outgoing_caller_ids" do
      @write_client go delete it
    end
  end
end