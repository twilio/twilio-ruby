require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::UsageList::TriggerList do
  before do
    @read_client = Twilio::REST::Client.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::Client.new write_account_sid, write_auth_token
  
    it "can fetch usage_triggers" do
      @read_client go fetch it accounts.usage.triggers
    end
  
    it "can create usage_triggers" do
      @write_client go create it
    end
  
    it "can read usage_triggers" do
      @read_client go read it
    end
  end
end

describe Twilio::Resources::V2010::AccountInstance::UsageList::TriggerInstance do
  before do
    @read_client = Twilio::REST::Client.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::Client.new write_account_sid, write_auth_token
  
    it "can update usage_triggers" do
      @write_client go update it
    end
  
    it "can delete usage_triggers" do
      @write_client go delete it
    end
  end
end