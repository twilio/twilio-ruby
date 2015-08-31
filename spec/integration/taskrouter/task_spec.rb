require 'spec_helper'

describe Twilio::Resources::Taskrouter::WorkspaceInstance::TaskList do
  before do
    Twiliodeck.activate
  end

  after do
    Twiliodeck.deactivate
  end

  context "should fetch tasks" do
    it "and return 200" do
      client = Twilio::REST::TaskrouterClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      resource = client.workspaces.get('WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').tasks.get('WTaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.sid }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::TaskrouterClient.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      resource = client.workspaces.get('WSllllllllllllllllllllllllllllllll').tasks.get('WTllllllllllllllllllllllllllllllll')
      expect { resource.sid }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::TaskrouterClient.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      resource = client.workspaces.get('WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').tasks.get('WTkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk')
      expect { resource.sid }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::TaskrouterClient.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      resource = client.workspaces.get('WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').tasks.get('WTmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm')
      expect { resource.sid }.to raise_error Twilio::REST::RequestError
    end
  end

  context "should read tasks" do
    it "and return 200" do
      client = Twilio::REST::TaskrouterClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      expect { client.workspaces.get('WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').tasks.list(:'AssignmentStatus' => 'assignment_status', :'Priority' => 1, :'TaskQueueName' => 'task_queue_name', :'TaskQueueSid' => 'task_queue_sid', :'WorkflowName' => 'workflow_name', :'WorkflowSid' => 'workflow_sid') }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::TaskrouterClient.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      expect { client.workspaces.get('WSllllllllllllllllllllllllllllllll').tasks.list(:'AssignmentStatus' => 'assignment_status', :'Priority' => 1, :'TaskQueueName' => 'task_queue_name', :'TaskQueueSid' => 'task_queue_sid', :'WorkflowName' => 'workflow_name', :'WorkflowSid' => 'workflow_sid') }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::TaskrouterClient.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      expect { client.workspaces.get('WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').tasks.list(:'AssignmentStatus' => 'assignment_status', :'Priority' => 1, :'TaskQueueName' => 'task_queue_name', :'TaskQueueSid' => 'task_queue_sid', :'WorkflowName' => 'workflow_name', :'WorkflowSid' => 'workflow_sid') }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::TaskrouterClient.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      expect { client.workspaces.get('WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').tasks.list(:'AssignmentStatus' => 'assignment_status', :'Priority' => 1, :'TaskQueueName' => 'task_queue_name', :'TaskQueueSid' => 'task_queue_sid', :'WorkflowName' => 'workflow_name', :'WorkflowSid' => 'workflow_sid') }.to raise_error Twilio::REST::RequestError
    end
  end

  context "should create tasks" do
    it "and return 200" do
      client = Twilio::REST::TaskrouterClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      expect { client.workspaces.get('WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').tasks.create(:'Attributes' => 'attributes', :'Priority' => 1, :'Timeout' => 1, :'WorkflowSid' => 'workflow_sid') }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::TaskrouterClient.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      expect { client.workspaces.get('WSllllllllllllllllllllllllllllllll').tasks.create(:'Attributes' => 'attributes', :'Priority' => 1, :'Timeout' => 1, :'WorkflowSid' => 'workflow_sid') }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::TaskrouterClient.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      expect { client.workspaces.get('WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').tasks.create(:'Attributes' => 'attributes', :'Priority' => 1, :'Timeout' => 1, :'WorkflowSid' => 'workflow_sid') }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::TaskrouterClient.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      expect { client.workspaces.get('WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').tasks.create(:'Attributes' => 'attributes', :'Priority' => 1, :'Timeout' => 1, :'WorkflowSid' => 'workflow_sid') }.to raise_error Twilio::REST::RequestError
    end
  end
end

describe Twilio::Resources::Taskrouter::WorkspaceInstance::TaskInstance do
  before do
    Twiliodeck.activate
  end

  after do
    Twiliodeck.deactivate
  end

  context "should update tasks" do
    it "and return 200" do
      client = Twilio::REST::TaskrouterClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      resource = client.workspaces.get('WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').tasks.get('WTaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.update(:'AssignmentStatus' => 'assignment_status', :'Attributes' => 'attributes', :'Priority' => 1, :'Reason' => 'reason') }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::TaskrouterClient.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      resource = client.workspaces.get('WSllllllllllllllllllllllllllllllll').tasks.get('WTllllllllllllllllllllllllllllllll')
      expect { resource.update(:'AssignmentStatus' => 'assignment_status', :'Attributes' => 'attributes', :'Priority' => 1, :'Reason' => 'reason') }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::TaskrouterClient.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      resource = client.workspaces.get('WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').tasks.get('WTkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk')
      expect { resource.update(:'AssignmentStatus' => 'assignment_status', :'Attributes' => 'attributes', :'Priority' => 1, :'Reason' => 'reason') }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::TaskrouterClient.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      resource = client.workspaces.get('WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').tasks.get('WTmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm')
      expect { resource.update(:'AssignmentStatus' => 'assignment_status', :'Attributes' => 'attributes', :'Priority' => 1, :'Reason' => 'reason') }.to raise_error Twilio::REST::RequestError
    end
  end

  context "should delete tasks" do
    it "and return 204" do
      client = Twilio::REST::TaskrouterClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      resource = client.workspaces.get('WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').tasks.get('WTaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.delete }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::TaskrouterClient.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      resource = client.workspaces.get('WSllllllllllllllllllllllllllllllll').tasks.get('WTllllllllllllllllllllllllllllllll')
      expect { resource.delete }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::TaskrouterClient.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      resource = client.workspaces.get('WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').tasks.get('WTkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk')
      expect { resource.delete }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::TaskrouterClient.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      resource = client.workspaces.get('WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').tasks.get('WTmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm')
      expect { resource.delete }.to raise_error Twilio::REST::RequestError
    end
  end
end