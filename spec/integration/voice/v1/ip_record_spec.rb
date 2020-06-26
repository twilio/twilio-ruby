##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'IpRecord' do
  it "can create" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.voice.v1.ip_records.create(ip_address: 'ip_address')
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {'IpAddress' => 'ip_address', }
    headers = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://voice.twilio.com/v1/IpRecords',
        data: values,
    ))).to eq(true)
  end

  it "receives create responses" do
    @holodeck.mock(Twilio::Response.new(
        201,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "sid": "ILaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "friendly_name": "friendly_name",
          "ip_address": "10.2.3.4",
          "cidr_prefix_length": 30,
          "date_created": "2020-03-18T23:31:36Z",
          "date_updated": "2020-03-18T23:31:36Z",
          "url": "https://voice.twilio.com/v1/IpRecords/ILaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.voice.v1.ip_records.create(ip_address: 'ip_address')

    expect(actual).to_not eq(nil)
  end

  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.voice.v1.ip_records('ILXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    headers = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://voice.twilio.com/v1/IpRecords/ILXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "sid": "ILaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "friendly_name": "friendly_name",
          "ip_address": "10.2.3.4",
          "cidr_prefix_length": 30,
          "date_created": "2020-03-18T23:31:36Z",
          "date_updated": "2020-03-18T23:31:37Z",
          "url": "https://voice.twilio.com/v1/IpRecords/ILaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.voice.v1.ip_records('ILXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()

    expect(actual).to_not eq(nil)
  end

  it "can read" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.voice.v1.ip_records.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    headers = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://voice.twilio.com/v1/IpRecords',
    ))).to eq(true)
  end

  it "receives read_full responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "meta": {
              "page": 0,
              "page_size": 50,
              "first_page_url": "https://voice.twilio.com/v1/IpRecords?PageSize=50&Page=0",
              "previous_page_url": null,
              "url": "https://voice.twilio.com/v1/IpRecords?PageSize=50&Page=0",
              "next_page_url": null,
              "key": "ip_records"
          },
          "ip_records": [
              {
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "sid": "ILaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "friendly_name": "friendly_name",
                  "ip_address": "10.2.3.4",
                  "cidr_prefix_length": 30,
                  "date_created": "2020-03-18T23:31:36Z",
                  "date_updated": "2020-03-18T23:31:37Z",
                  "url": "https://voice.twilio.com/v1/IpRecords/ILaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
              }
          ]
      }
      ]
    ))

    actual = @client.voice.v1.ip_records.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "meta": {
              "page": 0,
              "page_size": 50,
              "first_page_url": "https://voice.twilio.com/v1/IpRecords?PageSize=50&Page=0",
              "previous_page_url": null,
              "url": "https://voice.twilio.com/v1/IpRecords?PageSize=50&Page=0",
              "next_page_url": null,
              "key": "ip_records"
          },
          "ip_records": []
      }
      ]
    ))

    actual = @client.voice.v1.ip_records.list()

    expect(actual).to_not eq(nil)
  end

  it "can update" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.voice.v1.ip_records('ILXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    headers = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://voice.twilio.com/v1/IpRecords/ILXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives update responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "sid": "ILaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "friendly_name": "update_name",
          "ip_address": "10.2.3.4",
          "cidr_prefix_length": 30,
          "date_created": "2020-03-18T23:31:36Z",
          "date_updated": "2020-03-18T23:31:37Z",
          "url": "https://voice.twilio.com/v1/IpRecords/ILaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.voice.v1.ip_records('ILXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()

    expect(actual).to_not eq(nil)
  end

  it "can delete" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.voice.v1.ip_records('ILXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    headers = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'delete',
        url: 'https://voice.twilio.com/v1/IpRecords/ILXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives delete responses" do
    @holodeck.mock(Twilio::Response.new(
        204,
      nil,
    ))

    actual = @client.voice.v1.ip_records('ILXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()

    expect(actual).to eq(true)
  end
end