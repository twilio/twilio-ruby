require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::QueueInstance::MemberList do
  before do
    Twiliodeck.activate
  end

  after do
    Twiliodeck.deactivate
  end

  context "should fetch queue_members" do
    it "and return 200" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').queues.get('QUaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').members.get('CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.call_sid }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::Client.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      resource = client.accounts.get('ACllllllllllllllllllllllllllllllll').queues.get('QUllllllllllllllllllllllllllllllll').members.get('CAllllllllllllllllllllllllllllllll')
      expect { resource.call_sid }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::Client.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      resource = client.accounts.get('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').queues.get('QUkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').members.get('CAkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk')
      expect { resource.call_sid }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::Client.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      resource = client.accounts.get('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').queues.get('QUmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').members.get('CAmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm')
      expect { resource.call_sid }.to raise_error Twilio::REST::RequestError
    end
  end

  context "should read queue_members" do
    it "and return 200" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').queues.get('QUaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').members.list() }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::Client.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      expect { client.accounts.get('ACllllllllllllllllllllllllllllllll').queues.get('QUllllllllllllllllllllllllllllllll').members.list() }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::Client.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      expect { client.accounts.get('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').queues.get('QUkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').members.list() }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::Client.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      expect { client.accounts.get('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').queues.get('QUmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').members.list() }.to raise_error Twilio::REST::RequestError
    end
  end
end

describe Twilio::Resources::V2010::AccountInstance::QueueInstance::MemberInstance do
  before do
    Twiliodeck.activate
  end

  after do
    Twiliodeck.deactivate
  end

  context "should update queue_members" do
    it "and return 200" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').queues.get('QUaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').members.get('CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.update(:'Method' => "GET", :'Url' => "https://example.com") }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::Client.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      resource = client.accounts.get('ACllllllllllllllllllllllllllllllll').queues.get('QUllllllllllllllllllllllllllllllll').members.get('CAllllllllllllllllllllllllllllllll')
      expect { resource.update(:'Method' => "GET", :'Url' => "https://example.com") }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::Client.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      resource = client.accounts.get('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').queues.get('QUkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').members.get('CAkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk')
      expect { resource.update(:'Method' => "GET", :'Url' => "https://example.com") }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::Client.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      resource = client.accounts.get('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').queues.get('QUmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').members.get('CAmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm')
      expect { resource.update(:'Method' => "GET", :'Url' => "https://example.com") }.to raise_error Twilio::REST::RequestError
    end
  end
end