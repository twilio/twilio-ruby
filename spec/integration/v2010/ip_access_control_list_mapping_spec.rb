require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::SipList::DomainInstance::IpAccessControlListMappingList do
  before do
    @read_client = Twilio::REST::Client.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::Client.new write_account_sid, write_auth_token
  
    it "can fetch ip_access_control_list_mappings" do
      @read_client go fetch it accounts.sip.domains.ip_access_control_list_mappings
    end
  
    it "can create ip_access_control_list_mappings" do
      @write_client go create it
    end
  
    it "can read ip_access_control_list_mappings" do
      @read_client go read it
    end
  end
end

describe Twilio::Resources::V2010::AccountInstance::SipList::DomainInstance::IpAccessControlListMappingInstance do
  before do
    @read_client = Twilio::REST::Client.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::Client.new write_account_sid, write_auth_token
  
    it "can delete ip_access_control_list_mappings" do
      @write_client go delete it
    end
  end
end