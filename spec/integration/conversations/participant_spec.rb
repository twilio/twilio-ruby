require 'spec_helper'

describe Twilio::Resources::Conversations::ConversationInstance::ParticipantList do
  context "should read participants" do
    it "and succeed" do
      client = Twilio::REST::ConversationsClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "meta": {
        "first_page_url": "https://conversations.twilio.com/v1/Conversations/CVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants?PageSize=50&Page=0",
        "key": "participants",
        "next_page_url": null,
        "page": 0,
        "page_size": 50,
        "previous_page_url": null,
        "url": "https://conversations.twilio.com/v1/Conversations/CVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants?PageSize=50&Page=0"
       },
       "participants": [
        {
         "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "address": "torkel2@ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.endpoint.twilio.com",
         "conversation_sid": "CVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "date_created": "2015-05-13T23:03:12Z",
         "duration": 685,
         "end_time": "2015-05-13T23:14:40Z",
         "sid": "PAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "start_time": "2015-05-13T23:03:15Z",
         "status": "disconnected",
         "url": "https://conversations.twilio.com/v1/Conversations/CVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants/PAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
        }
       ]
      }
          >))
      expect { client.conversations.get('CVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').participants.list() }.not_to raise_error
    end
  
    it "and receive" do
      client = Twilio::REST::ConversationsClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "meta": {
        "first_page_url": "https://conversations.twilio.com/v1/Conversations/CVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants?PageSize=50&Page=0",
        "key": "participants",
        "next_page_url": null,
        "page": 0,
        "page_size": 50,
        "previous_page_url": null,
        "url": "https://conversations.twilio.com/v1/Conversations/CVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants?PageSize=50&Page=0"
       },
       "participants": [
        {
         "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "address": "torkel2@ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.endpoint.twilio.com",
         "conversation_sid": "CVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "date_created": "2015-05-13T23:03:12Z",
         "duration": 685,
         "end_time": "2015-05-13T23:14:40Z",
         "sid": "PAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "start_time": "2015-05-13T23:03:15Z",
         "status": "disconnected",
         "url": "https://conversations.twilio.com/v1/Conversations/CVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants/PAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
        }
       ]
      }
          >))
      expect { client.conversations.get('CVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').participants.list() }.not_to raise_error
    end
  end

  context "should create participants" do
    it "and succeed" do
      client = Twilio::REST::ConversationsClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "address": "torkel2@ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.endpoint.twilio.com",
       "conversation_sid": "CVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "date_created": "2015-05-13T23:03:12Z",
       "duration": 685,
       "end_time": "2015-05-13T23:14:40Z",
       "sid": "PAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "start_time": "2015-05-13T23:03:15Z",
       "status": "disconnected",
       "url": "https://conversations.twilio.com/v1/Conversations/CVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants/PAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
          >))
      expect { client.conversations.get('CVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').participants.create(:'From' => "+987654321", :'To' => "+123456789") }.not_to raise_error
    end
  
    it "and receive" do
      client = Twilio::REST::ConversationsClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "address": "torkel2@ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.endpoint.twilio.com",
       "conversation_sid": "CVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "date_created": "2015-05-13T23:03:12Z",
       "duration": 685,
       "end_time": "2015-05-13T23:14:40Z",
       "sid": "PAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "start_time": "2015-05-13T23:03:15Z",
       "status": "disconnected",
       "url": "https://conversations.twilio.com/v1/Conversations/CVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants/PAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
          >))
      expect { client.conversations.get('CVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').participants.create(:'From' => "+987654321", :'To' => "+123456789") }.not_to raise_error
    end
  end

  context "should fetch participants" do
    it "and succeed" do
      client = Twilio::REST::ConversationsClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "address": "torkel2@ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.endpoint.twilio.com",
       "conversation_sid": "CVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "date_created": "2015-05-13T23:03:12Z",
       "duration": 685,
       "end_time": "2015-05-13T23:14:40Z",
       "sid": "PAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "start_time": "2015-05-13T23:03:15Z",
       "status": "disconnected",
       "url": "https://conversations.twilio.com/v1/Conversations/CVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants/PAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
          >))
      resource = client.conversations.get('CVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').participants.get('PAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
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
       "address": "torkel2@ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.endpoint.twilio.com",
       "conversation_sid": "CVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "date_created": "2015-05-13T23:03:12Z",
       "duration": 685,
       "end_time": "2015-05-13T23:14:40Z",
       "sid": "PAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "start_time": "2015-05-13T23:03:15Z",
       "status": "disconnected",
       "url": "https://conversations.twilio.com/v1/Conversations/CVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants/PAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
          >))
      resource = client.conversations.get('CVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').participants.get('PAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.sid }.not_to raise_error
    end
  end
end