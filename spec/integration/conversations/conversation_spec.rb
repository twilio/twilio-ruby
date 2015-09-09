require 'spec_helper'

describe Twilio::Resources::Conversations::ConversationList do
  context "should fetch None" do
    it "and succeed" do
      client = Twilio::REST::ConversationsClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "date_created": "2015-05-12T21:13:15Z",
       "duration": 60,
       "end_time": "2015-05-12T21:14:15Z",
       "links": {
        "participants": "https://conversations.twilio.com/v1/Conversations/CVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants"
       },
       "sid": "CVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "start_time": "2015-05-12T21:13:15Z",
       "status": "created",
       "url": "https://conversations.twilio.com/v1/Conversations/CVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
          >))
      resource = client.conversations.get('CVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.sid }.not_to raise_error
    end
  
    it "and receive" do
      client = Twilio::REST::ConversationsClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "date_created": "2015-05-12T21:13:15Z",
       "duration": 60,
       "end_time": "2015-05-12T21:14:15Z",
       "links": {
        "participants": "https://conversations.twilio.com/v1/Conversations/CVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants"
       },
       "sid": "CVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "start_time": "2015-05-12T21:13:15Z",
       "status": "created",
       "url": "https://conversations.twilio.com/v1/Conversations/CVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
          >))
      resource = client.conversations.get('CVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.sid }.not_to raise_error
    end
  end
end