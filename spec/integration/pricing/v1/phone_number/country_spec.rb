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
      @client.pricing.v1.phone_numbers \
                        .countries.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    headers = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://pricing.twilio.com/v1/PhoneNumbers/Countries',
    ))).to eq(true)
  end

  it "receives read_full responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "countries": [
              {
                  "country": "Austria",
                  "iso_country": "AT",
                  "url": "https://pricing.twilio.com/v1/PhoneNumbers/Countries/AT"
              }
          ],
          "meta": {
              "page": 0,
              "page_size": 50,
              "first_page_url": "https://pricing.twilio.com/v1/PhoneNumbers/Countries?PageSize=50&Page=0",
              "previous_page_url": null,
              "url": "https://pricing.twilio.com/v1/PhoneNumbers/Countries?PageSize=50&Page=0",
              "next_page_url": null,
              "key": "countries"
          }
      }
      ]
    ))

    actual = @client.pricing.v1.phone_numbers \
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
              "first_page_url": "https://pricing.twilio.com/v1/PhoneNumbers/Countries?PageSize=50&Page=0",
              "key": "countries",
              "next_page_url": null,
              "page": 0,
              "page_size": 50,
              "previous_page_url": null,
              "url": "https://pricing.twilio.com/v1/PhoneNumbers/Countries?PageSize=50&Page=0"
          }
      }
      ]
    ))

    actual = @client.pricing.v1.phone_numbers \
                               .countries.list()

    expect(actual).to_not eq(nil)
  end

  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.pricing.v1.phone_numbers \
                        .countries('US').fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    headers = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://pricing.twilio.com/v1/PhoneNumbers/Countries/US',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "country": "United States",
          "iso_country": "US",
          "phone_number_prices": [
              {
                  "number_type": "local",
                  "base_price": "1.00",
                  "current_price": "1.00"
              },
              {
                  "number_type": "toll free",
                  "base_price": "2.00",
                  "current_price": "2.00"
              }
          ],
          "price_unit": "USD",
          "url": "https://pricing.twilio.com/v1/PhoneNumbers/Countries/US"
      }
      ]
    ))

    actual = @client.pricing.v1.phone_numbers \
                               .countries('US').fetch()

    expect(actual).to_not eq(nil)
  end
end