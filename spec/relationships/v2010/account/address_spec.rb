require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::AddressInstance do
  before do
    @instance = Twilio::Resources::V2010::AccountInstance::AddressInstance.new('someClient')
  end

  [
    :dependent_phone_numbers
  ].each do |symbol|
    it "sets up #{symbol.to_s} dependent" do
      expect(@instance).to respond_to(symbol)
    end
  end
end