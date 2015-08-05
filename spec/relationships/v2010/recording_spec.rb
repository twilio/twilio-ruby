require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::RecordingInstance do
  before do
    @instance = Twilio::Resources::V2010::AccountInstance::RecordingInstance.new('someClient')
  end

  [
    :transcriptions
  ].each do |symbol|
    it "sets up #{symbol.to_s} dependent" do
      expect(@instance).to respond_to(symbol)
    end
  end
end