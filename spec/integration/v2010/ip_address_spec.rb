require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::SipList::IpAccessControlListInstance::IpAddressList do
  before do
    Twiliodeck.activate
  end

  after do
    Twiliodeck.deactivate
  end

  context "should read ip_addresses" do
    it "and return 200" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').sip.ip_access_control_lists.get('ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').ip_addresses.list() }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::Client.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      expect { client.accounts.get('ACllllllllllllllllllllllllllllllll').sip.ip_access_control_lists.get('ALllllllllllllllllllllllllllllllll').ip_addresses.list() }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::Client.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      expect { client.accounts.get('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').sip.ip_access_control_lists.get('ALkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').ip_addresses.list() }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::Client.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      expect { client.accounts.get('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').sip.ip_access_control_lists.get('ALmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').ip_addresses.list() }.to raise_error Twilio::REST::RequestError
    end
  end

  context "should create ip_addresses" do
    it "and return 200" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').sip.ip_access_control_lists.get('ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').ip_addresses.create(:'FriendlyName' => 'friendly_name', :'IpAddress' => 'ip_address') }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::Client.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      expect { client.accounts.get('ACllllllllllllllllllllllllllllllll').sip.ip_access_control_lists.get('ALllllllllllllllllllllllllllllllll').ip_addresses.create(:'FriendlyName' => 'friendly_name', :'IpAddress' => 'ip_address') }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::Client.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      expect { client.accounts.get('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').sip.ip_access_control_lists.get('ALkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').ip_addresses.create(:'FriendlyName' => 'friendly_name', :'IpAddress' => 'ip_address') }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::Client.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      expect { client.accounts.get('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').sip.ip_access_control_lists.get('ALmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').ip_addresses.create(:'FriendlyName' => 'friendly_name', :'IpAddress' => 'ip_address') }.to raise_error Twilio::REST::RequestError
    end
  end

  context "should fetch ip_addresses" do
    it "and return 200" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').sip.ip_access_control_lists.get('ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').ip_addresses.get('IPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.sid }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::Client.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      resource = client.accounts.get('ACllllllllllllllllllllllllllllllll').sip.ip_access_control_lists.get('ALllllllllllllllllllllllllllllllll').ip_addresses.get('IPllllllllllllllllllllllllllllllll')
      expect { resource.sid }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::Client.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      resource = client.accounts.get('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').sip.ip_access_control_lists.get('ALkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').ip_addresses.get('IPkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk')
      expect { resource.sid }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::Client.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      resource = client.accounts.get('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').sip.ip_access_control_lists.get('ALmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').ip_addresses.get('IPmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm')
      expect { resource.sid }.to raise_error Twilio::REST::RequestError
    end
  end
end

describe Twilio::Resources::V2010::AccountInstance::SipList::IpAccessControlListInstance::IpAddressInstance do
  before do
    Twiliodeck.activate
  end

  after do
    Twiliodeck.deactivate
  end

  context "should update ip_addresses" do
    it "and return 200" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').sip.ip_access_control_lists.get('ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').ip_addresses.get('IPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.update(:'IpAddress' => 'ip_address') }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::Client.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      resource = client.accounts.get('ACllllllllllllllllllllllllllllllll').sip.ip_access_control_lists.get('ALllllllllllllllllllllllllllllllll').ip_addresses.get('IPllllllllllllllllllllllllllllllll')
      expect { resource.update(:'IpAddress' => 'ip_address') }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::Client.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      resource = client.accounts.get('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').sip.ip_access_control_lists.get('ALkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').ip_addresses.get('IPkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk')
      expect { resource.update(:'IpAddress' => 'ip_address') }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::Client.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      resource = client.accounts.get('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').sip.ip_access_control_lists.get('ALmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').ip_addresses.get('IPmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm')
      expect { resource.update(:'IpAddress' => 'ip_address') }.to raise_error Twilio::REST::RequestError
    end
  end

  context "should delete ip_addresses" do
    it "and return 204" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').sip.ip_access_control_lists.get('ALaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').ip_addresses.get('IPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.delete }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::Client.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      resource = client.accounts.get('ACllllllllllllllllllllllllllllllll').sip.ip_access_control_lists.get('ALllllllllllllllllllllllllllllllll').ip_addresses.get('IPllllllllllllllllllllllllllllllll')
      expect { resource.delete }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::Client.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      resource = client.accounts.get('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').sip.ip_access_control_lists.get('ALkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').ip_addresses.get('IPkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk')
      expect { resource.delete }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::Client.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      resource = client.accounts.get('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').sip.ip_access_control_lists.get('ALmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').ip_addresses.get('IPmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm')
      expect { resource.delete }.to raise_error Twilio::REST::RequestError
    end
  end
end