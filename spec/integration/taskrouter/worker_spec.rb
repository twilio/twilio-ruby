require 'spec_helper'

describe Twilio::Resources::Taskrouter::WorkspaceInstance::WorkerList do
  before do
    Twiliodeck.activate
  end

  after do
    Twiliodeck.deactivate
  end

  context "should read workers" do
    it "and return 200" do
      client = Twilio::REST::TaskrouterClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      expect { client.workspaces.get('WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').workers.list(:'ActivityName' => 'activity_name', :'ActivitySid' => 'activity_sid', :'Available' => 'available', :'FriendlyName' => 'friendly_name', :'TargetWorkersExpression' => 'target_workers_expression', :'TaskQueueName' => 'task_queue_name', :'TaskQueueSid' => 'task_queue_sid') }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::TaskrouterClient.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      expect { client.workspaces.get('WSllllllllllllllllllllllllllllllll').workers.list(:'ActivityName' => 'activity_name', :'ActivitySid' => 'activity_sid', :'Available' => 'available', :'FriendlyName' => 'friendly_name', :'TargetWorkersExpression' => 'target_workers_expression', :'TaskQueueName' => 'task_queue_name', :'TaskQueueSid' => 'task_queue_sid') }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::TaskrouterClient.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      expect { client.workspaces.get('WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').workers.list(:'ActivityName' => 'activity_name', :'ActivitySid' => 'activity_sid', :'Available' => 'available', :'FriendlyName' => 'friendly_name', :'TargetWorkersExpression' => 'target_workers_expression', :'TaskQueueName' => 'task_queue_name', :'TaskQueueSid' => 'task_queue_sid') }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::TaskrouterClient.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      expect { client.workspaces.get('WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').workers.list(:'ActivityName' => 'activity_name', :'ActivitySid' => 'activity_sid', :'Available' => 'available', :'FriendlyName' => 'friendly_name', :'TargetWorkersExpression' => 'target_workers_expression', :'TaskQueueName' => 'task_queue_name', :'TaskQueueSid' => 'task_queue_sid') }.to raise_error Twilio::REST::RequestError
    end
  end

  context "should create workers" do
    it "and return 200" do
      client = Twilio::REST::TaskrouterClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      expect { client.workspaces.get('WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').workers.create(:'ActivitySid' => 'activity_sid', :'Attributes' => 'attributes', :'FriendlyName' => 'friendly_name') }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::TaskrouterClient.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      expect { client.workspaces.get('WSllllllllllllllllllllllllllllllll').workers.create(:'ActivitySid' => 'activity_sid', :'Attributes' => 'attributes', :'FriendlyName' => 'friendly_name') }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::TaskrouterClient.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      expect { client.workspaces.get('WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').workers.create(:'ActivitySid' => 'activity_sid', :'Attributes' => 'attributes', :'FriendlyName' => 'friendly_name') }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::TaskrouterClient.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      expect { client.workspaces.get('WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').workers.create(:'ActivitySid' => 'activity_sid', :'Attributes' => 'attributes', :'FriendlyName' => 'friendly_name') }.to raise_error Twilio::REST::RequestError
    end
  end

  context "should fetch workers" do
    it "and return 200" do
      client = Twilio::REST::TaskrouterClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      resource = client.workspaces.get('WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').workers.get('WKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.sid }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::TaskrouterClient.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      resource = client.workspaces.get('WSllllllllllllllllllllllllllllllll').workers.get('WKllllllllllllllllllllllllllllllll')
      expect { resource.sid }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::TaskrouterClient.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      resource = client.workspaces.get('WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').workers.get('WKkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk')
      expect { resource.sid }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::TaskrouterClient.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      resource = client.workspaces.get('WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').workers.get('WKmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm')
      expect { resource.sid }.to raise_error Twilio::REST::RequestError
    end
  end
end

describe Twilio::Resources::Taskrouter::WorkspaceInstance::WorkerInstance do
  before do
    Twiliodeck.activate
  end

  after do
    Twiliodeck.deactivate
  end

  context "should update workers" do
    it "and return 200" do
      client = Twilio::REST::TaskrouterClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      resource = client.workspaces.get('WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').workers.get('WKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.update(:'ActivitySid' => 'activity_sid', :'Attributes' => 'attributes', :'FriendlyName' => 'friendly_name') }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::TaskrouterClient.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      resource = client.workspaces.get('WSllllllllllllllllllllllllllllllll').workers.get('WKllllllllllllllllllllllllllllllll')
      expect { resource.update(:'ActivitySid' => 'activity_sid', :'Attributes' => 'attributes', :'FriendlyName' => 'friendly_name') }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::TaskrouterClient.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      resource = client.workspaces.get('WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').workers.get('WKkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk')
      expect { resource.update(:'ActivitySid' => 'activity_sid', :'Attributes' => 'attributes', :'FriendlyName' => 'friendly_name') }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::TaskrouterClient.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      resource = client.workspaces.get('WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').workers.get('WKmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm')
      expect { resource.update(:'ActivitySid' => 'activity_sid', :'Attributes' => 'attributes', :'FriendlyName' => 'friendly_name') }.to raise_error Twilio::REST::RequestError
    end
  end

  context "should delete workers" do
    it "and return 204" do
      client = Twilio::REST::TaskrouterClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      resource = client.workspaces.get('WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').workers.get('WKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.delete }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::TaskrouterClient.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      resource = client.workspaces.get('WSllllllllllllllllllllllllllllllll').workers.get('WKllllllllllllllllllllllllllllllll')
      expect { resource.delete }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::TaskrouterClient.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      resource = client.workspaces.get('WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').workers.get('WKkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk')
      expect { resource.delete }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::TaskrouterClient.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      resource = client.workspaces.get('WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').workers.get('WKmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm')
      expect { resource.delete }.to raise_error Twilio::REST::RequestError
    end
  end
end