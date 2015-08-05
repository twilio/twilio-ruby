require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::IncomingPhoneNumberList do
  before do
    @list = Twilio::Resources::V2010::AccountInstance::IncomingPhoneNumberList.new('someClient')
  end

  [
    :local,
    :mobile,
    :toll_free
  ].each do |symbol|
    it "sets up #{symbol.to_s} component" do
      expect(@list).to respond_to(symbol)
    end
  end
end