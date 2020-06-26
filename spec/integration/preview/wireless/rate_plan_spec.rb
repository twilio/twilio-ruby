##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'RatePlan' do
  it "can read" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.preview.wireless.rate_plans.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    headers = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://preview.twilio.com/wireless/RatePlans',
    ))).to eq(true)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "meta": {
              "first_page_url": "https://preview.twilio.com/wireless/RatePlans?PageSize=50&Page=0",
              "key": "rate_plans",
              "next_page_url": null,
              "page": 0,
              "page_size": 50,
              "previous_page_url": null,
              "url": "https://preview.twilio.com/wireless/RatePlans?PageSize=50&Page=0"
          },
          "rate_plans": []
      }
      ]
    ))

    actual = @client.preview.wireless.rate_plans.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_full responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "meta": {
              "first_page_url": "https://preview.twilio.com/wireless/RatePlans?PageSize=50&Page=0",
              "key": "rate_plans",
              "next_page_url": null,
              "page": 0,
              "page_size": 50,
              "previous_page_url": null,
              "url": "https://preview.twilio.com/wireless/RatePlans?PageSize=50&Page=0"
          },
          "rate_plans": [
              {
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "unique_name": "unique_name",
                  "data_enabled": true,
                  "data_limit": 1000,
                  "data_metering": "pooled",
                  "date_created": "2015-07-30T20:00:00Z",
                  "date_updated": "2015-07-30T20:00:00Z",
                  "friendly_name": "friendly_name",
                  "messaging_enabled": true,
                  "voice_enabled": true,
                  "national_roaming_enabled": true,
                  "international_roaming": [
                      "data",
                      "messaging",
                      "voice"
                  ],
                  "sid": "WPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "url": "https://preview.twilio.com/wireless/RatePlans/WPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
              }
          ]
      }
      ]
    ))

    actual = @client.preview.wireless.rate_plans.list()

    expect(actual).to_not eq(nil)
  end

  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.preview.wireless.rate_plans('WPXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    headers = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://preview.twilio.com/wireless/RatePlans/WPXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "unique_name": "unique_name",
          "data_enabled": true,
          "data_limit": 1000,
          "data_metering": "pooled",
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "friendly_name": "friendly_name",
          "messaging_enabled": true,
          "voice_enabled": true,
          "national_roaming_enabled": true,
          "international_roaming": [
              "data",
              "messaging",
              "voice"
          ],
          "sid": "WPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "url": "https://preview.twilio.com/wireless/RatePlans/WPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.preview.wireless.rate_plans('WPXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()

    expect(actual).to_not eq(nil)
  end

  it "can create" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.preview.wireless.rate_plans.create()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    headers = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://preview.twilio.com/wireless/RatePlans',
    ))).to eq(true)
  end

  it "receives create responses" do
    @holodeck.mock(Twilio::Response.new(
        201,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "unique_name": "unique_name",
          "data_enabled": true,
          "data_limit": 1000,
          "data_metering": "pooled",
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "friendly_name": "friendly_name",
          "messaging_enabled": true,
          "voice_enabled": true,
          "national_roaming_enabled": true,
          "international_roaming": [
              "data",
              "messaging",
              "voice"
          ],
          "sid": "WPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "url": "https://preview.twilio.com/wireless/RatePlans/WPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.preview.wireless.rate_plans.create()

    expect(actual).to_not eq(nil)
  end

  it "can update" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.preview.wireless.rate_plans('WPXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    headers = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://preview.twilio.com/wireless/RatePlans/WPXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives update responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "unique_name": "unique_name",
          "data_enabled": true,
          "data_limit": 1000,
          "data_metering": "pooled",
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "friendly_name": "friendly_name",
          "messaging_enabled": true,
          "voice_enabled": true,
          "national_roaming_enabled": true,
          "international_roaming": [
              "data",
              "messaging",
              "voice"
          ],
          "sid": "WPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "url": "https://preview.twilio.com/wireless/RatePlans/WPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.preview.wireless.rate_plans('WPXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()

    expect(actual).to_not eq(nil)
  end

  it "can delete" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.preview.wireless.rate_plans('WPXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    headers = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'delete',
        url: 'https://preview.twilio.com/wireless/RatePlans/WPXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives delete responses" do
    @holodeck.mock(Twilio::Response.new(
        204,
      nil,
    ))

    actual = @client.preview.wireless.rate_plans('WPXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()

    expect(actual).to eq(true)
  end
end