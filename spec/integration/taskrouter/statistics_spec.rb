require 'spec_helper'

describe Twilio::Resources::Taskrouter::WorkspaceInstance::StatisticsList do
  before do
    @read_client = Twilio::REST::TaskrouterClient.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::TaskrouterClient.new write_account_sid, write_auth_token
  
    it "can fetch None" do
      @read_client go fetch it workspaces.statistics
    end
  end
end