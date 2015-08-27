require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::SmsList::SmsMessageList do
  before do
    @read_client = Twilio::REST::Client.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::Client.new write_account_sid, write_auth_token
  
    it "can create sms_messages" do
      @write_client go create it
    end
  
    it "can fetch sms_messages" do
      @read_client go fetch it accounts.sms.messages
    end
  
    it "can read sms_messages" do
      @read_client go read it
    end
  end
end

describe Twilio::Resources::V2010::AccountInstance::SmsList::SmsMessageInstance do
  before do
    @read_client = Twilio::REST::Client.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::Client.new write_account_sid, write_auth_token
  
    it "can delete sms_messages" do
      @write_client go delete it
    end
  
    it "can update sms_messages" do
      @write_client go update it
    end
  end
end