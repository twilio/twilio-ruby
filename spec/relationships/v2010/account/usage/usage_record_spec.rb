require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::UsageList::UsageRecordList do
  before do
    @list = Twilio::Resources::V2010::AccountInstance::UsageList::UsageRecordList.new('someClient')
  end

  [
    :usage_record_all_times,
    :usage_record_dailies,
    :usage_record_last_months,
    :usage_record_monthlies,
    :usage_record_this_months,
    :usage_record_todays,
    :usage_record_yearlies,
    :usage_record_yesterdays
  ].each do |symbol|
    it "sets up #{symbol.to_s} component" do
      expect(@list).to respond_to(symbol)
    end
  end
end