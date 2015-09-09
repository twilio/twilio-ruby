require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::TranscriptionList do
  context "should fetch transcriptions" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "api_version": "2008-08-01",
       "date_created": "Sun, 13 Feb 2011 02:12:08 +0000",
       "date_updated": "Sun, 13 Feb 2011 02:30:01 +0000",
       "duration": "1",
       "price": "-0.05000",
       "recording_sid": "REaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "sid": "TRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "status": "failed",
       "transcription_text": "(blank)",
       "type": "fast",
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Transcriptions/TRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
          >))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').transcriptions.get('TRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
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
       "api_version": "2008-08-01",
       "date_created": "Sun, 13 Feb 2011 02:12:08 +0000",
       "date_updated": "Sun, 13 Feb 2011 02:30:01 +0000",
       "duration": "1",
       "price": "-0.05000",
       "recording_sid": "REaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "sid": "TRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "status": "failed",
       "transcription_text": "(blank)",
       "type": "fast",
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Transcriptions/TRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
          >))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').transcriptions.get('TRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.sid }.not_to raise_error
    end
  end

  context "should read transcriptions" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "end": 0,
       "first_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Transcriptions.json?PageSize=1&Page=0",
       "last_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Transcriptions.json?PageSize=1&Page=3",
       "next_page_uri": null,
       "num_pages": 4,
       "page": 0,
       "page_size": 1,
       "previous_page_uri": null,
       "start": 0,
       "total": 4,
       "transcriptions": [
        {
         "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "api_version": "2008-08-01",
         "date_created": "Thu, 25 Aug 2011 20:59:45 +0000",
         "date_updated": "Thu, 25 Aug 2011 20:59:45 +0000",
         "duration": "10",
         "price": "0.00000",
         "price_unit": "USD",
         "recording_sid": "REaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "sid": "TRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "status": "completed",
         "transcription_text": null,
         "type": "fast",
         "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Transcriptions/TRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
        }
       ],
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Transcriptions.json?PageSize=1&Page=0"
      }
          >))
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').transcriptions.list() }.not_to raise_error
    end
  
    it "and receive" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "end": 0,
       "first_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Transcriptions.json?PageSize=1&Page=0",
       "last_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Transcriptions.json?PageSize=1&Page=3",
       "next_page_uri": null,
       "num_pages": 4,
       "page": 0,
       "page_size": 1,
       "previous_page_uri": null,
       "start": 0,
       "total": 4,
       "transcriptions": [
        {
         "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "api_version": "2008-08-01",
         "date_created": "Thu, 25 Aug 2011 20:59:45 +0000",
         "date_updated": "Thu, 25 Aug 2011 20:59:45 +0000",
         "duration": "10",
         "price": "0.00000",
         "price_unit": "USD",
         "recording_sid": "REaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "sid": "TRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "status": "completed",
         "transcription_text": null,
         "type": "fast",
         "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Transcriptions/TRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
        }
       ],
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Transcriptions.json?PageSize=1&Page=0"
      }
          >))
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').transcriptions.list() }.not_to raise_error
    end
  end
end

describe Twilio::Resources::V2010::AccountInstance::TranscriptionInstance do
  context "should delete transcriptions" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, '{}'))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').transcriptions.get('TRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.delete }.not_to raise_error
    end
  
    it "and receive" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, '{}'))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').transcriptions.get('TRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.delete }.not_to raise_error
    end
  end
end