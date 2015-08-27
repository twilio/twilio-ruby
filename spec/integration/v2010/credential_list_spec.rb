require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::SipList::CredentialListList do
  before do
    @read_client = Twilio::REST::Client.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::Client.new write_account_sid, write_auth_token
  
    it "can read credential_lists" do
      @read_client go read it
    end
  
    it "can create credential_lists" do
      @write_client go create it
    end
  
    it "can fetch credential_lists" do
      @read_client go fetch it accounts.sip.credential_lists
    end
  end
end

describe Twilio::Resources::V2010::AccountInstance::SipList::CredentialListInstance do
  before do
    @read_client = Twilio::REST::Client.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::Client.new write_account_sid, write_auth_token
  
    it "can update credential_lists" do
      @write_client go update it
    end
  
    it "can delete credential_lists" do
      @write_client go delete it
    end
  end
end