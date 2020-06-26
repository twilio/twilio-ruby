##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'BrandedChannel' do
  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.preview.trusted_comms.businesses('BXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                   .brands('BZXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                   .branded_channels('BWXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    headers = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://preview.twilio.com/TrustedComms/Businesses/BXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Brands/BZXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/BrandedChannels/BWXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "business_sid": "BXaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "brand_sid": "BZaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "sid": "BWaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "links": {
              "channels": "https://preview.twilio.com/TrustedComms/Businesses/BXaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Brands/BZaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/BrandedChannels/BWaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels"
          },
          "url": "https://preview.twilio.com/TrustedComms/Businesses/BXaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Brands/BZaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/BrandedChannels/BWaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.preview.trusted_comms.businesses('BXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                          .brands('BZXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                          .branded_channels('BWXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()

    expect(actual).to_not eq(nil)
  end
end