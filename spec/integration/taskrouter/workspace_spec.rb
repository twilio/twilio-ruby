require 'spec_helper'

describe Twilio::Resources::Taskrouter::WorkspaceList do
  before do
    @read_client = Twilio::REST::TaskrouterClient.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::TaskrouterClient.new write_account_sid, write_auth_token
  
    it "can fetch workspaces" do
      @read_client go fetch it workspaces
    end
  
    it "can read workspaces" do
      @read_client go read it
    end
  
    it "can create workspaces" do
      @write_client go create it
    end
  end
end

describe Twilio::Resources::Taskrouter::WorkspaceInstance do
  before do
    @read_client = Twilio::REST::TaskrouterClient.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::TaskrouterClient.new write_account_sid, write_auth_token
  
    it "can update workspaces" do
      @write_client go update it
    end
  
    it "can delete workspaces" do
      @write_client go delete it
    end
  end
end