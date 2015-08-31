require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::SipList::DomainInstance::IpAccessControlListMappingList do
  before do
    Twiliodeck.activate
  end

  after do
    Twiliodeck.deactivate
  end

  context "should fetch ip_access_control_list_mappings" do
    it "and return 200" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').sip.domains.get('SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').ip_access_control_list_mappings.get('ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.sid }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::Client.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      resource = client.accounts.get('ACllllllllllllllllllllllllllllllll').sip.domains.get('SDllllllllllllllllllllllllllllllll').ip_access_control_list_mappings.get('ALllllllllllllllllllllllllllllllll')
      expect { resource.sid }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::Client.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      resource = client.accounts.get('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').sip.domains.get('SDkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').ip_access_control_list_mappings.get('ALkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk')
      expect { resource.sid }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::Client.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      resource = client.accounts.get('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').sip.domains.get('SDmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').ip_access_control_list_mappings.get('ALmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm')
      expect { resource.sid }.to raise_error Twilio::REST::RequestError
    end
  end

  context "should create ip_access_control_list_mappings" do
    it "and return 200" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').sip.domains.get('SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').ip_access_control_list_mappings.create(:'IpAccessControlListSid' => 'ip_access_control_list_sid') }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::Client.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      expect { client.accounts.get('ACllllllllllllllllllllllllllllllll').sip.domains.get('SDllllllllllllllllllllllllllllllll').ip_access_control_list_mappings.create(:'IpAccessControlListSid' => 'ip_access_control_list_sid') }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::Client.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      expect { client.accounts.get('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').sip.domains.get('SDkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').ip_access_control_list_mappings.create(:'IpAccessControlListSid' => 'ip_access_control_list_sid') }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::Client.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      expect { client.accounts.get('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').sip.domains.get('SDmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').ip_access_control_list_mappings.create(:'IpAccessControlListSid' => 'ip_access_control_list_sid') }.to raise_error Twilio::REST::RequestError
    end
  end

  context "should read ip_access_control_list_mappings" do
    it "and return 200" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').sip.domains.get('SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').ip_access_control_list_mappings.list() }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::Client.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      expect { client.accounts.get('ACllllllllllllllllllllllllllllllll').sip.domains.get('SDllllllllllllllllllllllllllllllll').ip_access_control_list_mappings.list() }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::Client.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      expect { client.accounts.get('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').sip.domains.get('SDkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').ip_access_control_list_mappings.list() }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::Client.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      expect { client.accounts.get('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').sip.domains.get('SDmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').ip_access_control_list_mappings.list() }.to raise_error Twilio::REST::RequestError
    end
  end
end

describe Twilio::Resources::V2010::AccountInstance::SipList::DomainInstance::IpAccessControlListMappingInstance do
  before do
    Twiliodeck.activate
  end

  after do
    Twiliodeck.deactivate
  end

  context "should delete ip_access_control_list_mappings" do
    it "and return 204" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').sip.domains.get('SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').ip_access_control_list_mappings.get('ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.delete }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::Client.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      resource = client.accounts.get('ACllllllllllllllllllllllllllllllll').sip.domains.get('SDllllllllllllllllllllllllllllllll').ip_access_control_list_mappings.get('ALllllllllllllllllllllllllllllllll')
      expect { resource.delete }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::Client.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      resource = client.accounts.get('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').sip.domains.get('SDkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').ip_access_control_list_mappings.get('ALkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk')
      expect { resource.delete }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::Client.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      resource = client.accounts.get('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').sip.domains.get('SDmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').ip_access_control_list_mappings.get('ALmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm')
      expect { resource.delete }.to raise_error Twilio::REST::RequestError
    end
  end
end