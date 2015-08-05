require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::AvailablePhoneNumberCountryInstance do
  before do
    @instance = Twilio::Resources::V2010::AccountInstance::AvailablePhoneNumberCountryInstance.new('someClient')
  end

  [
    :local,
    :toll_free,
    :mobile
  ].each do |symbol|
    it "sets up #{symbol.to_s} dependent" do
      expect(@instance).to respond_to(symbol)
    end
  end
end