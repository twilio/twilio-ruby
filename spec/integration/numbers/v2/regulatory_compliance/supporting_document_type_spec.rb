##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'SupportingDocumentType' do
  it "can read" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.numbers.v2.regulatory_compliance \
                        .supporting_document_types.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    headers = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://numbers.twilio.com/v2/RegulatoryCompliance/SupportingDocumentTypes',
    ))).to eq(true)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "supporting_document_types": [],
          "meta": {
              "page": 0,
              "page_size": 50,
              "first_page_url": "https://numbers.twilio.com/v2/RegulatoryCompliance/SupportingDocumentTypes?PageSize=50&Page=0",
              "previous_page_url": null,
              "url": "https://numbers.twilio.com/v2/RegulatoryCompliance/SupportingDocumentTypes?PageSize=50&Page=0",
              "next_page_url": null,
              "key": "supporting_document_types"
          }
      }
      ]
    ))

    actual = @client.numbers.v2.regulatory_compliance \
                               .supporting_document_types.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_full responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "supporting_document_types": [
              {
                  "sid": "OYaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "friendly_name": "Passport",
                  "machine_name": "passport",
                  "fields": [
                      {
                          "friendly_name": "Last Name",
                          "machine_name": "last_name",
                          "constraint": "String"
                      }
                  ],
                  "url": "https://numbers.twilio.com/v2/RegulatoryCompliance/SupportingDocumentTypes/OYaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
              }
          ],
          "meta": {
              "page": 0,
              "page_size": 50,
              "first_page_url": "https://numbers.twilio.com/v2/RegulatoryCompliance/SupportingDocumentTypes?PageSize=50&Page=0",
              "previous_page_url": null,
              "url": "https://numbers.twilio.com/v2/RegulatoryCompliance/SupportingDocumentTypes?PageSize=50&Page=0",
              "next_page_url": null,
              "key": "supporting_document_types"
          }
      }
      ]
    ))

    actual = @client.numbers.v2.regulatory_compliance \
                               .supporting_document_types.list()

    expect(actual).to_not eq(nil)
  end

  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.numbers.v2.regulatory_compliance \
                        .supporting_document_types('OYXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    headers = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://numbers.twilio.com/v2/RegulatoryCompliance/SupportingDocumentTypes/OYXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "sid": "OYaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "friendly_name": "Passport",
          "machine_name": "passport",
          "fields": [
              {
                  "friendly_name": "Last Name",
                  "machine_name": "last_name",
                  "constraint": "String"
              }
          ],
          "url": "https://numbers.twilio.com/v2/RegulatoryCompliance/SupportingDocumentTypes/OYaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.numbers.v2.regulatory_compliance \
                               .supporting_document_types('OYXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()

    expect(actual).to_not eq(nil)
  end
end