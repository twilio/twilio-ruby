require 'spec_helper'

describe Twilio::Resources::Conversations::ConversationList::CompletedList do
  before do
    @read_client = Twilio::REST::ConversationsClient.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::ConversationsClient.new write_account_sid, write_auth_token
  
    it "can read conversations" do
      @read_client go read it
    end
  end
end