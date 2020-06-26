##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'FlowRevision' do
  it "can read" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.studio.v2.flows('FWXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .revisions.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    headers = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://studio.twilio.com/v2/Flows/FWXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Revisions',
    ))).to eq(true)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "meta": {
              "previous_page_url": null,
              "next_page_url": null,
              "url": "https://studio.twilio.com/v2/Flows/FWaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Revisions?PageSize=50&Page=0",
              "page": 0,
              "first_page_url": "https://studio.twilio.com/v2/Flows/FWaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Revisions?PageSize=50&Page=0",
              "page_size": 50,
              "key": "revisions"
          },
          "revisions": [
              {
                  "sid": "FWaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "friendly_name": "Test Flow",
                  "status": "published",
                  "revision": 1,
                  "definition": null,
                  "commit_message": null,
                  "valid": null,
                  "errors": null,
                  "date_created": "2017-11-06T12:00:00Z",
                  "date_updated": "2017-11-06T12:00:00Z",
                  "url": "https://studio.twilio.com/v2/Flows/FWaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Revisions/1"
              }
          ]
      }
      ]
    ))

    actual = @client.studio.v2.flows('FWXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .revisions.list()

    expect(actual).to_not eq(nil)
  end

  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.studio.v2.flows('FWXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .revisions('revision').fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    headers = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://studio.twilio.com/v2/Flows/FWXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Revisions/revision',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "sid": "FWaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "definition": {
              "initial_state": "Trigger"
          },
          "friendly_name": "Test Flow",
          "status": "published",
          "revision": 1,
          "commit_message": null,
          "valid": true,
          "errors": [],
          "date_created": "2017-11-06T12:00:00Z",
          "date_updated": null,
          "url": "https://studio.twilio.com/v2/Flows/FWaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Revisions/1"
      }
      ]
    ))

    actual = @client.studio.v2.flows('FWXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .revisions('revision').fetch()

    expect(actual).to_not eq(nil)
  end
end