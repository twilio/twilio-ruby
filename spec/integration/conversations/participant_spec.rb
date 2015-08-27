require 'spec_helper'

describe Twilio::Resources::Conversations::ConversationInstance::ParticipantList do
  before do
    @read_client = Twilio::REST::ConversationsClient.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::ConversationsClient.new write_account_sid, write_auth_token
  
    it "can read participants" do
      @read_client go read it
    end
  
    it "can create participants" do
      @write_client go create it
    end
  
    it "can fetch participants" do
      @read_client go fetch it conversations.participants
    end
  end
end