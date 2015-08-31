require 'spec_helper'

describe Twilio::Resources::Monitor::EventList do
  before do
    Twiliodeck.activate
  end

  after do
    Twiliodeck.deactivate
  end

  context "should fetch events" do
    it "and return 200" do
      client = Twilio::REST::MonitorClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      resource = client.events.get('AEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.sid }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::MonitorClient.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      resource = client.events.get('AEllllllllllllllllllllllllllllllll')
      expect { resource.sid }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::MonitorClient.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      resource = client.events.get('AEkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk')
      expect { resource.sid }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::MonitorClient.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      resource = client.events.get('AEmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm')
      expect { resource.sid }.to raise_error Twilio::REST::RequestError
    end
  end

  context "should read events" do
    it "and return 200" do
      client = Twilio::REST::MonitorClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      expect { client.events.list(:'ActorSid' => 'actor_sid', :'EndDate' => 'end_date', :'EventType' => 'event_type', :'ResourceSid' => 'resource_sid', :'SourceIpAddress' => 'source_ip_address', :'StartDate' => 'start_date') }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::MonitorClient.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      expect { client.events.list(:'ActorSid' => 'actor_sid', :'EndDate' => 'end_date', :'EventType' => 'event_type', :'ResourceSid' => 'resource_sid', :'SourceIpAddress' => 'source_ip_address', :'StartDate' => 'start_date') }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::MonitorClient.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      expect { client.events.list(:'ActorSid' => 'actor_sid', :'EndDate' => 'end_date', :'EventType' => 'event_type', :'ResourceSid' => 'resource_sid', :'SourceIpAddress' => 'source_ip_address', :'StartDate' => 'start_date') }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::MonitorClient.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      expect { client.events.list(:'ActorSid' => 'actor_sid', :'EndDate' => 'end_date', :'EventType' => 'event_type', :'ResourceSid' => 'resource_sid', :'SourceIpAddress' => 'source_ip_address', :'StartDate' => 'start_date') }.to raise_error Twilio::REST::RequestError
    end
  end
end