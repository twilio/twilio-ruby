##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'Number' do
  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.pricing.v1.voice \
                        .numbers('+15017122661').fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    headers = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://pricing.twilio.com/v1/Voice/Numbers/%2B15017122661',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "country": "Iran",
          "inbound_call_price": {
              "base_price": null,
              "current_price": null,
              "number_type": null
          },
          "iso_country": "IR",
          "number": "+987654321",
          "outbound_call_price": {
              "base_price": "0.255",
              "current_price": "0.255"
          },
          "price_unit": "USD",
          "url": "https://pricing.twilio.com/v1/Voice/Numbers/+987654321"
      }
      ]
    ))

    actual = @client.pricing.v1.voice \
                               .numbers('+15017122661').fetch()

    expect(actual).to_not eq(nil)
  end
end