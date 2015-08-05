require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::SipList do
  before do
    @list = Twilio::Resources::V2010::AccountInstance::SipList.new('someClient')
  end

  [
    :domains,
    :ip_access_control_lists,
    :credential_lists
  ].each do |symbol|
    it "sets up #{symbol.to_s} component" do
      expect(@list).to respond_to(symbol)
    end
  end
end