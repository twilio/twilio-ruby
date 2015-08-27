require 'spec_helper'

describe Twilio::Resources::Taskrouter::WorkspaceInstance::WorkerList do
  before do
    @read_client = Twilio::REST::TaskrouterClient.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::TaskrouterClient.new write_account_sid, write_auth_token
  
    it "can read workers" do
      @read_client go read it
    end
  
    it "can create workers" do
      @write_client go create it
    end
  
    it "can fetch workers" do
      @read_client go fetch it workspaces.workers
    end
  end
end

describe Twilio::Resources::Taskrouter::WorkspaceInstance::WorkerInstance do
  before do
    @read_client = Twilio::REST::TaskrouterClient.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::TaskrouterClient.new write_account_sid, write_auth_token
  
    it "can update workers" do
      @write_client go update it
    end
  
    it "can delete workers" do
      @write_client go delete it
    end
  end
end