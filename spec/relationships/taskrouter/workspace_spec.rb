require 'spec_helper'

describe Twilio::Resources::Taskrouter::WorkspaceInstance do
  before do
    @instance = Twilio::Resources::Taskrouter::WorkspaceInstance.new('someClient')
  end

  [
    :activities,
    :events,
    :tasks,
    :task_queues,
    :workers,
    :workflows,
    :statistics
  ].each do |symbol|
    it "sets up #{symbol.to_s} dependent" do
      expect(@instance).to respond_to(symbol)
    end
  end
end