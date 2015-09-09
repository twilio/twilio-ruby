require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::MessageInstance::MediaList do
  context "should fetch media_list" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "content_type": "image/jpeg",
       "date_created": "Sun, 16 Aug 2015 15:53:54 +0000",
       "date_updated": "Sun, 16 Aug 2015 15:53:55 +0000",
       "parent_sid": "SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "sid": "MEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Media/MEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
          >))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').messages.get('SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').media.get('MEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
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
       "content_type": "image/jpeg",
       "date_created": "Sun, 16 Aug 2015 15:53:54 +0000",
       "date_updated": "Sun, 16 Aug 2015 15:53:55 +0000",
       "parent_sid": "SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "sid": "MEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Media/MEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
          >))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').messages.get('SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').media.get('MEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.sid }.not_to raise_error
    end
  end

  context "should read media_list" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "end": 0,
       "first_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Media.json?PageSize=50&Page=0",
       "last_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Media.json?PageSize=50&Page=0",
       "media_list": [
        {
         "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "content_type": "image/jpeg",
         "date_created": "Sun, 16 Aug 2015 15:53:54 +0000",
         "date_updated": "Sun, 16 Aug 2015 15:53:55 +0000",
         "parent_sid": "SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "sid": "MEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Media/MEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
        }
       ],
       "next_page_uri": null,
       "num_pages": 1,
       "page": 0,
       "page_size": 50,
       "previous_page_uri": null,
       "start": 0,
       "total": 1,
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Media.json?PageSize=50&Page=0"
      }
          >))
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').messages.get('SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').media.list(:'DateCreated' => Date.new(2008, 1, 1)) }.not_to raise_error
    end
  
    it "and receive" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "end": 0,
       "first_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Media.json?PageSize=50&Page=0",
       "last_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Media.json?PageSize=50&Page=0",
       "media_list": [
        {
         "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "content_type": "image/jpeg",
         "date_created": "Sun, 16 Aug 2015 15:53:54 +0000",
         "date_updated": "Sun, 16 Aug 2015 15:53:55 +0000",
         "parent_sid": "SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "sid": "MEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Media/MEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
        }
       ],
       "next_page_uri": null,
       "num_pages": 1,
       "page": 0,
       "page_size": 50,
       "previous_page_uri": null,
       "start": 0,
       "total": 1,
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Media.json?PageSize=50&Page=0"
      }
          >))
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').messages.get('SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').media.list(:'DateCreated' => Date.new(2008, 1, 1)) }.not_to raise_error
    end
  end
end

describe Twilio::Resources::V2010::AccountInstance::MessageInstance::MediaInstance do
  context "should delete media_list" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, '{}'))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').messages.get('SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').media.get('MEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.delete }.not_to raise_error
    end
  
    it "and receive" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, '{}'))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').messages.get('SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').media.get('MEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.delete }.not_to raise_error
    end
  end
end