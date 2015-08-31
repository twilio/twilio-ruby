require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::ConnectAppList do
  before do
    Twiliodeck.activate
  end

  after do
    Twiliodeck.deactivate
  end

  context "should fetch connect_apps" do
    it "and return 200" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').connect_apps.get('CNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.sid }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::Client.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      resource = client.accounts.get('ACllllllllllllllllllllllllllllllll').connect_apps.get('CNllllllllllllllllllllllllllllllll')
      expect { resource.sid }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::Client.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      resource = client.accounts.get('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').connect_apps.get('CNkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk')
      expect { resource.sid }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::Client.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      resource = client.accounts.get('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').connect_apps.get('CNmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm')
      expect { resource.sid }.to raise_error Twilio::REST::RequestError
    end
  end

  context "should read connect_apps" do
    it "and return 200" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').connect_apps.list() }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::Client.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      expect { client.accounts.get('ACllllllllllllllllllllllllllllllll').connect_apps.list() }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::Client.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      expect { client.accounts.get('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').connect_apps.list() }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::Client.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      expect { client.accounts.get('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').connect_apps.list() }.to raise_error Twilio::REST::RequestError
    end
  end
end

describe Twilio::Resources::V2010::AccountInstance::ConnectAppInstance do
  before do
    Twiliodeck.activate
  end

  after do
    Twiliodeck.deactivate
  end

  context "should update connect_apps" do
    it "and return 200" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').connect_apps.get('CNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.update(:'AuthorizeRedirectUrl' => "https://example.com", :'CompanyName' => 'company_name', :'DeauthorizeCallbackMethod' => "GET", :'DeauthorizeCallbackUrl' => "https://example.com", :'Description' => 'description', :'FriendlyName' => 'friendly_name', :'HomepageUrl' => "https://example.com", :'Permissions' => 'permissions') }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::Client.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      resource = client.accounts.get('ACllllllllllllllllllllllllllllllll').connect_apps.get('CNllllllllllllllllllllllllllllllll')
      expect { resource.update(:'AuthorizeRedirectUrl' => "https://example.com", :'CompanyName' => 'company_name', :'DeauthorizeCallbackMethod' => "GET", :'DeauthorizeCallbackUrl' => "https://example.com", :'Description' => 'description', :'FriendlyName' => 'friendly_name', :'HomepageUrl' => "https://example.com", :'Permissions' => 'permissions') }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::Client.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      resource = client.accounts.get('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').connect_apps.get('CNkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk')
      expect { resource.update(:'AuthorizeRedirectUrl' => "https://example.com", :'CompanyName' => 'company_name', :'DeauthorizeCallbackMethod' => "GET", :'DeauthorizeCallbackUrl' => "https://example.com", :'Description' => 'description', :'FriendlyName' => 'friendly_name', :'HomepageUrl' => "https://example.com", :'Permissions' => 'permissions') }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::Client.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      resource = client.accounts.get('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').connect_apps.get('CNmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm')
      expect { resource.update(:'AuthorizeRedirectUrl' => "https://example.com", :'CompanyName' => 'company_name', :'DeauthorizeCallbackMethod' => "GET", :'DeauthorizeCallbackUrl' => "https://example.com", :'Description' => 'description', :'FriendlyName' => 'friendly_name', :'HomepageUrl' => "https://example.com", :'Permissions' => 'permissions') }.to raise_error Twilio::REST::RequestError
    end
  end
end