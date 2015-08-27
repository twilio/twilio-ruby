require 'spec_helper'

describe Twilio::Resources::Taskrouter::WorkspaceInstance::EventList do
  before do
    @read_client = Twilio::REST::TaskrouterClient.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::TaskrouterClient.new write_account_sid, write_auth_token
  
    it "can fetch events" do
      @read_client go fetch it workspaces.events
    end
  
    it "can read events" do
      @read_client go read it
    end
  end
end