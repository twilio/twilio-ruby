require 'spec_helper'

describe Twilio::Resources::Conversations::ConversationList do
  before do
    @read_client = Twilio::REST::ConversationsClient.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::ConversationsClient.new write_account_sid, write_auth_token
  
    it "can fetch None" do
      @read_client go fetch it conversations
    end
  end
end