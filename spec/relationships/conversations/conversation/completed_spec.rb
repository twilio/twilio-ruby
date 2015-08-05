require 'spec_helper'

describe Twilio::Resources::Conversations::ConversationList::CompletedInstance do
  before do
    @instance = Twilio::Resources::Conversations::ConversationList::CompletedInstance.new('someClient')
  end

  [
    :participants
  ].each do |symbol|
    it "sets up #{symbol.to_s} dependent" do
      expect(@instance).to respond_to(symbol)
    end
  end
end