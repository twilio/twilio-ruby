require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::CountryInstance do
  before do
    @instance = Twilio::Resources::V2010::AccountInstance::CountryInstance.new('someClient')
  end

  [
    :available_phone_numbers,
    :available_phone_numbers,
    :available_phone_numbers
  ].each do |symbol|
    it "sets up #{symbol.to_s} dependent" do
      expect(@instance).to respond_to(symbol)
    end
  end
end