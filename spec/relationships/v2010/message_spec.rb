require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::MessageInstance do
  before do
    @instance = Twilio::Resources::V2010::AccountInstance::MessageInstance.new('someClient')
  end

  [
    :media
  ].each do |symbol|
    it "sets up #{symbol.to_s} dependent" do
      expect(@instance).to respond_to(symbol)
    end
  end
end