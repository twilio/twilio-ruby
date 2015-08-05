require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::ConferenceInstance do
  before do
    @instance = Twilio::Resources::V2010::AccountInstance::ConferenceInstance.new('someClient')
  end

  [
    :participants
  ].each do |symbol|
    it "sets up #{symbol.to_s} dependent" do
      expect(@instance).to respond_to(symbol)
    end
  end
end