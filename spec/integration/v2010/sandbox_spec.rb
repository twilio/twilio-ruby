require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::SandboxList do
  before do
    @read_client = Twilio::REST::Client.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::Client.new write_account_sid, write_auth_token
  
    it "can fetch None" do
      @read_client go fetch it accounts.sandbox
    end
  end
end

describe Twilio::Resources::V2010::AccountInstance::SandboxInstance do
  before do
    @read_client = Twilio::REST::Client.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::Client.new write_account_sid, write_auth_token
  
    it "can update None" do
      @write_client go update it
    end
  end
end