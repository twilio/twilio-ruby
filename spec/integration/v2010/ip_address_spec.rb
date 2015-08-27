require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::SipList::IpAccessControlListInstance::IpAddressList do
  before do
    @read_client = Twilio::REST::Client.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::Client.new write_account_sid, write_auth_token
  
    it "can read ip_addresses" do
      @read_client go read it
    end
  
    it "can create ip_addresses" do
      @write_client go create it
    end
  
    it "can fetch ip_addresses" do
      @read_client go fetch it accounts.sip.ip_access_control_lists.ip_addresses
    end
  end
end

describe Twilio::Resources::V2010::AccountInstance::SipList::IpAccessControlListInstance::IpAddressInstance do
  before do
    @read_client = Twilio::REST::Client.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::Client.new write_account_sid, write_auth_token
  
    it "can update ip_addresses" do
      @write_client go update it
    end
  
    it "can delete ip_addresses" do
      @write_client go delete it
    end
  end
end