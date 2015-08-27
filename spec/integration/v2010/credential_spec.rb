require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::SipList::CredentialListInstance::CredentialList do
  before do
    @read_client = Twilio::REST::Client.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::Client.new write_account_sid, write_auth_token
  
    it "can read credentials" do
      @read_client go read it
    end
  
    it "can create credentials" do
      @write_client go create it
    end
  
    it "can fetch credentials" do
      @read_client go fetch it accounts.sip.credential_lists.credentials
    end
  end
end

describe Twilio::Resources::V2010::AccountInstance::SipList::CredentialListInstance::CredentialInstance do
  before do
    @read_client = Twilio::REST::Client.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::Client.new write_account_sid, write_auth_token
  
    it "can update credentials" do
      @write_client go update it
    end
  
    it "can delete credentials" do
      @write_client go delete it
    end
  end
end