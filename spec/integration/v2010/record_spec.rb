require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::UsageList::RecordList do
  before do
    Twiliodeck.activate
  end

  after do
    Twiliodeck.deactivate
  end

  context "should read usage_records" do
    it "and return 200" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').usage.records.list(:'Category' => 'category', :'EndDate' => 'end_date', :'StartDate' => 'start_date') }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::Client.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      expect { client.accounts.get('ACllllllllllllllllllllllllllllllll').usage.records.list(:'Category' => 'category', :'EndDate' => 'end_date', :'StartDate' => 'start_date') }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::Client.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      expect { client.accounts.get('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').usage.records.list(:'Category' => 'category', :'EndDate' => 'end_date', :'StartDate' => 'start_date') }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::Client.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      expect { client.accounts.get('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').usage.records.list(:'Category' => 'category', :'EndDate' => 'end_date', :'StartDate' => 'start_date') }.to raise_error Twilio::REST::RequestError
    end
  end
end