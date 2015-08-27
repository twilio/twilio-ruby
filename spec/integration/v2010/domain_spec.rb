require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::SipList::DomainList do
  before do
    @read_client = Twilio::REST::Client.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::Client.new write_account_sid, write_auth_token
  
    it "can read domains" do
      @read_client go read it
    end
  
    it "can create domains" do
      @write_client go create it
    end
  
    it "can fetch domains" do
      @read_client go fetch it accounts.sip.domains
    end
  end
end

describe Twilio::Resources::V2010::AccountInstance::SipList::DomainInstance do
  before do
    @read_client = Twilio::REST::Client.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::Client.new write_account_sid, write_auth_token
  
    it "can update domains" do
      @write_client go update it
    end
  
    it "can delete domains" do
      @write_client go delete it
    end
  end
end