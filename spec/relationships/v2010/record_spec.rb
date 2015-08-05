require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::UsageList::RecordList do
  before do
    @list = Twilio::Resources::V2010::AccountInstance::UsageList::RecordList.new('someClient')
  end

  [
    :all_time,
    :daily,
    :last_month,
    :monthly,
    :this_month,
    :today,
    :yearly,
    :yesterday
  ].each do |symbol|
    it "sets up #{symbol.to_s} component" do
      expect(@list).to respond_to(symbol)
    end
  end
end