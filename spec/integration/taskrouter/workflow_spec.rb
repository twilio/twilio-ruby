require 'spec_helper'

describe Twilio::Resources::Taskrouter::WorkspaceInstance::WorkflowList do
  before do
    @read_client = Twilio::REST::TaskrouterClient.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::TaskrouterClient.new write_account_sid, write_auth_token
  
    it "can fetch workflows" do
      @read_client go fetch it workspaces.workflows
    end
  
    it "can read workflows" do
      @read_client go read it
    end
  
    it "can create workflows" do
      @write_client go create it
    end
  end
end

describe Twilio::Resources::Taskrouter::WorkspaceInstance::WorkflowInstance do
  before do
    @read_client = Twilio::REST::TaskrouterClient.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::TaskrouterClient.new write_account_sid, write_auth_token
  
    it "can update workflows" do
      @write_client go update it
    end
  
    it "can delete workflows" do
      @write_client go delete it
    end
  end
end