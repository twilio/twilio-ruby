require 'spec_helper'

describe Twilio::Resources::Monitor::AlertList do
  before do
    @read_client = Twilio::REST::MonitorClient.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::MonitorClient.new write_account_sid, write_auth_token
  
    it "can fetch alerts" do
      @read_client go fetch it alerts
    end
  
    it "can read alerts" do
      @read_client go read it
    end
  end
end

describe Twilio::Resources::Monitor::AlertInstance do
  before do
    @read_client = Twilio::REST::MonitorClient.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::MonitorClient.new write_account_sid, write_auth_token
  
    it "can delete alerts" do
      @write_client go delete it
    end
  end
end