require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::ApplicationList do
  before do
    Twiliodeck.activate
  end

  after do
    Twiliodeck.deactivate
  end

  context "should create applications" do
    it "and return 200" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').applications.create(api_version: 'api_version', friendly_name: 'friendly_name', voice_fallback_method: "GET", voice_fallback_url: "https://example.com", sms_method: "GET", status_callback_method: "GET", sms_url: "https://example.com", voice_url: "https://example.com", sms_fallback_method: "GET", voice_caller_id_lookup: true, message_status_callback: "https://example.com", voice_method: "GET", sms_status_callback: "https://example.com", sms_fallback_url: "https://example.com", status_callback: "https://example.com") }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::Client.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      expect { client.accounts.get('ACllllllllllllllllllllllllllllllll').applications.create(api_version: 'api_version', friendly_name: 'friendly_name', voice_fallback_method: "GET", voice_fallback_url: "https://example.com", sms_method: "GET", status_callback_method: "GET", sms_url: "https://example.com", voice_url: "https://example.com", sms_fallback_method: "GET", voice_caller_id_lookup: true, message_status_callback: "https://example.com", voice_method: "GET", sms_status_callback: "https://example.com", sms_fallback_url: "https://example.com", status_callback: "https://example.com") }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::Client.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      expect { client.accounts.get('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').applications.create(api_version: 'api_version', friendly_name: 'friendly_name', voice_fallback_method: "GET", voice_fallback_url: "https://example.com", sms_method: "GET", status_callback_method: "GET", sms_url: "https://example.com", voice_url: "https://example.com", sms_fallback_method: "GET", voice_caller_id_lookup: true, message_status_callback: "https://example.com", voice_method: "GET", sms_status_callback: "https://example.com", sms_fallback_url: "https://example.com", status_callback: "https://example.com") }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::Client.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      expect { client.accounts.get('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').applications.create(api_version: 'api_version', friendly_name: 'friendly_name', voice_fallback_method: "GET", voice_fallback_url: "https://example.com", sms_method: "GET", status_callback_method: "GET", sms_url: "https://example.com", voice_url: "https://example.com", sms_fallback_method: "GET", voice_caller_id_lookup: true, message_status_callback: "https://example.com", voice_method: "GET", sms_status_callback: "https://example.com", sms_fallback_url: "https://example.com", status_callback: "https://example.com") }.to raise_error Twilio::REST::RequestError
    end
  end

  context "should fetch applications" do
    it "and return 200" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').applications.get('APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.sid }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::Client.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      resource = client.accounts.get('ACllllllllllllllllllllllllllllllll').applications.get('APllllllllllllllllllllllllllllllll')
      expect { resource.sid }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::Client.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      resource = client.accounts.get('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').applications.get('APkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk')
      expect { resource.sid }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::Client.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      resource = client.accounts.get('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').applications.get('APmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm')
      expect { resource.sid }.to raise_error Twilio::REST::RequestError
    end
  end

  context "should read applications" do
    it "and return 200" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').applications.list(friendly_name: 'friendly_name') }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::Client.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      expect { client.accounts.get('ACllllllllllllllllllllllllllllllll').applications.list(friendly_name: 'friendly_name') }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::Client.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      expect { client.accounts.get('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').applications.list(friendly_name: 'friendly_name') }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::Client.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      expect { client.accounts.get('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').applications.list(friendly_name: 'friendly_name') }.to raise_error Twilio::REST::RequestError
    end
  end
end

describe Twilio::Resources::V2010::AccountInstance::ApplicationInstance do
  before do
    Twiliodeck.activate
  end

  after do
    Twiliodeck.deactivate
  end

  context "should delete applications" do
    it "and return 204" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').applications.get('APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.delete }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::Client.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      resource = client.accounts.get('ACllllllllllllllllllllllllllllllll').applications.get('APllllllllllllllllllllllllllllllll')
      expect { resource.delete }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::Client.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      resource = client.accounts.get('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').applications.get('APkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk')
      expect { resource.delete }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::Client.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      resource = client.accounts.get('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').applications.get('APmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm')
      expect { resource.delete }.to raise_error Twilio::REST::RequestError
    end
  end

  context "should update applications" do
    it "and return 200" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').applications.get('APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.update(api_version: 'api_version', friendly_name: 'friendly_name', voice_fallback_method: "GET", voice_fallback_url: "https://example.com", sms_method: "GET", status_callback_method: "GET", sms_url: "https://example.com", voice_url: "https://example.com", sms_fallback_method: "GET", voice_caller_id_lookup: true, message_status_callback: "https://example.com", voice_method: "GET", sms_status_callback: "https://example.com", sms_fallback_url: "https://example.com", status_callback: "https://example.com") }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::Client.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      resource = client.accounts.get('ACllllllllllllllllllllllllllllllll').applications.get('APllllllllllllllllllllllllllllllll')
      expect { resource.update(api_version: 'api_version', friendly_name: 'friendly_name', voice_fallback_method: "GET", voice_fallback_url: "https://example.com", sms_method: "GET", status_callback_method: "GET", sms_url: "https://example.com", voice_url: "https://example.com", sms_fallback_method: "GET", voice_caller_id_lookup: true, message_status_callback: "https://example.com", voice_method: "GET", sms_status_callback: "https://example.com", sms_fallback_url: "https://example.com", status_callback: "https://example.com") }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::Client.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      resource = client.accounts.get('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').applications.get('APkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk')
      expect { resource.update(api_version: 'api_version', friendly_name: 'friendly_name', voice_fallback_method: "GET", voice_fallback_url: "https://example.com", sms_method: "GET", status_callback_method: "GET", sms_url: "https://example.com", voice_url: "https://example.com", sms_fallback_method: "GET", voice_caller_id_lookup: true, message_status_callback: "https://example.com", voice_method: "GET", sms_status_callback: "https://example.com", sms_fallback_url: "https://example.com", status_callback: "https://example.com") }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::Client.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      resource = client.accounts.get('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').applications.get('APmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm')
      expect { resource.update(api_version: 'api_version', friendly_name: 'friendly_name', voice_fallback_method: "GET", voice_fallback_url: "https://example.com", sms_method: "GET", status_callback_method: "GET", sms_url: "https://example.com", voice_url: "https://example.com", sms_fallback_method: "GET", voice_caller_id_lookup: true, message_status_callback: "https://example.com", voice_method: "GET", sms_status_callback: "https://example.com", sms_fallback_url: "https://example.com", status_callback: "https://example.com") }.to raise_error Twilio::REST::RequestError
    end
  end
end