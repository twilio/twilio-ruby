require 'spec_helper'

describe Twilio::Resources::Monitor::EventList do
  before do
    @read_client = Twilio::REST::MonitorClient.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::MonitorClient.new write_account_sid, write_auth_token
  
    it "can fetch events" do
      @read_client go fetch it events
    end
  
    it "can read events" do
      @read_client go read it
    end
  end
end