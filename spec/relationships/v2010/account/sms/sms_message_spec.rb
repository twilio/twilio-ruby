require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::SmsList::SmsMessageInstance do
  before do
    @instance = Twilio::Resources::V2010::AccountInstance::SmsList::SmsMessageInstance.new('someClient')
  end

  [
    :media
  ].each do |symbol|
    it "sets up #{symbol.to_s} dependent" do
      expect(@instance).to respond_to(symbol)
    end
  end
end