require 'spec_helper'

describe Twilio::Resources::Conversations::ConversationList::InProgressList do
  before do
    Twiliodeck.activate
  end

  after do
    Twiliodeck.deactivate
  end

  context "should read conversations" do
    it "and return 200" do
      client = Twilio::REST::ConversationsClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      expect { client.conversations.in_progress.list() }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::ConversationsClient.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      expect { client.conversations.in_progress.list() }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::ConversationsClient.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      expect { client.conversations.in_progress.list() }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::ConversationsClient.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      expect { client.conversations.in_progress.list() }.to raise_error Twilio::REST::RequestError
    end
  end
end