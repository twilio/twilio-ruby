require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::ApplicationList do
  before do
    @read_client = Twilio::REST::Client.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::Client.new write_account_sid, write_auth_token
  
    it "can create applications" do
      @write_client go create it
    end
  
    it "can fetch applications" do
      @read_client go fetch it accounts.applications
    end
  
    it "can read applications" do
      @read_client go read it
    end
  end
end

describe Twilio::Resources::V2010::AccountInstance::ApplicationInstance do
  before do
    @read_client = Twilio::REST::Client.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::Client.new write_account_sid, write_auth_token
  
    it "can delete applications" do
      @write_client go delete it
    end
  
    it "can update applications" do
      @write_client go update it
    end
  end
end