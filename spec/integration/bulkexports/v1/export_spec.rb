##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'Export' do
  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.bulkexports.v1.exports('resource_type').fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    headers = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://bulkexports.twilio.com/v1/Exports/resource_type',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "resource_type": "Calls",
          "url": "https://bulkexports.twilio.com/v1/Exports/Calls",
          "links": {
              "days": "https://bulkexports.twilio.com/v1/Exports/Calls/Days"
          }
      }
      ]
    ))

    actual = @client.bulkexports.v1.exports('resource_type').fetch()

    expect(actual).to_not eq(nil)
  end
end