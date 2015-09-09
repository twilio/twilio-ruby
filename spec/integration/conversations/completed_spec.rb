require 'spec_helper'

describe Twilio::Resources::Conversations::ConversationList::CompletedList do
  context "should read conversations" do
    it "and succeed" do
      client = Twilio::REST::ConversationsClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "conversations": [
        {
         "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "date_created": "2015-05-12T21:08:50Z",
         "duration": 60,
         "end_time": "2015-05-12T21:09:50Z",
         "links": {
          "participants": "https://conversations.twilio.com/v1/Conversations/CVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants"
         },
         "sid": "CVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "start_time": "2015-05-12T21:08:50Z",
         "status": "completed",
         "url": "https://conversations.twilio.com/v1/Conversations/CVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
        }
       ],
       "meta": {
        "first_page_url": "https://conversations.twilio.com/v1/Conversations/Completed?PageSize=50&Page=0",
        "key": "conversations",
        "next_page_url": null,
        "page": 0,
        "page_size": 50,
        "previous_page_url": null,
        "url": "https://conversations.twilio.com/v1/Conversations/Completed?PageSize=50&Page=0"
       }
      }
          >))
      expect { client.conversations.completed.list() }.not_to raise_error
    end
  
    it "and receive" do
      client = Twilio::REST::ConversationsClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "conversations": [
        {
         "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "date_created": "2015-05-12T21:08:50Z",
         "duration": 60,
         "end_time": "2015-05-12T21:09:50Z",
         "links": {
          "participants": "https://conversations.twilio.com/v1/Conversations/CVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants"
         },
         "sid": "CVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "start_time": "2015-05-12T21:08:50Z",
         "status": "completed",
         "url": "https://conversations.twilio.com/v1/Conversations/CVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
        }
       ],
       "meta": {
        "first_page_url": "https://conversations.twilio.com/v1/Conversations/Completed?PageSize=50&Page=0",
        "key": "conversations",
        "next_page_url": null,
        "page": 0,
        "page_size": 50,
        "previous_page_url": null,
        "url": "https://conversations.twilio.com/v1/Conversations/Completed?PageSize=50&Page=0"
       }
      }
          >))
      expect { client.conversations.completed.list() }.not_to raise_error
    end
  end
end