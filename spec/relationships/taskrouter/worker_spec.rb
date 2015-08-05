require 'spec_helper'

describe Twilio::Resources::Taskrouter::WorkspaceInstance::WorkerList do
  before do
    @list = Twilio::Resources::Taskrouter::WorkspaceInstance::WorkerList.new('someClient')
  end

  [
    :statistics
  ].each do |symbol|
    it "sets up #{symbol.to_s} component" do
      expect(@list).to respond_to(symbol)
    end
  end
end

describe Twilio::Resources::Taskrouter::WorkspaceInstance::WorkerInstance do
  before do
    @instance = Twilio::Resources::Taskrouter::WorkspaceInstance::WorkerInstance.new('someClient')
  end

  [
    :statistics
  ].each do |symbol|
    it "sets up #{symbol.to_s} dependent" do
      expect(@instance).to respond_to(symbol)
    end
  end
end