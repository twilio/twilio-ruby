require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::AuthorizedConnectAppList do
  before do
    @read_client = Twilio::REST::Client.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::Client.new write_account_sid, write_auth_token
  
    it "can fetch authorized_connect_apps" do
      @read_client go fetch it accounts.authorized_connect_apps
    end
  
    it "can read authorized_connect_apps" do
      @read_client go read it
    end
  end
end