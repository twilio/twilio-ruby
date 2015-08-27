require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::ConnectAppList do
  before do
    @read_client = Twilio::REST::Client.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::Client.new write_account_sid, write_auth_token
  
    it "can fetch connect_apps" do
      @read_client go fetch it accounts.connect_apps
    end
  
    it "can read connect_apps" do
      @read_client go read it
    end
  end
end

describe Twilio::Resources::V2010::AccountInstance::ConnectAppInstance do
  before do
    @read_client = Twilio::REST::Client.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::Client.new write_account_sid, write_auth_token
  
    it "can update connect_apps" do
      @write_client go update it
    end
  end
end