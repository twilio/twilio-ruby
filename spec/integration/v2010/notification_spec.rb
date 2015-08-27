require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::NotificationList do
  before do
    @read_client = Twilio::REST::Client.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::Client.new write_account_sid, write_auth_token
  
    it "can fetch notifications" do
      @read_client go fetch it accounts.notifications
    end
  
    it "can read notifications" do
      @read_client go read it
    end
  end
end

describe Twilio::Resources::V2010::AccountInstance::NotificationInstance do
  before do
    @read_client = Twilio::REST::Client.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::Client.new write_account_sid, write_auth_token
  
    it "can delete notifications" do
      @write_client go delete it
    end
  end
end