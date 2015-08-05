require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::IncomingPhoneNumberList do
  before do
    @list = Twilio::Resources::V2010::AccountInstance::IncomingPhoneNumberList.new('someClient')
  end

  [
    :incoming_phone_number_locals,
    :incoming_phone_number_mobiles,
    :incoming_phone_number_toll_frees
  ].each do |symbol|
    it "sets up #{symbol.to_s} component" do
      expect(@list).to respond_to(symbol)
    end
  end
end