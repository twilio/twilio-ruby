##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

require 'spec_helper.rb'

describe 'AssignedAddOnExtension' do
  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.api.v2010.accounts("ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                       .incoming_phone_numbers("PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                       .assigned_add_ons("XEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                       .extensions("XFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IncomingPhoneNumbers/PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/AssignedAddOns/XEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Extensions/XFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json',
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

    actual = @client.api.v2010.accounts("ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                              .incoming_phone_numbers("PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                              .assigned_add_ons("XEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                              .extensions("XFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").fetch()

    expect(actual).to_not eq(nil)
  end

  it "can read" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.api.v2010.accounts("ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                       .incoming_phone_numbers("PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                       .assigned_add_ons("XEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                       .extensions.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IncomingPhoneNumbers/PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/AssignedAddOns/XEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Extensions.json',
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

    actual = @client.api.v2010.accounts("ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                              .incoming_phone_numbers("PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                              .assigned_add_ons("XEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
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

    actual = @client.api.v2010.accounts("ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                              .incoming_phone_numbers("PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                              .assigned_add_ons("XEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                              .extensions.list()

    expect(actual).to_not eq(nil)
  end
end