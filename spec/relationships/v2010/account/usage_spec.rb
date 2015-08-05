require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::UsageList do
  before do
    @list = Twilio::Resources::V2010::AccountInstance::UsageList.new('someClient')
  end

  [
    :usage_records,
    :usage_triggers
  ].each do |symbol|
    it "sets up #{symbol.to_s} component" do
      expect(@list).to respond_to(symbol)
    end
  end
end