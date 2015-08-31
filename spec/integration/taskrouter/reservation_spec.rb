require 'spec_helper'

describe Twilio::Resources::Taskrouter::WorkspaceInstance::TaskInstance::ReservationList do
  before do
    Twiliodeck.activate
  end

  after do
    Twiliodeck.deactivate
  end

  context "should read reservations" do
    it "and return 200" do
      client = Twilio::REST::TaskrouterClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      expect { client.workspaces.get('WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').tasks.get('WTaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').reservations.list() }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::TaskrouterClient.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      expect { client.workspaces.get('WSllllllllllllllllllllllllllllllll').tasks.get('WTllllllllllllllllllllllllllllllll').reservations.list() }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::TaskrouterClient.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      expect { client.workspaces.get('WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').tasks.get('WTkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').reservations.list() }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::TaskrouterClient.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      expect { client.workspaces.get('WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').tasks.get('WTmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').reservations.list() }.to raise_error Twilio::REST::RequestError
    end
  end

  context "should fetch reservations" do
    it "and return 200" do
      client = Twilio::REST::TaskrouterClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      resource = client.workspaces.get('WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').tasks.get('WTaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').reservations.get('WRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.sid }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::TaskrouterClient.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      resource = client.workspaces.get('WSllllllllllllllllllllllllllllllll').tasks.get('WTllllllllllllllllllllllllllllllll').reservations.get('WRllllllllllllllllllllllllllllllll')
      expect { resource.sid }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::TaskrouterClient.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      resource = client.workspaces.get('WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').tasks.get('WTkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').reservations.get('WRkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk')
      expect { resource.sid }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::TaskrouterClient.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      resource = client.workspaces.get('WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').tasks.get('WTmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').reservations.get('WRmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm')
      expect { resource.sid }.to raise_error Twilio::REST::RequestError
    end
  end
end

describe Twilio::Resources::Taskrouter::WorkspaceInstance::TaskInstance::ReservationInstance do
  before do
    Twiliodeck.activate
  end

  after do
    Twiliodeck.deactivate
  end

  context "should update reservations" do
    it "and return 200" do
      client = Twilio::REST::TaskrouterClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      resource = client.workspaces.get('WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').tasks.get('WTaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').reservations.get('WRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.update(:'ReservationStatus' => 'reservation_status', :'WorkerActivitySid' => 'worker_activity_sid') }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::TaskrouterClient.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      resource = client.workspaces.get('WSllllllllllllllllllllllllllllllll').tasks.get('WTllllllllllllllllllllllllllllllll').reservations.get('WRllllllllllllllllllllllllllllllll')
      expect { resource.update(:'ReservationStatus' => 'reservation_status', :'WorkerActivitySid' => 'worker_activity_sid') }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::TaskrouterClient.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      resource = client.workspaces.get('WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').tasks.get('WTkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').reservations.get('WRkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk')
      expect { resource.update(:'ReservationStatus' => 'reservation_status', :'WorkerActivitySid' => 'worker_activity_sid') }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::TaskrouterClient.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      resource = client.workspaces.get('WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').tasks.get('WTmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').reservations.get('WRmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm')
      expect { resource.update(:'ReservationStatus' => 'reservation_status', :'WorkerActivitySid' => 'worker_activity_sid') }.to raise_error Twilio::REST::RequestError
    end
  end
end