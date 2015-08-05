require 'spec_helper'

describe Twilio::Resources::Conversations::ConversationList do
  before do
    @list = Twilio::Resources::Conversations::ConversationList.new('someClient')
  end

  [
    :in_progress,
    :completed
  ].each do |symbol|
    it "sets up #{symbol.to_s} component" do
      expect(@list).to respond_to(symbol)
    end
  end
end

describe Twilio::Resources::Conversations::ConversationInstance do
  before do
    @instance = Twilio::Resources::Conversations::ConversationInstance.new('someClient')
  end

  [
    :participants
  ].each do |symbol|
    it "sets up #{symbol.to_s} dependent" do
      expect(@instance).to respond_to(symbol)
    end
  end
end