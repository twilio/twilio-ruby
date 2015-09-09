require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::CallInstance::FeedbackList do
  context "should create None" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "date_created": "Thu, 20 Aug 2015 21:45:46 +0000",
       "date_updated": "Thu, 20 Aug 2015 21:45:46 +0000",
       "issues": [
        "imperfect-audio",
        "post-dial-delay"
       ],
       "quality_score": 5,
       "sid": "CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
          >))
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').calls.get('CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').feedback.create(:'Issue' => ['audio-latency'], :'QualityScore' => 1) }.not_to raise_error
    end
  
    it "and receive" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "date_created": "Thu, 20 Aug 2015 21:45:46 +0000",
       "date_updated": "Thu, 20 Aug 2015 21:45:46 +0000",
       "issues": [
        "imperfect-audio",
        "post-dial-delay"
       ],
       "quality_score": 5,
       "sid": "CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
          >))
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').calls.get('CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').feedback.create(:'Issue' => ['audio-latency'], :'QualityScore' => 1) }.not_to raise_error
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
       "date_created": "Thu, 20 Aug 2015 21:45:46 +0000",
       "date_updated": "Thu, 20 Aug 2015 21:45:46 +0000",
       "issues": [
        "imperfect-audio",
        "post-dial-delay"
       ],
       "quality_score": 5,
       "sid": "CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
          >))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').calls.get('CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').feedback.get('CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
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
       "date_created": "Thu, 20 Aug 2015 21:45:46 +0000",
       "date_updated": "Thu, 20 Aug 2015 21:45:46 +0000",
       "issues": [
        "imperfect-audio",
        "post-dial-delay"
       ],
       "quality_score": 5,
       "sid": "CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
          >))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').calls.get('CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').feedback.get('CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.sid }.not_to raise_error
    end
  end
end

describe Twilio::Resources::V2010::AccountInstance::CallInstance::FeedbackInstance do
  context "should update None" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      request = Hologram::Request.new(
          method: "POST",
          url: "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Calls/CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Feedback.json",
          auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
          query_params: {},
          form_params: {:Issue => ["audio-latency"], :QualityScored => 1})
      holodeck.mock(request,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "date_created": "Thu, 20 Aug 2015 21:45:46 +0000",
       "date_updated": "Thu, 20 Aug 2015 21:45:46 +0000",
       "issues": [
        "imperfect-audio",
        "post-dial-delay"
       ],
       "quality_score": 5,
       "sid": "CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
          >))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').calls.get('CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').feedback.get('CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').update(:'Issue' => ['audio-latency'], :'QualityScored' => 1)
      expect(holodeck.requested?(request)).to equal(true)
    end
  
    it "and receive" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "date_created": "Thu, 20 Aug 2015 21:45:46 +0000",
       "date_updated": "Thu, 20 Aug 2015 21:45:46 +0000",
       "issues": [
        "imperfect-audio",
        "post-dial-delay"
       ],
       "quality_score": 5,
       "sid": "CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
          >))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').calls.get('CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').feedback.get('CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.update(:'Issue' => ['audio-latency'], :'QualityScored' => 1) }.not_to raise_error
    end
  end
end