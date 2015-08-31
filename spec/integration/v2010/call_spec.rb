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
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').calls.create(:'FallbackMethod' => "GET", :'FallbackUrl' => "https://example.com", :'From' => 'from', :'IfMachine' => 'if_machine', :'Method' => "GET", :'Record' => true, :'SendDigits' => 'send_digits', :'StatusCallback' => "https://example.com", :'StatusCallbackMethod' => "GET", :'Timeout' => 1, :'To' => 'to', :'Url' => "https://example.com") }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::Client.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      expect { client.accounts.get('ACllllllllllllllllllllllllllllllll').calls.create(:'FallbackMethod' => "GET", :'FallbackUrl' => "https://example.com", :'From' => 'from', :'IfMachine' => 'if_machine', :'Method' => "GET", :'Record' => true, :'SendDigits' => 'send_digits', :'StatusCallback' => "https://example.com", :'StatusCallbackMethod' => "GET", :'Timeout' => 1, :'To' => 'to', :'Url' => "https://example.com") }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::Client.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      expect { client.accounts.get('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').calls.create(:'FallbackMethod' => "GET", :'FallbackUrl' => "https://example.com", :'From' => 'from', :'IfMachine' => 'if_machine', :'Method' => "GET", :'Record' => true, :'SendDigits' => 'send_digits', :'StatusCallback' => "https://example.com", :'StatusCallbackMethod' => "GET", :'Timeout' => 1, :'To' => 'to', :'Url' => "https://example.com") }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::Client.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      expect { client.accounts.get('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').calls.create(:'FallbackMethod' => "GET", :'FallbackUrl' => "https://example.com", :'From' => 'from', :'IfMachine' => 'if_machine', :'Method' => "GET", :'Record' => true, :'SendDigits' => 'send_digits', :'StatusCallback' => "https://example.com", :'StatusCallbackMethod' => "GET", :'Timeout' => 1, :'To' => 'to', :'Url' => "https://example.com") }.to raise_error Twilio::REST::RequestError
    end
  end

  context "should fetch calls" do
    it "and return 200" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').calls.get('CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.sid }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::Client.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      resource = client.accounts.get('ACllllllllllllllllllllllllllllllll').calls.get('CAllllllllllllllllllllllllllllllll')
      expect { resource.sid }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::Client.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      resource = client.accounts.get('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').calls.get('CAkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk')
      expect { resource.sid }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::Client.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      resource = client.accounts.get('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').calls.get('CAmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm')
      expect { resource.sid }.to raise_error Twilio::REST::RequestError
    end
  end

  context "should read calls" do
    it "and return 200" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').calls.list(:'EndTime' => 'end_time', :'From' => 'from', :'ParentCallSid' => 'parent_call_sid', :'StartTime' => 'start_time', :'Status' => 'status', :'To' => 'to') }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::Client.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      expect { client.accounts.get('ACllllllllllllllllllllllllllllllll').calls.list(:'EndTime' => 'end_time', :'From' => 'from', :'ParentCallSid' => 'parent_call_sid', :'StartTime' => 'start_time', :'Status' => 'status', :'To' => 'to') }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::Client.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      expect { client.accounts.get('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').calls.list(:'EndTime' => 'end_time', :'From' => 'from', :'ParentCallSid' => 'parent_call_sid', :'StartTime' => 'start_time', :'Status' => 'status', :'To' => 'to') }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::Client.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      expect { client.accounts.get('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').calls.list(:'EndTime' => 'end_time', :'From' => 'from', :'ParentCallSid' => 'parent_call_sid', :'StartTime' => 'start_time', :'Status' => 'status', :'To' => 'to') }.to raise_error Twilio::REST::RequestError
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
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').calls.get('CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.delete }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::Client.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      resource = client.accounts.get('ACllllllllllllllllllllllllllllllll').calls.get('CAllllllllllllllllllllllllllllllll')
      expect { resource.delete }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::Client.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      resource = client.accounts.get('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').calls.get('CAkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk')
      expect { resource.delete }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::Client.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      resource = client.accounts.get('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').calls.get('CAmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm')
      expect { resource.delete }.to raise_error Twilio::REST::RequestError
    end
  end

  context "should update calls" do
    it "and return 200" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').calls.get('CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.update(:'FallbackMethod' => "GET", :'FallbackUrl' => "https://example.com", :'Method' => "GET", :'Status' => 'status', :'StatusCallback' => "https://example.com", :'StatusCallbackMethod' => "GET", :'Url' => "https://example.com") }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::Client.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      resource = client.accounts.get('ACllllllllllllllllllllllllllllllll').calls.get('CAllllllllllllllllllllllllllllllll')
      expect { resource.update(:'FallbackMethod' => "GET", :'FallbackUrl' => "https://example.com", :'Method' => "GET", :'Status' => 'status', :'StatusCallback' => "https://example.com", :'StatusCallbackMethod' => "GET", :'Url' => "https://example.com") }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::Client.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      resource = client.accounts.get('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').calls.get('CAkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk')
      expect { resource.update(:'FallbackMethod' => "GET", :'FallbackUrl' => "https://example.com", :'Method' => "GET", :'Status' => 'status', :'StatusCallback' => "https://example.com", :'StatusCallbackMethod' => "GET", :'Url' => "https://example.com") }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::Client.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      resource = client.accounts.get('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').calls.get('CAmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm')
      expect { resource.update(:'FallbackMethod' => "GET", :'FallbackUrl' => "https://example.com", :'Method' => "GET", :'Status' => 'status', :'StatusCallback' => "https://example.com", :'StatusCallbackMethod' => "GET", :'Url' => "https://example.com") }.to raise_error Twilio::REST::RequestError
    end
  end
end