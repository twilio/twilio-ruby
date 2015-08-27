require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::SipList::DomainInstance::CredentialListMappingList do
  before do
    @read_client = Twilio::REST::Client.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::Client.new write_account_sid, write_auth_token
  
    it "can create credential_list_mappings" do
      @write_client go create it
    end
  
    it "can read credential_list_mappings" do
      @read_client go read it
    end
  
    it "can fetch credential_list_mappings" do
      @read_client go fetch it accounts.sip.domains.credential_list_mappings
    end
  end
end

describe Twilio::Resources::V2010::AccountInstance::SipList::DomainInstance::CredentialListMappingInstance do
  before do
    @read_client = Twilio::REST::Client.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::Client.new write_account_sid, write_auth_token
  
    it "can delete credential_list_mappings" do
      @write_client go delete it
    end
  end
end