require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::SmsList do
  before do
    @list = Twilio::Resources::V2010::AccountInstance::SmsList.new('someClient')
  end

  [
    :sms_messages,
    :short_codes
  ].each do |symbol|
    it "sets up #{symbol.to_s} component" do
      expect(@list).to respond_to(symbol)
    end
  end
end