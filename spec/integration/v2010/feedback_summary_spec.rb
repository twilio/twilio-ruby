require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::CallList::FeedbackSummaryList do
  before do
    @read_client = Twilio::REST::Client.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::Client.new write_account_sid, write_auth_token
  
    it "can create None" do
      @write_client go create it
    end
  
    it "can fetch None" do
      @read_client go fetch it accounts.calls.feedback_summaries
    end
  end
end

describe Twilio::Resources::V2010::AccountInstance::CallList::FeedbackSummaryInstance do
  before do
    @read_client = Twilio::REST::Client.new read_account_sid, read_auth_token
    @write_client = Twilio::REST::Client.new write_account_sid, write_auth_token
  
    it "can delete None" do
      @write_client go delete it
    end
  end
end