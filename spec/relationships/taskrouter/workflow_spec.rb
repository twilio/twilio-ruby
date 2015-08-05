require 'spec_helper'

describe Twilio::Resources::Taskrouter::WorkspaceInstance::WorkflowInstance do
  before do
    @instance = Twilio::Resources::Taskrouter::WorkspaceInstance::WorkflowInstance.new('someClient')
  end

  [
    :statistics
  ].each do |symbol|
    it "sets up #{symbol.to_s} dependent" do
      expect(@instance).to respond_to(symbol)
    end
  end
end