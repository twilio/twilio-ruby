require 'spec_helper'

describe 'Version Action Methods' do
  it 'receives fetch responses' do
    @holodeck.mock(
      Twilio::Response.new(
        200,
        '{
            "caller_name": null,
            "carrier": null,
            "fraud": null,
            "add_ons": null,
            "country_code": "US",
            "national_format": "(510) 867-5310",
            "phone_number": "+15108675310",
            "url": "https://lookups.twilio.com/v1/PhoneNumbers/+15108675310"
          }'
      )
    )
    actual = @client.lookups.v1.phone_numbers('+15017122661').fetch(type: 'sms')
    expect(actual).to_not eq(nil)
  end

  it 'handles redirect fetch responses' do
    @holodeck.mock(
      Twilio::Response.new(
        307,
        '{"phone_number": "+15108675310"}'
      )
    )
    actual = @client.lookups.v1.phone_numbers('+15017122661').fetch
    expect(actual).to_not eq(nil)
  end

  describe 'stream' do
    before(:each) do
      @holodeck.mock(
        Twilio::Response.new(
          200,
          '{
            "next_page_uri": "/2010-04-01/Accounts/AC123/Messages.json?Page=1",
            "messages": [{"body": "payload0"}, {"body": "payload1"}]
          }'
        )
      )
      @holodeck.mock(
        Twilio::Response.new(
          200,
          '{
            "next_page_uri": "/2010-04-01/Accounts/AC123/Messages.json?Page=2",
            "messages": [{"body": "payload2"}, {"body": "payload3"}]
          }'
        )
      )
      @holodeck.mock(
        Twilio::Response.new(
          200,
          '{
            "next_page_uri": null,
            "messages": [{"body": "payload4"}]
          }'
        )
      )
    end

    it 'streams all results' do
      actual = @client.messages.stream
      expect(actual.count).to eq(5)
    end

    it 'limits results' do
      actual = @client.messages.stream(limit: 3)
      expect(actual.count).to eq(3)
    end
  end

  it 'receives create responses' do
    @holodeck.mock(
      Twilio::Response.new(
        201,
        '{
          "auth_token": "auth_token",
          "date_created": "Thu, 30 Jul 2015 20:00:00 +0000",
          "date_updated": "Thu, 30 Jul 2015 20:00:00 +0000",
          "friendly_name": "friendly_name",
          "owner_account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "status": "active",
          "subresource_uris": {
              "available_phone_numbers": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/AvailablePhoneNumbers.json",
              "calls": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Calls.json",
              "conferences": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Conferences.json",
              "incoming_phone_numbers": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IncomingPhoneNumbers.json",
              "notifications": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Notifications.json",
              "outgoing_caller_ids": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/OutgoingCallerIds.json",
              "recordings": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Recordings.json",
              "transcriptions": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Transcriptions.json",
              "addresses": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Addresses.json",
              "signing_keys": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SigningKeys.json",
              "connect_apps": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/ConnectApps.json",
              "sip": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP.json",
              "authorized_connect_apps": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/AuthorizedConnectApps.json",
              "usage": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Usage.json",
              "keys": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Keys.json",
              "applications": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Applications.json",
              "short_codes": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SMS/ShortCodes.json",
              "queues": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Queues.json",
              "messages": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages.json",
              "balance": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Balance.json"
          },
          "type": "Full",
          "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
        }'
      )
    )
    actual = @client.api.v2010.accounts.create(friendly_name: 'friendly_name')
    expect(actual).to_not eq(nil)
  end

  it 'receives update responses' do
    @holodeck.mock(
      Twilio::Response.new(
        200,
        '{
          "auth_token": "auth_token",
          "date_created": "Thu, 30 Jul 2015 20:00:00 +0000",
          "date_updated": "Thu, 30 Jul 2015 20:00:00 +0000",
          "friendly_name": "friendly_name",
          "owner_account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "status": "active",
          "subresource_uris": {
              "available_phone_numbers": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/AvailablePhoneNumbers.json",
              "calls": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Calls.json",
              "conferences": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Conferences.json",
              "incoming_phone_numbers": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IncomingPhoneNumbers.json",
              "notifications": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Notifications.json",
              "outgoing_caller_ids": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/OutgoingCallerIds.json",
              "recordings": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Recordings.json",
              "transcriptions": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Transcriptions.json",
              "addresses": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Addresses.json",
              "signing_keys": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SigningKeys.json",
              "connect_apps": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/ConnectApps.json",
              "sip": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP.json",
              "authorized_connect_apps": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/AuthorizedConnectApps.json",
              "usage": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Usage.json",
              "keys": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Keys.json",
              "applications": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Applications.json",
              "short_codes": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SMS/ShortCodes.json",
              "queues": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Queues.json",
              "messages": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages.json",
              "balance": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Balance.json"
          },
          "type": "Full",
          "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
        }'
      )
    )
    actual = @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update(friendly_name: 'friendly_name')
    expect(actual).to_not eq(nil)
  end

  it 'receives read_full responses' do
    @holodeck.mock(
      Twilio::Response.new(
        200,
        '{
          "first_page_uri": "/2010-04-01/Accounts.json?FriendlyName=friendly_name&Status=active&PageSize=50&Page=0",
          "end": 0,
          "previous_page_uri": null,
          "accounts": [
              {
                  "auth_token": "auth_token",
                  "date_created": "Thu, 30 Jul 2015 20:00:00 +0000",
                  "date_updated": "Thu, 30 Jul 2015 20:00:00 +0000",
                  "friendly_name": "friendly_name",
                  "owner_account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "status": "active",
                  "subresource_uris": {
                      "available_phone_numbers": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/AvailablePhoneNumbers.json",
                      "calls": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Calls.json",
                      "conferences": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Conferences.json",
                      "incoming_phone_numbers": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IncomingPhoneNumbers.json",
                      "notifications": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Notifications.json",
                      "outgoing_caller_ids": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/OutgoingCallerIds.json",
                      "recordings": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Recordings.json",
                      "transcriptions": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Transcriptions.json",
                      "addresses": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Addresses.json",
                      "signing_keys": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SigningKeys.json",
                      "connect_apps": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/ConnectApps.json",
                      "sip": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SIP.json",
                      "authorized_connect_apps": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/AuthorizedConnectApps.json",
                      "usage": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Usage.json",
                      "keys": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Keys.json",
                      "applications": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Applications.json",
                      "short_codes": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SMS/ShortCodes.json",
                      "queues": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Queues.json",
                      "messages": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages.json",
                      "balance": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Balance.json"
                  },
                  "type": "Full",
                  "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
              }
            ],
            "uri": "/2010-04-01/Accounts.json?FriendlyName=friendly_name&Status=active&PageSize=50&Page=0",
            "page_size": 50,
            "start": 0,
            "next_page_uri": null,
            "page": 0
        }'
      )
    )

    actual = @client.api.v2010.accounts.list(friendly_name: 'friendly_name')

    expect(actual).to_not eq(nil)
  end

  describe 'delete' do
    it 'succeeds with status code 204' do
      @holodeck.mock(Twilio::Response.new(204, ''))
      actual = @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').messages('MMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete
      expect(actual).to eq(true)
    end

    it 'succeeds with status code 200' do
      @holodeck.mock(Twilio::Response.new(200, ''))
      actual = @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').messages('MMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete
      expect(actual).to eq(true)
    end

    it 'succeeds with status code 202' do
      @holodeck.mock(Twilio::Response.new(202, ''))
      actual = @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').messages('MMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete
      expect(actual).to eq(true)
    end

    it 'succeeds with 3xx redirect code (307)' do
      @holodeck.mock(Twilio::Response.new(307, ''))
      actual = @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').messages('MMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete
      expect(actual).to eq(true)
    end

    it 'fails with 4xx error code (404)' do
      @holodeck.mock(Twilio::Response.new(404, '{"message": "Not found"}'))
      expect {
        @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').messages('MMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete
      }.to raise_error(Twilio::REST::RestError)
    end

    it 'fails with 5xx error code (500)' do
      @holodeck.mock(Twilio::Response.new(500, '{"message": "Internal server error"}'))
      expect {
        @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').messages('MMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete
      }.to raise_error(Twilio::REST::RestError)
    end
  end
end
