require 'spec_helper'

describe Twilio::REST::Wds::TaskQueues do
  it 'creates a task queue object' do
    workspace = Twilio::REST::Wds::Workspace.new('someUri', 'someClient')
    expect(workspace).to respond_to(:task_queues)
    expect(workspace.task_queues.instance_variable_get('@path')).to eq('someUri/TaskQueues')
  end
end
