require 'spec_helper'

describe Twilio::Resources::Taskrouter::WorkspaceInstance::TaskList do
  before do
    @read_client = Twilio::REST::TaskrouterClient.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::TaskrouterClient.new write_account_sid, write_auth_token
  
    it "can fetch tasks" do
      @read_client go fetch it workspaces.tasks
    end
  
    it "can read tasks" do
      @read_client go read it
    end
  
    it "can create tasks" do
      @write_client go create it
    end
  end
end

describe Twilio::Resources::Taskrouter::WorkspaceInstance::TaskInstance do
  before do
    @read_client = Twilio::REST::TaskrouterClient.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::TaskrouterClient.new write_account_sid, write_auth_token
  
    it "can update tasks" do
      @write_client go update it
    end
  
    it "can delete tasks" do
      @write_client go delete it
    end
  end
end