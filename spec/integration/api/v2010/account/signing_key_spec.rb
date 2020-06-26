##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'SigningKey' do
  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .signing_keys('SKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    headers = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://api.twilio.com/2010-04-01/Accounts/ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/SigningKeys/SKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.json',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "sid": "SKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "friendly_name": "foo",
          "date_created": "Mon, 13 Jun 2016 22:50:08 +0000",
          "date_updated": "Mon, 13 Jun 2016 22:50:08 +0000"
      }
      ]
    ))

    actual = @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .signing_keys('SKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()

    expect(actual).to_not eq(nil)
  end

  it "can update" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .signing_keys('SKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    headers = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://api.twilio.com/2010-04-01/Accounts/ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/SigningKeys/SKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.json',
    ))).to eq(true)
  end

  it "receives update responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "sid": "SKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "friendly_name": "foo",
          "date_created": "Mon, 13 Jun 2016 22:50:08 +0000",
          "date_updated": "Mon, 13 Jun 2016 22:50:08 +0000"
      }
      ]
    ))

    actual = @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .signing_keys('SKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()

    expect(actual).to_not eq(nil)
  end

  it "can delete" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .signing_keys('SKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    headers = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'delete',
        url: 'https://api.twilio.com/2010-04-01/Accounts/ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/SigningKeys/SKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.json',
    ))).to eq(true)
  end

  it "receives delete responses" do
    @holodeck.mock(Twilio::Response.new(
        204,
      nil,
    ))

    actual = @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .signing_keys('SKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()

    expect(actual).to eq(true)
  end

  it "can read" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .signing_keys.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    headers = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://api.twilio.com/2010-04-01/Accounts/ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/SigningKeys.json',
    ))).to eq(true)
  end

  it "receives read_full responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "signing_keys": [
              {
                  "sid": "SKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "friendly_name": "foo",
                  "date_created": "Mon, 13 Jun 2016 22:50:08 +0000",
                  "date_updated": "Mon, 13 Jun 2016 22:50:08 +0000"
              }
          ],
          "first_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SigningKeys.json?PageSize=50&Page=0",
          "end": 0,
          "previous_page_uri": null,
          "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SigningKeys.json?PageSize=50&Page=0",
          "page_size": 50,
          "start": 0,
          "next_page_uri": null,
          "page": 0
      }
      ]
    ))

    actual = @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .signing_keys.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "signing_keys": [],
          "first_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SigningKeys.json?PageSize=50&Page=0",
          "end": 0,
          "previous_page_uri": null,
          "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SigningKeys.json?PageSize=50&Page=0",
          "page_size": 50,
          "start": 0,
          "next_page_uri": null,
          "page": 0
      }
      ]
    ))

    actual = @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .signing_keys.list()

    expect(actual).to_not eq(nil)
  end
end