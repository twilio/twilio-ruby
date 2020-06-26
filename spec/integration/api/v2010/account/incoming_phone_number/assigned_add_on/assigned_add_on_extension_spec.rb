##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'AssignedAddOnExtension' do
  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .incoming_phone_numbers('PNXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .assigned_add_ons('XEXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .extensions('XFXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    headers = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://api.twilio.com/2010-04-01/Accounts/ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/IncomingPhoneNumbers/PNXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/AssignedAddOns/XEXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Extensions/XFXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.json',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "sid": "XFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "assigned_add_on_sid": "XEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "resource_sid": "PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "friendly_name": "Incoming Voice Call",
          "product_name": "Programmable Voice",
          "unique_name": "voice-incoming",
          "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IncomingPhoneNumbers/PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/AssignedAddOns/XEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Extensions/XFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
          "enabled": true
      }
      ]
    ))

    actual = @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .incoming_phone_numbers('PNXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .assigned_add_ons('XEXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .extensions('XFXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()

    expect(actual).to_not eq(nil)
  end

  it "can read" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .incoming_phone_numbers('PNXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .assigned_add_ons('XEXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .extensions.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    headers = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://api.twilio.com/2010-04-01/Accounts/ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/IncomingPhoneNumbers/PNXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/AssignedAddOns/XEXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Extensions.json',
    ))).to eq(true)
  end

  it "receives read_full responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "end": 0,
          "first_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IncomingPhoneNumbers/PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/AssignedAddOns/XEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Extensions.json?PageSize=50&Page=0",
          "next_page_uri": null,
          "page": 0,
          "page_size": 50,
          "previous_page_uri": null,
          "extensions": [
              {
                  "sid": "XFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "assigned_add_on_sid": "XEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "resource_sid": "PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "friendly_name": "Incoming Voice Call",
                  "product_name": "Programmable Voice",
                  "unique_name": "voice-incoming",
                  "enabled": true,
                  "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IncomingPhoneNumbers/PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/AssignedAddOns/XEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Extensions/XFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
              }
          ],
          "start": 0,
          "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IncomingPhoneNumbers/PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/AssignedAddOns/XEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Extensions.json?PageSize=50&Page=0"
      }
      ]
    ))

    actual = @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .incoming_phone_numbers('PNXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .assigned_add_ons('XEXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .extensions.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "end": 0,
          "first_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IncomingPhoneNumbers/PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/AssignedAddOns/XEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Extensions.json?PageSize=50&Page=0",
          "next_page_uri": null,
          "page": 0,
          "page_size": 50,
          "previous_page_uri": null,
          "extensions": [],
          "start": 0,
          "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IncomingPhoneNumbers/PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/AssignedAddOns/XEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Extensions.json?PageSize=50&Page=0"
      }
      ]
    ))

    actual = @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .incoming_phone_numbers('PNXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .assigned_add_ons('XEXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .extensions.list()

    expect(actual).to_not eq(nil)
  end
end