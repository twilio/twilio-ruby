require 'spec_helper'

describe Twilio::Resources::Pricing::PhoneNumberList do
  before do
    @list = Twilio::Resources::Pricing::PhoneNumberList.new('someClient')
  end

  [
    :countries
  ].each do |symbol|
    it "sets up #{symbol.to_s} component" do
      expect(@list).to respond_to(symbol)
    end
  end
end