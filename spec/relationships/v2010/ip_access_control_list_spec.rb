require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::SipList::IpAccessControlListInstance do
  before do
    @instance = Twilio::Resources::V2010::AccountInstance::SipList::IpAccessControlListInstance.new('someClient')
  end

  [
    :ip_addresses
  ].each do |symbol|
    it "sets up #{symbol.to_s} dependent" do
      expect(@instance).to respond_to(symbol)
    end
  end
end