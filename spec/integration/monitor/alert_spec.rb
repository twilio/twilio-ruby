require 'spec_helper'

describe Twilio::Resources::Monitor::AlertList do
  context "should fetch alerts" do
    it "and succeed" do
      client = Twilio::REST::MonitorClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "alert_text": "sourceComponent=14100&httpResponse=500&url=https%3A%2F%2Fcommunicate-indonesia-staging.appspot.com%2Fv1%2Fsms%2Ftwilio&ErrorCode=11200&LogLevel=ERROR&Msg=Internal+Server+Error&EmailNotification=false",
       "api_version": "2008-08-01",
       "date_created": "2015-08-29T17:20:16Z",
       "date_generated": "2015-08-29T17:20:14Z",
       "date_updated": "2015-08-29T17:20:16Z",
       "error_code": "11200",
       "log_level": "error",
       "more_info": "https://www.twilio.com/docs/errors/11200",
       "request_method": "POST",
       "request_url": "https://www.example.com",
       "request_variables": "ToCountry=US&ToState=CA&SmsMessageSid=SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa&NumMedia=0&ToCity=&FromZip=94965&SmsSid=SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa&FromState=CA&SmsStatus=received&FromCity=SAN+FRANCISCO&Body=plan+5+potato&FromCountry=US&To=%2B14152148152&ToZip=&NumSegments=1&MessageSid=SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa&AccountSid=ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa&From=%2B14159152352&ApiVersion=2010-04-01",
       "resource_sid": "SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "response_body": "lbhalbha",
       "response_headers": "X-Cache=MISS+from+ip-10-183-144-31.ec2.internal&Server=Google+Frontend&X-Cache-Lookup=MISS+from+ip-10-183-144-31.ec2.internal%3A3128&Alt-Svc=quic%3D%22%3A443%22%3B+p%3D%221%22%3B+ma%3D604800&Content-Length=323&Content-Type=text%2Fhtml%3B+charset%3DUTF-8&Date=Sat%2C+29+Aug+2015+17%3A20%3A16+GMT&Alternate-Protocol=443%3Aquic%2Cp%3D1",
       "sid": "NOaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "url": "https://monitor.twilio.com/v1/Alerts/NOaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
          >))
      resource = client.alerts.get('NOaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.sid }.not_to raise_error
    end
  
    it "and receive" do
      client = Twilio::REST::MonitorClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "alert_text": "sourceComponent=14100&httpResponse=500&url=https%3A%2F%2Fcommunicate-indonesia-staging.appspot.com%2Fv1%2Fsms%2Ftwilio&ErrorCode=11200&LogLevel=ERROR&Msg=Internal+Server+Error&EmailNotification=false",
       "api_version": "2008-08-01",
       "date_created": "2015-08-29T17:20:16Z",
       "date_generated": "2015-08-29T17:20:14Z",
       "date_updated": "2015-08-29T17:20:16Z",
       "error_code": "11200",
       "log_level": "error",
       "more_info": "https://www.twilio.com/docs/errors/11200",
       "request_method": "POST",
       "request_url": "https://www.example.com",
       "request_variables": "ToCountry=US&ToState=CA&SmsMessageSid=SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa&NumMedia=0&ToCity=&FromZip=94965&SmsSid=SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa&FromState=CA&SmsStatus=received&FromCity=SAN+FRANCISCO&Body=plan+5+potato&FromCountry=US&To=%2B14152148152&ToZip=&NumSegments=1&MessageSid=SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa&AccountSid=ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa&From=%2B14159152352&ApiVersion=2010-04-01",
       "resource_sid": "SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "response_body": "lbhalbha",
       "response_headers": "X-Cache=MISS+from+ip-10-183-144-31.ec2.internal&Server=Google+Frontend&X-Cache-Lookup=MISS+from+ip-10-183-144-31.ec2.internal%3A3128&Alt-Svc=quic%3D%22%3A443%22%3B+p%3D%221%22%3B+ma%3D604800&Content-Length=323&Content-Type=text%2Fhtml%3B+charset%3DUTF-8&Date=Sat%2C+29+Aug+2015+17%3A20%3A16+GMT&Alternate-Protocol=443%3Aquic%2Cp%3D1",
       "sid": "NOaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
       "url": "https://monitor.twilio.com/v1/Alerts/NOaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
          >))
      resource = client.alerts.get('NOaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.sid }.not_to raise_error
    end
  end

  context "should read alerts" do
    it "and succeed" do
      client = Twilio::REST::MonitorClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "alerts": [
        {
         "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "alert_text": "sourceComponent=14100&httpResponse=500&url=https%3A%2F%2Fcommunicate-indonesia-staging.appspot.com%2Fv1%2Fsms%2Ftwilio&ErrorCode=11200&LogLevel=ERROR&Msg=Internal+Server+Error&EmailNotification=false",
         "api_version": "2008-08-01",
         "date_created": "2015-08-29T17:20:16Z",
         "date_generated": "2015-08-29T17:20:14Z",
         "date_updated": "2015-08-29T17:20:16Z",
         "error_code": "11200",
         "log_level": "error",
         "more_info": "https://www.twilio.com/docs/errors/11200",
         "request_method": "POST",
         "request_url": "https://www.example.com",
         "resource_sid": "SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "sid": "NOaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "url": "https://monitor.twilio.com/v1/Alerts/NOaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
        }
       ],
       "meta": {
        "first_page_url": "https://monitor.twilio.com/v1/Alerts?PageSize=1&Page=0",
        "key": "alerts",
        "next_page_url": null,
        "page": 0,
        "page_size": 1,
        "previous_page_url": null,
        "url": "https://monitor.twilio.com/v1/Alerts?PageSize=1&Page=0"
       }
      }
          >))
      expect { client.alerts.list(:'EndDate' => Date.new(2008, 1, 1), :'LogLevel' => "log_level", :'StartDate' => Date.new(2008, 1, 1)) }.not_to raise_error
    end
  
    it "and receive" do
      client = Twilio::REST::MonitorClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, %q<
          {
       "alerts": [
        {
         "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "alert_text": "sourceComponent=14100&httpResponse=500&url=https%3A%2F%2Fcommunicate-indonesia-staging.appspot.com%2Fv1%2Fsms%2Ftwilio&ErrorCode=11200&LogLevel=ERROR&Msg=Internal+Server+Error&EmailNotification=false",
         "api_version": "2008-08-01",
         "date_created": "2015-08-29T17:20:16Z",
         "date_generated": "2015-08-29T17:20:14Z",
         "date_updated": "2015-08-29T17:20:16Z",
         "error_code": "11200",
         "log_level": "error",
         "more_info": "https://www.twilio.com/docs/errors/11200",
         "request_method": "POST",
         "request_url": "https://www.example.com",
         "resource_sid": "SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "sid": "NOaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
         "url": "https://monitor.twilio.com/v1/Alerts/NOaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
        }
       ],
       "meta": {
        "first_page_url": "https://monitor.twilio.com/v1/Alerts?PageSize=1&Page=0",
        "key": "alerts",
        "next_page_url": null,
        "page": 0,
        "page_size": 1,
        "previous_page_url": null,
        "url": "https://monitor.twilio.com/v1/Alerts?PageSize=1&Page=0"
       }
      }
          >))
      expect { client.alerts.list(:'EndDate' => Date.new(2008, 1, 1), :'LogLevel' => "log_level", :'StartDate' => Date.new(2008, 1, 1)) }.not_to raise_error
    end
  end
end

describe Twilio::Resources::Monitor::AlertInstance do
  context "should delete alerts" do
    it "and succeed" do
      client = Twilio::REST::MonitorClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, '{}'))
      resource = client.alerts.get('NOaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.delete }.not_to raise_error
    end
  
    it "and receive" do
      client = Twilio::REST::MonitorClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      client.http_client_class = Holodeck
      holodeck = client.http_client
      holodeck.mock(Hologram::ANY,
                              Twilio::REST::TwilioResponse.new(200, '{}'))
      resource = client.alerts.get('NOaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      expect { resource.delete }.not_to raise_error
    end
  end
end