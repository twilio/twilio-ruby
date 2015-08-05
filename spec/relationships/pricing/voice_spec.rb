require 'spec_helper'

describe Twilio::Resources::Pricing::VoiceList do
  before do
    @list = Twilio::Resources::Pricing::VoiceList.new('someClient')
  end

  [
    :numbers,
    :countries
  ].each do |symbol|
    it "sets up #{symbol.to_s} component" do
      expect(@list).to respond_to(symbol)
    end
  end
end