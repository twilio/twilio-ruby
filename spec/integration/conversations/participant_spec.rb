require 'spec_helper'

describe Twilio::Resources::Conversations::ConversationInstance::ParticipantList do
  before do
    Twiliodeck.activate
  end

  after do
    Twiliodeck.deactivate
  end

  context "should read participants" do
    it "and return 200" do
      client = Twilio::REST::ConversationsClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      expect { client.conversations.get('CVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').participants.list() }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::ConversationsClient.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      expect { client.conversations.get('CVllllllllllllllllllllllllllllllll').participants.list() }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::ConversationsClient.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      expect { client.conversations.get('CVkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').participants.list() }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::ConversationsClient.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      expect { client.conversations.get('CVmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').participants.list() }.to raise_error Twilio::REST::RequestError
    end
  end

  context "should create participants" do
    it "and return 200" do
      client = Twilio::REST::ConversationsClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      expect { client.conversations.get('CVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').participants.create(from: 'from', to: 'to') }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::ConversationsClient.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      expect { client.conversations.get('CVllllllllllllllllllllllllllllllll').participants.create(from: 'from', to: 'to') }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::ConversationsClient.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      expect { client.conversations.get('CVkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').participants.create(from: 'from', to: 'to') }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::ConversationsClient.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      expect { client.conversations.get('CVmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').participants.create(from: 'from', to: 'to') }.to raise_error Twilio::REST::RequestError
    end
  end

  context "should fetch participants" do
    it "and return 200" do
      client = Twilio::REST::ConversationsClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      resource = client.conversations.get('CVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').participants.get('PAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.sid }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::ConversationsClient.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      resource = client.conversations.get('CVllllllllllllllllllllllllllllllll').participants.get('PAllllllllllllllllllllllllllllllll')
      expect { resource.sid }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::ConversationsClient.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      resource = client.conversations.get('CVkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').participants.get('PAkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk')
      expect { resource.sid }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::ConversationsClient.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      resource = client.conversations.get('CVmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').participants.get('PAmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm')
      expect { resource.sid }.to raise_error Twilio::REST::RequestError
    end
  end
end