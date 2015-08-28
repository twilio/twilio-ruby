require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::SipList::CredentialListInstance::CredentialList do
  before do
    Twiliodeck.activate
  end

  after do
    Twiliodeck.deactivate
  end

  context "should read credentials" do
    it "and return 200" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').sip.credential_lists.get('CLaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').credentials.list() }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::Client.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      expect { client.accounts.get('ACllllllllllllllllllllllllllllllll').sip.credential_lists.get('CLllllllllllllllllllllllllllllllll').credentials.list() }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::Client.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      expect { client.accounts.get('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').sip.credential_lists.get('CLkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').credentials.list() }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::Client.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      expect { client.accounts.get('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').sip.credential_lists.get('CLmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').credentials.list() }.to raise_error Twilio::REST::RequestError
    end
  end

  context "should create credentials" do
    it "and return 200" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').sip.credential_lists.get('CLaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').credentials.create(password: 'password', username: 'username') }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::Client.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      expect { client.accounts.get('ACllllllllllllllllllllllllllllllll').sip.credential_lists.get('CLllllllllllllllllllllllllllllllll').credentials.create(password: 'password', username: 'username') }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::Client.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      expect { client.accounts.get('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').sip.credential_lists.get('CLkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').credentials.create(password: 'password', username: 'username') }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::Client.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      expect { client.accounts.get('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').sip.credential_lists.get('CLmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').credentials.create(password: 'password', username: 'username') }.to raise_error Twilio::REST::RequestError
    end
  end

  context "should fetch credentials" do
    it "and return 200" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').sip.credential_lists.get('CLaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').credentials.get('CRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.sid }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::Client.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      resource = client.accounts.get('ACllllllllllllllllllllllllllllllll').sip.credential_lists.get('CLllllllllllllllllllllllllllllllll').credentials.get('CRllllllllllllllllllllllllllllllll')
      expect { resource.sid }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::Client.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      resource = client.accounts.get('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').sip.credential_lists.get('CLkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').credentials.get('CRkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk')
      expect { resource.sid }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::Client.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      resource = client.accounts.get('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').sip.credential_lists.get('CLmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').credentials.get('CRmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm')
      expect { resource.sid }.to raise_error Twilio::REST::RequestError
    end
  end
end

describe Twilio::Resources::V2010::AccountInstance::SipList::CredentialListInstance::CredentialInstance do
  before do
    Twiliodeck.activate
  end

  after do
    Twiliodeck.deactivate
  end

  context "should update credentials" do
    it "and return 200" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').sip.credential_lists.get('CLaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').credentials.get('CRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.update(password: 'password', username: 'username') }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::Client.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      resource = client.accounts.get('ACllllllllllllllllllllllllllllllll').sip.credential_lists.get('CLllllllllllllllllllllllllllllllll').credentials.get('CRllllllllllllllllllllllllllllllll')
      expect { resource.update(password: 'password', username: 'username') }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::Client.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      resource = client.accounts.get('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').sip.credential_lists.get('CLkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').credentials.get('CRkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk')
      expect { resource.update(password: 'password', username: 'username') }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::Client.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      resource = client.accounts.get('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').sip.credential_lists.get('CLmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').credentials.get('CRmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm')
      expect { resource.update(password: 'password', username: 'username') }.to raise_error Twilio::REST::RequestError
    end
  end

  context "should delete credentials" do
    it "and return 204" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').sip.credential_lists.get('CLaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').credentials.get('CRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.delete }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::Client.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      resource = client.accounts.get('ACllllllllllllllllllllllllllllllll').sip.credential_lists.get('CLllllllllllllllllllllllllllllllll').credentials.get('CRllllllllllllllllllllllllllllllll')
      expect { resource.delete }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::Client.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      resource = client.accounts.get('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').sip.credential_lists.get('CLkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').credentials.get('CRkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk')
      expect { resource.delete }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::Client.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      resource = client.accounts.get('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').sip.credential_lists.get('CLmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').credentials.get('CRmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm')
      expect { resource.delete }.to raise_error Twilio::REST::RequestError
    end
  end
end