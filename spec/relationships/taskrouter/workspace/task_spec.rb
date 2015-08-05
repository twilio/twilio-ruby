require 'spec_helper'

describe Twilio::Resources::Taskrouter::WorkspaceInstance::TaskInstance do
  before do
    @instance = Twilio::Resources::Taskrouter::WorkspaceInstance::TaskInstance.new('someClient')
  end

  [
    :reservations
  ].each do |symbol|
    it "sets up #{symbol.to_s} dependent" do
      expect(@instance).to respond_to(symbol)
    end
  end
end