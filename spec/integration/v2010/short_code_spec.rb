require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::SmsList::ShortCodeList do
  before do
    @read_client = Twilio::REST::Client.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::Client.new write_account_sid, write_auth_token
  
    it "can fetch short_codes" do
      @read_client go fetch it accounts.sms.short_codes
    end
  
    it "can read short_codes" do
      @read_client go read it
    end
  end
end

describe Twilio::Resources::V2010::AccountInstance::SmsList::ShortCodeInstance do
  before do
    @read_client = Twilio::REST::Client.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::Client.new write_account_sid, write_auth_token
  
    it "can update short_codes" do
      @write_client go update it
    end
  end
end