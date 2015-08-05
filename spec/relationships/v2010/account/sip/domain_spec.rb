require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::SipList::DomainInstance do
  before do
    @instance = Twilio::Resources::V2010::AccountInstance::SipList::DomainInstance.new('someClient')
  end

  [
    :ip_access_control_list_mappings,
    :credential_list_mappings
  ].each do |symbol|
    it "sets up #{symbol.to_s} dependent" do
      expect(@instance).to respond_to(symbol)
    end
  end
end