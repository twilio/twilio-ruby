require 'spec_helper'

describe Twilio::Resources::Taskrouter::WorkspaceInstance::TaskInstance::ReservationList do
  before do
    @read_client = Twilio::REST::TaskrouterClient.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::TaskrouterClient.new write_account_sid, write_auth_token
  
    it "can read reservations" do
      @read_client go read it
    end
  
    it "can fetch reservations" do
      @read_client go fetch it workspaces.tasks.reservations
    end
  end
end

describe Twilio::Resources::Taskrouter::WorkspaceInstance::TaskInstance::ReservationInstance do
  before do
    @read_client = Twilio::REST::TaskrouterClient.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::TaskrouterClient.new write_account_sid, write_auth_token
  
    it "can update reservations" do
      @write_client go update it
    end
  end
end