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
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').applications.create(:'ApiVersion' => 'api_version', :'FriendlyName' => 'friendly_name', :'MessageStatusCallback' => "https://example.com", :'SmsFallbackMethod' => "GET", :'SmsFallbackUrl' => "https://example.com", :'SmsMethod' => "GET", :'SmsStatusCallback' => "https://example.com", :'SmsUrl' => "https://example.com", :'StatusCallback' => "https://example.com", :'StatusCallbackMethod' => "GET", :'VoiceCallerIdLookup' => true, :'VoiceFallbackMethod' => "GET", :'VoiceFallbackUrl' => "https://example.com", :'VoiceMethod' => "GET", :'VoiceUrl' => "https://example.com") }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::Client.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      expect { client.accounts.get('ACllllllllllllllllllllllllllllllll').applications.create(:'ApiVersion' => 'api_version', :'FriendlyName' => 'friendly_name', :'MessageStatusCallback' => "https://example.com", :'SmsFallbackMethod' => "GET", :'SmsFallbackUrl' => "https://example.com", :'SmsMethod' => "GET", :'SmsStatusCallback' => "https://example.com", :'SmsUrl' => "https://example.com", :'StatusCallback' => "https://example.com", :'StatusCallbackMethod' => "GET", :'VoiceCallerIdLookup' => true, :'VoiceFallbackMethod' => "GET", :'VoiceFallbackUrl' => "https://example.com", :'VoiceMethod' => "GET", :'VoiceUrl' => "https://example.com") }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::Client.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      expect { client.accounts.get('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').applications.create(:'ApiVersion' => 'api_version', :'FriendlyName' => 'friendly_name', :'MessageStatusCallback' => "https://example.com", :'SmsFallbackMethod' => "GET", :'SmsFallbackUrl' => "https://example.com", :'SmsMethod' => "GET", :'SmsStatusCallback' => "https://example.com", :'SmsUrl' => "https://example.com", :'StatusCallback' => "https://example.com", :'StatusCallbackMethod' => "GET", :'VoiceCallerIdLookup' => true, :'VoiceFallbackMethod' => "GET", :'VoiceFallbackUrl' => "https://example.com", :'VoiceMethod' => "GET", :'VoiceUrl' => "https://example.com") }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::Client.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      expect { client.accounts.get('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').applications.create(:'ApiVersion' => 'api_version', :'FriendlyName' => 'friendly_name', :'MessageStatusCallback' => "https://example.com", :'SmsFallbackMethod' => "GET", :'SmsFallbackUrl' => "https://example.com", :'SmsMethod' => "GET", :'SmsStatusCallback' => "https://example.com", :'SmsUrl' => "https://example.com", :'StatusCallback' => "https://example.com", :'StatusCallbackMethod' => "GET", :'VoiceCallerIdLookup' => true, :'VoiceFallbackMethod' => "GET", :'VoiceFallbackUrl' => "https://example.com", :'VoiceMethod' => "GET", :'VoiceUrl' => "https://example.com") }.to raise_error Twilio::REST::RequestError
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
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').applications.list(:'FriendlyName' => 'friendly_name') }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::Client.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      expect { client.accounts.get('ACllllllllllllllllllllllllllllllll').applications.list(:'FriendlyName' => 'friendly_name') }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::Client.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      expect { client.accounts.get('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').applications.list(:'FriendlyName' => 'friendly_name') }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::Client.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      expect { client.accounts.get('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').applications.list(:'FriendlyName' => 'friendly_name') }.to raise_error Twilio::REST::RequestError
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
      expect { resource.update(:'ApiVersion' => 'api_version', :'FriendlyName' => 'friendly_name', :'MessageStatusCallback' => "https://example.com", :'SmsFallbackMethod' => "GET", :'SmsFallbackUrl' => "https://example.com", :'SmsMethod' => "GET", :'SmsStatusCallback' => "https://example.com", :'SmsUrl' => "https://example.com", :'StatusCallback' => "https://example.com", :'StatusCallbackMethod' => "GET", :'VoiceCallerIdLookup' => true, :'VoiceFallbackMethod' => "GET", :'VoiceFallbackUrl' => "https://example.com", :'VoiceMethod' => "GET", :'VoiceUrl' => "https://example.com") }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::Client.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      resource = client.accounts.get('ACllllllllllllllllllllllllllllllll').applications.get('APllllllllllllllllllllllllllllllll')
      expect { resource.update(:'ApiVersion' => 'api_version', :'FriendlyName' => 'friendly_name', :'MessageStatusCallback' => "https://example.com", :'SmsFallbackMethod' => "GET", :'SmsFallbackUrl' => "https://example.com", :'SmsMethod' => "GET", :'SmsStatusCallback' => "https://example.com", :'SmsUrl' => "https://example.com", :'StatusCallback' => "https://example.com", :'StatusCallbackMethod' => "GET", :'VoiceCallerIdLookup' => true, :'VoiceFallbackMethod' => "GET", :'VoiceFallbackUrl' => "https://example.com", :'VoiceMethod' => "GET", :'VoiceUrl' => "https://example.com") }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::Client.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      resource = client.accounts.get('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').applications.get('APkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk')
      expect { resource.update(:'ApiVersion' => 'api_version', :'FriendlyName' => 'friendly_name', :'MessageStatusCallback' => "https://example.com", :'SmsFallbackMethod' => "GET", :'SmsFallbackUrl' => "https://example.com", :'SmsMethod' => "GET", :'SmsStatusCallback' => "https://example.com", :'SmsUrl' => "https://example.com", :'StatusCallback' => "https://example.com", :'StatusCallbackMethod' => "GET", :'VoiceCallerIdLookup' => true, :'VoiceFallbackMethod' => "GET", :'VoiceFallbackUrl' => "https://example.com", :'VoiceMethod' => "GET", :'VoiceUrl' => "https://example.com") }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::Client.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      resource = client.accounts.get('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').applications.get('APmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm')
      expect { resource.update(:'ApiVersion' => 'api_version', :'FriendlyName' => 'friendly_name', :'MessageStatusCallback' => "https://example.com", :'SmsFallbackMethod' => "GET", :'SmsFallbackUrl' => "https://example.com", :'SmsMethod' => "GET", :'SmsStatusCallback' => "https://example.com", :'SmsUrl' => "https://example.com", :'StatusCallback' => "https://example.com", :'StatusCallbackMethod' => "GET", :'VoiceCallerIdLookup' => true, :'VoiceFallbackMethod' => "GET", :'VoiceFallbackUrl' => "https://example.com", :'VoiceMethod' => "GET", :'VoiceUrl' => "https://example.com") }.to raise_error Twilio::REST::RequestError
    end
  end
end