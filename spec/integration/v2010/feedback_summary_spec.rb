require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::CallList::FeedbackSummaryList do
  context "should create None" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "call_count": 10200,
       "call_feedback_count": 729,
       "end_date": "2014-01-31",
       "issues": [
        {
         "count": 45,
         "description": "imperfect-audio",
         "percentage_of_total_calls": "0.04%"
        }
       ],
       "quality_score_average": 4.5,
       "quality_score_median": 4,
       "quality_score_standard_deviation": 1,
       "sid": "FSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "start_date": "2014-01-01"
      }
          >))
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').calls.feedback_summaries.create(:'EndDate' => Date.new(2008, 1, 2), :'IncludeSubaccounts' => true, :'StartDate' => Date.new(2008, 1, 2), :'StatusCallback' => "https://example.com", :'StatusCallbackMethod' => "GET") }.not_to raise_error
    end
  
    it "and receive" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "call_count": 10200,
       "call_feedback_count": 729,
       "end_date": "2014-01-31",
       "issues": [
        {
         "count": 45,
         "description": "imperfect-audio",
         "percentage_of_total_calls": "0.04%"
        }
       ],
       "quality_score_average": 4.5,
       "quality_score_median": 4,
       "quality_score_standard_deviation": 1,
       "sid": "FSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "start_date": "2014-01-01"
      }
          >))
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').calls.feedback_summaries.create(:'EndDate' => Date.new(2008, 1, 2), :'IncludeSubaccounts' => true, :'StartDate' => Date.new(2008, 1, 2), :'StatusCallback' => "https://example.com", :'StatusCallbackMethod' => "GET") }.not_to raise_error
    end
  end

  context "should fetch None" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "call_count": 10200,
       "call_feedback_count": 729,
       "end_date": "2014-01-31",
       "issues": [
        {
         "count": 45,
         "description": "imperfect-audio",
         "percentage_of_total_calls": "0.04%"
        }
       ],
       "quality_score_average": 4.5,
       "quality_score_median": 4,
       "quality_score_standard_deviation": 1,
       "sid": "FSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "start_date": "2014-01-01"
      }
          >))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').calls.feedback_summaries.get('FSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.sid }.not_to raise_error
    end
  
    it "and receive" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "call_count": 10200,
       "call_feedback_count": 729,
       "end_date": "2014-01-31",
       "issues": [
        {
         "count": 45,
         "description": "imperfect-audio",
         "percentage_of_total_calls": "0.04%"
        }
       ],
       "quality_score_average": 4.5,
       "quality_score_median": 4,
       "quality_score_standard_deviation": 1,
       "sid": "FSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "start_date": "2014-01-01"
      }
          >))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').calls.feedback_summaries.get('FSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.sid }.not_to raise_error
    end
  end
end

describe Twilio::Resources::V2010::AccountInstance::CallList::FeedbackSummaryInstance do
  context "should delete None" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, '{}'))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').calls.feedback_summaries.get('FSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.delete }.not_to raise_error
    end
  
    it "and receive" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, '{}'))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').calls.feedback_summaries.get('FSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.delete }.not_to raise_error
    end
  end
end