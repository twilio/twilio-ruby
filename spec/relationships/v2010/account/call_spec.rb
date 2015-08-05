require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::CallList do
  before do
    @list = Twilio::Resources::V2010::AccountInstance::CallList.new('someClient')
  end

  [
    :call_feedback_summaries
  ].each do |symbol|
    it "sets up #{symbol.to_s} component" do
      expect(@list).to respond_to(symbol)
    end
  end
end

describe Twilio::Resources::V2010::AccountInstance::CallInstance do
  before do
    @instance = Twilio::Resources::V2010::AccountInstance::CallInstance.new('someClient')
  end

  [
    :recordings,
    :notifications,
    :feedbacks
  ].each do |symbol|
    it "sets up #{symbol.to_s} dependent" do
      expect(@instance).to respond_to(symbol)
    end
  end
end