##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'Country' do
  it "can read" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.pricing.v2.voice \
                        .countries.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    headers = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://pricing.twilio.com/v2/Voice/Countries',
    ))).to eq(true)
  end

  it "receives read_full responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "countries": [
              {
                  "country": "Andorra",
                  "iso_country": "AD",
                  "url": "https://pricing.twilio.com/v2/Voice/Countries/AD"
              }
          ],
          "meta": {
              "first_page_url": "https://pricing.twilio.com/v2/Voice/Countries?PageSize=50&Page=0",
              "key": "countries",
              "next_page_url": null,
              "page": 0,
              "page_size": 50,
              "previous_page_url": null,
              "url": "https://pricing.twilio.com/v2/Voice/Countries?PageSize=50&Page=0"
          }
      }
      ]
    ))

    actual = @client.pricing.v2.voice \
                               .countries.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "countries": [],
          "meta": {
              "first_page_url": "https://pricing.twilio.com/v2/Voice/Countries?PageSize=50&Page=0",
              "key": "countries",
              "next_page_url": null,
              "page": 0,
              "page_size": 50,
              "previous_page_url": null,
              "url": "https://pricing.twilio.com/v2/Voice/Countries?PageSize=50&Page=0"
          }
      }
      ]
    ))

    actual = @client.pricing.v2.voice \
                               .countries.list()

    expect(actual).to_not eq(nil)
  end

  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.pricing.v2.voice \
                        .countries('US').fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    headers = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://pricing.twilio.com/v2/Voice/Countries/US',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "country": "United States",
          "inbound_call_prices": [
              {
                  "base_price": "0.0085",
                  "current_price": "0.0085",
                  "number_type": "local"
              },
              {
                  "base_price": "0.022",
                  "current_price": "0.022",
                  "number_type": "toll free"
              }
          ],
          "iso_country": "US",
          "outbound_prefix_prices": [
              {
                  "base_price": "0.090",
                  "current_price": "0.090",
                  "destination_prefixes": [
                      "1907"
                  ],
                  "friendly_name": "Programmable Outbound Minute - United States - Alaska",
                  "origination_prefixes": [
                      "ALL"
                  ]
              },
              {
                  "base_price": "0.013",
                  "current_price": "0.013",
                  "destination_prefixes": [
                      "1808"
                  ],
                  "friendly_name": "Programmable Outbound Minute - United States - Hawaii",
                  "origination_prefixes": [
                      "ALL"
                  ]
              },
              {
                  "base_price": "0.013",
                  "current_price": "0.013",
                  "destination_prefixes": [
                      "1800",
                      "1844",
                      "1855",
                      "1866",
                      "1877",
                      "1888"
                  ],
                  "friendly_name": "Programmable Outbound Minute - United States & Canada - Toll Free",
                  "origination_prefixes": [
                      "ALL"
                  ]
              },
              {
                  "base_price": "0.013",
                  "current_price": "0.013",
                  "destination_prefixes": [
                      "1"
                  ],
                  "friendly_name": "Programmable Outbound Minute - United States & Canada",
                  "origination_prefixes": [
                      "ALL"
                  ]
              }
          ],
          "price_unit": "USD",
          "url": "https://pricing.twilio.com/v2/Voice/Countries/US"
      }
      ]
    ))

    actual = @client.pricing.v2.voice \
                               .countries('US').fetch()

    expect(actual).to_not eq(nil)
  end
end