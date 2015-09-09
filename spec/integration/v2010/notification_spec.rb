require 'spec_helper'

describe Twilio::Resources::V2010::AccountInstance::NotificationList do
  context "should fetch notifications" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "api_version": "2008-08-01",
       "call_sid": "CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "date_created": "Mon, 13 Sep 2010 20:02:01 +0000",
       "date_updated": "Mon, 13 Sep 2010 20:02:01 +0000",
       "error_code": "11200",
       "log": "0",
       "message_date": "Mon, 13 Sep 2010 20:02:00 +0000",
       "message_text": "EmailNotification=false&LogLevel=ERROR&sourceComponent=12000&Msg=&httpResponse=500&ErrorCode=11200&url=http%3A%2F%2Fvoiceforms4000.appspot.com%2Ftwiml",
       "more_info": "http://www.twilio.com/docs/errors/11200",
       "request_method": "get",
       "request_url": "https://voiceforms4000.appspot.com/twiml/9436/question/0",
       "request_variables": "AccountSid=ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa&CallStatus=in-progress&ToZip=94937&ToCity=INVERNESS&ToState=CA&Called=%2B14156694923&To=%2B14156694923&ToCountry=US&CalledZip=94937&Direction=inbound&ApiVersion=2010-04-01&Caller=%2B17378742833&CalledCity=INVERNESS&CalledCountry=US&CallSid=CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa&CalledState=CA&From=%2B17378742833",
       "response_body": "blah blah",
       "response_headers": "Date=Mon%2C+13+Sep+2010+20%3A02%3A00+GMT&Content-Length=466&Connection=close&Content-Type=text%2Fhtml%3B+charset%3DUTF-8&Server=Google+Frontend",
       "sid": "NOaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Notifications/NOaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
          >))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').notifications.get('NOaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
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
       "call_sid": "CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "date_created": "Mon, 13 Sep 2010 20:02:01 +0000",
       "date_updated": "Mon, 13 Sep 2010 20:02:01 +0000",
       "error_code": "11200",
       "log": "0",
       "message_date": "Mon, 13 Sep 2010 20:02:00 +0000",
       "message_text": "EmailNotification=false&LogLevel=ERROR&sourceComponent=12000&Msg=&httpResponse=500&ErrorCode=11200&url=http%3A%2F%2Fvoiceforms4000.appspot.com%2Ftwiml",
       "more_info": "http://www.twilio.com/docs/errors/11200",
       "request_method": "get",
       "request_url": "https://voiceforms4000.appspot.com/twiml/9436/question/0",
       "request_variables": "AccountSid=ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa&CallStatus=in-progress&ToZip=94937&ToCity=INVERNESS&ToState=CA&Called=%2B14156694923&To=%2B14156694923&ToCountry=US&CalledZip=94937&Direction=inbound&ApiVersion=2010-04-01&Caller=%2B17378742833&CalledCity=INVERNESS&CalledCountry=US&CallSid=CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa&CalledState=CA&From=%2B17378742833",
       "response_body": "blah blah",
       "response_headers": "Date=Mon%2C+13+Sep+2010+20%3A02%3A00+GMT&Content-Length=466&Connection=close&Content-Type=text%2Fhtml%3B+charset%3DUTF-8&Server=Google+Frontend",
       "sid": "NOaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Notifications/NOaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
          >))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').notifications.get('NOaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.sid }.not_to raise_error
    end
  end

  context "should read notifications" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "end": 0,
       "first_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Notifications.json?PageSize=1&Page=0",
       "last_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Notifications.json?PageSize=1&Page=100",
       "next_page_uri": null,
       "notifications": [
        {
         "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "api_version": "2008-08-01",
         "call_sid": "CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "date_created": "Thu, 30 Apr 2015 16:47:33 +0000",
         "date_updated": "Thu, 30 Apr 2015 16:47:35 +0000",
         "error_code": "21609",
         "log": "1",
         "message_date": "Thu, 30 Apr 2015 16:47:32 +0000",
         "message_text": "LogLevel=WARN&invalidStatusCallbackUrl=&Msg=Invalid+Url+for+callSid%3A+CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa+invalid+statusCallbackUrl%3A+&ErrorCode=21609",
         "more_info": "https://www.twilio.com/docs/errors/21609",
         "request_method": null,
         "request_url": "",
         "sid": "NOaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Notifications/NOaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
        }
       ],
       "num_pages": 101,
       "page": 0,
       "page_size": 1,
       "previous_page_uri": null,
       "start": 0,
       "total": 101,
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Notifications.json?PageSize=1&Page=0"
      }
          >))
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').notifications.list(:'Log' => 1, :'MessageDate' => Date.new(2008, 1, 1)) }.not_to raise_error
    end
  
    it "and receive" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "end": 0,
       "first_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Notifications.json?PageSize=1&Page=0",
       "last_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Notifications.json?PageSize=1&Page=100",
       "next_page_uri": null,
       "notifications": [
        {
         "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "api_version": "2008-08-01",
         "call_sid": "CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "date_created": "Thu, 30 Apr 2015 16:47:33 +0000",
         "date_updated": "Thu, 30 Apr 2015 16:47:35 +0000",
         "error_code": "21609",
         "log": "1",
         "message_date": "Thu, 30 Apr 2015 16:47:32 +0000",
         "message_text": "LogLevel=WARN&invalidStatusCallbackUrl=&Msg=Invalid+Url+for+callSid%3A+CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa+invalid+statusCallbackUrl%3A+&ErrorCode=21609",
         "more_info": "https://www.twilio.com/docs/errors/21609",
         "request_method": null,
         "request_url": "",
         "sid": "NOaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Notifications/NOaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
        }
       ],
       "num_pages": 101,
       "page": 0,
       "page_size": 1,
       "previous_page_uri": null,
       "start": 0,
       "total": 101,
       "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Notifications.json?PageSize=1&Page=0"
      }
          >))
      expect { client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').notifications.list(:'Log' => 1, :'MessageDate' => Date.new(2008, 1, 1)) }.not_to raise_error
    end
  end
end

describe Twilio::Resources::V2010::AccountInstance::NotificationInstance do
  context "should delete notifications" do
    it "and succeed" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, '{}'))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').notifications.get('NOaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.delete }.not_to raise_error
    end
  
    it "and receive" do
      client = Twilio::REST::Client.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, '{}'))
      resource = client.accounts.get('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').notifications.get('NOaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.delete }.not_to raise_error
    end
  end
end