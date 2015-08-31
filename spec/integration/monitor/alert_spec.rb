require 'spec_helper'

describe Twilio::Resources::Monitor::AlertList do
  before do
    Twiliodeck.activate
  end

  after do
    Twiliodeck.deactivate
  end

  context "should fetch alerts" do
    it "and return 200" do
      client = Twilio::REST::MonitorClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      resource = client.alerts.get('NOaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.sid }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::MonitorClient.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      resource = client.alerts.get('NOllllllllllllllllllllllllllllllll')
      expect { resource.sid }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::MonitorClient.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      resource = client.alerts.get('NOkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk')
      expect { resource.sid }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::MonitorClient.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      resource = client.alerts.get('NOmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm')
      expect { resource.sid }.to raise_error Twilio::REST::RequestError
    end
  end

  context "should read alerts" do
    it "and return 200" do
      client = Twilio::REST::MonitorClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      expect { client.alerts.list(:'EndDate' => 'end_date', :'LogLevel' => 'log_level', :'StartDate' => 'start_date') }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::MonitorClient.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      expect { client.alerts.list(:'EndDate' => 'end_date', :'LogLevel' => 'log_level', :'StartDate' => 'start_date') }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::MonitorClient.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      expect { client.alerts.list(:'EndDate' => 'end_date', :'LogLevel' => 'log_level', :'StartDate' => 'start_date') }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::MonitorClient.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      expect { client.alerts.list(:'EndDate' => 'end_date', :'LogLevel' => 'log_level', :'StartDate' => 'start_date') }.to raise_error Twilio::REST::RequestError
    end
  end
end

describe Twilio::Resources::Monitor::AlertInstance do
  before do
    Twiliodeck.activate
  end

  after do
    Twiliodeck.deactivate
  end

  context "should delete alerts" do
    it "and return 204" do
      client = Twilio::REST::MonitorClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      resource = client.alerts.get('NOaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.delete }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::MonitorClient.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      resource = client.alerts.get('NOllllllllllllllllllllllllllllllll')
      expect { resource.delete }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::MonitorClient.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      resource = client.alerts.get('NOkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk')
      expect { resource.delete }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::MonitorClient.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      resource = client.alerts.get('NOmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm')
      expect { resource.delete }.to raise_error Twilio::REST::RequestError
    end
  end
end