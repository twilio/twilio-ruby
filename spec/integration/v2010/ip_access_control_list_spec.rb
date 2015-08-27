require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::SipList::IpAccessControlListList do
  before do
    @read_client = Twilio::REST::Client.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::Client.new write_account_sid, write_auth_token
  
    it "can read ip_access_control_lists" do
      @read_client go read it
    end
  
    it "can create ip_access_control_lists" do
      @write_client go create it
    end
  
    it "can fetch ip_access_control_lists" do
      @read_client go fetch it accounts.sip.ip_access_control_lists
    end
  end
end

describe Twilio::Resources::V2010::AccountInstance::SipList::IpAccessControlListInstance do
  before do
    @read_client = Twilio::REST::Client.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::Client.new write_account_sid, write_auth_token
  
    it "can update ip_access_control_lists" do
      @write_client go update it
    end
  
    it "can delete ip_access_control_lists" do
      @write_client go delete it
    end
  end
end