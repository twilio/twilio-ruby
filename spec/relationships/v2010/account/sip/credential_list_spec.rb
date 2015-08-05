require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::SipList::CredentialListInstance do
  before do
    @instance = Twilio::Resources::V2010::AccountInstance::SipList::CredentialListInstance.new('someClient')
  end

  [
    :credentials
  ].each do |symbol|
    it "sets up #{symbol.to_s} dependent" do
      expect(@instance).to respond_to(symbol)
    end
  end
end