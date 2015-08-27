require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::CallList do
  before do
    Twiliodeck.activate
  end

  after do
    Twiliodeck.deactivate
  end

  context "should create calls" do
    it "and return 200" do
      client = Twilio::REST::Client.new('CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').calls.create(status_callback: "https://example.com", fallback_method: "GET", status_callback_method: "GET", timeout: 1, to: 'to', from: 'from', url: "https://example.com", record: true, send_digits: 'send_digits', method: "GET", if_machine: 'if_machine', fallback_url: "https://example.com") }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::Client.new('CAllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      expect { client.accounts.get('ACllllllllllllllllllllllllllllllll').calls.create(status_callback: "https://example.com", fallback_method: "GET", status_callback_method: "GET", timeout: 1, to: 'to', from: 'from', url: "https://example.com", record: true, send_digits: 'send_digits', method: "GET", if_machine: 'if_machine', fallback_url: "https://example.com") }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::Client.new('CAkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      expect { client.accounts.get('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').calls.create(status_callback: "https://example.com", fallback_method: "GET", status_callback_method: "GET", timeout: 1, to: 'to', from: 'from', url: "https://example.com", record: true, send_digits: 'send_digits', method: "GET", if_machine: 'if_machine', fallback_url: "https://example.com") }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::Client.new('CAmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      expect { client.accounts.get('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').calls.create(status_callback: "https://example.com", fallback_method: "GET", status_callback_method: "GET", timeout: 1, to: 'to', from: 'from', url: "https://example.com", record: true, send_digits: 'send_digits', method: "GET", if_machine: 'if_machine', fallback_url: "https://example.com") }.to raise_error Twilio::REST::RequestError
    end
  end

  context "should fetch calls" do
    it "and return 200" do
      client = Twilio::REST::Client.new('CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').calls.get('CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.sid }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::Client.new('CAllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      resource = client.accounts.get('ACllllllllllllllllllllllllllllllll').calls.get('CAllllllllllllllllllllllllllllllll')
      expect { resource.sid }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::Client.new('CAkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      resource = client.accounts.get('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').calls.get('CAkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk')
      expect { resource.sid }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::Client.new('CAmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      resource = client.accounts.get('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').calls.get('CAmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm')
      expect { resource.sid }.to raise_error Twilio::REST::RequestError
    end
  end

  context "should read calls" do
    it "and return 200" do
      client = Twilio::REST::Client.new('CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').calls.list(start_time: 'start_time', status: 'status', to: 'to', from: 'from', parent_call_sid: 'parent_call_sid', end_time: 'end_time') }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::Client.new('CAllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      expect { client.accounts.get('ACllllllllllllllllllllllllllllllll').calls.list(start_time: 'start_time', status: 'status', to: 'to', from: 'from', parent_call_sid: 'parent_call_sid', end_time: 'end_time') }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::Client.new('CAkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      expect { client.accounts.get('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').calls.list(start_time: 'start_time', status: 'status', to: 'to', from: 'from', parent_call_sid: 'parent_call_sid', end_time: 'end_time') }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::Client.new('CAmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      expect { client.accounts.get('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').calls.list(start_time: 'start_time', status: 'status', to: 'to', from: 'from', parent_call_sid: 'parent_call_sid', end_time: 'end_time') }.to raise_error Twilio::REST::RequestError
    end
  end
end

describe Twilio::Resources::V2010::AccountInstance::CallInstance do
  before do
    Twiliodeck.activate
  end

  after do
    Twiliodeck.deactivate
  end

  context "should delete calls" do
    it "and return 204" do
      client = Twilio::REST::Client.new('CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').calls.get('CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.delete }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::Client.new('CAllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      resource = client.accounts.get('ACllllllllllllllllllllllllllllllll').calls.get('CAllllllllllllllllllllllllllllllll')
      expect { resource.delete }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::Client.new('CAkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      resource = client.accounts.get('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').calls.get('CAkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk')
      expect { resource.delete }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::Client.new('CAmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      resource = client.accounts.get('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').calls.get('CAmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm')
      expect { resource.delete }.to raise_error Twilio::REST::RequestError
    end
  end

  context "should update calls" do
    it "and return 200" do
      client = Twilio::REST::Client.new('CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').calls.get('CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.update(url: "https://example.com", status_callback: "https://example.com", fallback_method: "GET", status_callback_method: "GET", status: 'status', method: "GET", fallback_url: "https://example.com") }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::Client.new('CAllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      resource = client.accounts.get('ACllllllllllllllllllllllllllllllll').calls.get('CAllllllllllllllllllllllllllllllll')
      expect { resource.update(url: "https://example.com", status_callback: "https://example.com", fallback_method: "GET", status_callback_method: "GET", status: 'status', method: "GET", fallback_url: "https://example.com") }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::Client.new('CAkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      resource = client.accounts.get('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').calls.get('CAkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk')
      expect { resource.update(url: "https://example.com", status_callback: "https://example.com", fallback_method: "GET", status_callback_method: "GET", status: 'status', method: "GET", fallback_url: "https://example.com") }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::Client.new('CAmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      resource = client.accounts.get('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').calls.get('CAmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm')
      expect { resource.update(url: "https://example.com", status_callback: "https://example.com", fallback_method: "GET", status_callback_method: "GET", status: 'status', method: "GET", fallback_url: "https://example.com") }.to raise_error Twilio::REST::RequestError
    end
  end
end