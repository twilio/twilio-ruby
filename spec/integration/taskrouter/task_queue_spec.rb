require 'spec_helper'

describe Twilio::Resources::Taskrouter::WorkspaceInstance::TaskQueueList do
  before do
    @read_client = Twilio::REST::TaskrouterClient.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::TaskrouterClient.new write_account_sid, write_auth_token
  
    it "can fetch task_queues" do
      @read_client go fetch it workspaces.task_queues
    end
  
    it "can read task_queues" do
      @read_client go read it
    end
  
    it "can create task_queues" do
      @write_client go create it
    end
  end
end

describe Twilio::Resources::Taskrouter::WorkspaceInstance::TaskQueueInstance do
  before do
    @read_client = Twilio::REST::TaskrouterClient.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::TaskrouterClient.new write_account_sid, write_auth_token
  
    it "can update task_queues" do
      @write_client go update it
    end
  
    it "can delete task_queues" do
      @write_client go delete it
    end
  end
end