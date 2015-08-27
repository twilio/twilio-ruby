require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::UsageList::RecordList::YesterdayList do
  before do
    @read_client = Twilio::REST::Client.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::Client.new write_account_sid, write_auth_token
  
    it "can read usage_records" do
      @read_client go read it
    end
  end
end