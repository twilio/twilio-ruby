##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'Sim' do
  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.wireless.v1.sims('DEXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    headers = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://wireless.twilio.com/v1/Sims/DEXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "unique_name": "unique_name",
          "commands_callback_method": "http_method",
          "commands_callback_url": "http://www.example.com",
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "friendly_name": "friendly_name",
          "sms_fallback_method": "http_method",
          "sms_fallback_url": "http://www.example.com",
          "sms_method": "http_method",
          "sms_url": "http://www.example.com",
          "voice_fallback_method": "http_method",
          "voice_fallback_url": "http://www.example.com",
          "voice_method": "http_method",
          "voice_url": "http://www.example.com",
          "links": {
              "data_sessions": "https://wireless.twilio.com/v1/Sims/DEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/DataSessions",
              "rate_plan": "https://wireless.twilio.com/v1/RatePlans/WPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
              "usage_records": "https://wireless.twilio.com/v1/Sims/DEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/UsageRecords"
          },
          "rate_plan_sid": "WPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "sid": "DEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "iccid": "iccid",
          "e_id": "e_id",
          "status": "new",
          "reset_status": null,
          "url": "https://wireless.twilio.com/v1/Sims/DEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "ip_address": "192.168.1.1"
      }
      ]
    ))

    actual = @client.wireless.v1.sims('DEXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()

    expect(actual).to_not eq(nil)
  end

  it "can read" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.wireless.v1.sims.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    headers = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://wireless.twilio.com/v1/Sims',
    ))).to eq(true)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "sims": [],
          "meta": {
              "first_page_url": "https://wireless.twilio.com/v1/Sims?Status=new&Iccid=iccid&RatePlan=rate_plan&PageSize=50&Page=0",
              "key": "sims",
              "next_page_url": null,
              "page": 0,
              "page_size": 50,
              "previous_page_url": null,
              "url": "https://wireless.twilio.com/v1/Sims?Status=new&Iccid=iccid&RatePlan=rate_plan&PageSize=50&Page=0"
          }
      }
      ]
    ))

    actual = @client.wireless.v1.sims.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_full responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "sims": [
              {
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "unique_name": "unique_name",
                  "commands_callback_method": "http_method",
                  "commands_callback_url": "http://www.example.com",
                  "date_created": "2015-07-30T20:00:00Z",
                  "date_updated": "2015-07-30T20:00:00Z",
                  "friendly_name": "friendly_name",
                  "links": {
                      "data_sessions": "https://wireless.twilio.com/v1/Sims/DEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/DataSessions",
                      "rate_plan": "https://wireless.twilio.com/v1/RatePlans/WPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                      "usage_records": "https://wireless.twilio.com/v1/Sims/DEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/UsageRecords"
                  },
                  "rate_plan_sid": "WPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "sid": "DEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "iccid": "iccid",
                  "e_id": "e_id",
                  "status": "new",
                  "reset_status": "resetting",
                  "sms_fallback_method": "http_method",
                  "sms_fallback_url": "http://www.example.com",
                  "sms_method": "http_method",
                  "sms_url": "http://www.example.com",
                  "voice_fallback_method": "http_method",
                  "voice_fallback_url": "http://www.example.com",
                  "voice_method": "http_method",
                  "voice_url": "http://www.example.com",
                  "url": "https://wireless.twilio.com/v1/Sims/DEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "ip_address": "192.168.1.30"
              }
          ],
          "meta": {
              "first_page_url": "https://wireless.twilio.com/v1/Sims?Status=new&Iccid=iccid&RatePlan=rate_plan&PageSize=50&Page=0",
              "key": "sims",
              "next_page_url": null,
              "page": 0,
              "page_size": 50,
              "previous_page_url": null,
              "url": "https://wireless.twilio.com/v1/Sims?Status=new&Iccid=iccid&RatePlan=rate_plan&PageSize=50&Page=0"
          }
      }
      ]
    ))

    actual = @client.wireless.v1.sims.list()

    expect(actual).to_not eq(nil)
  end

  it "can update" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.wireless.v1.sims('DEXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    headers = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://wireless.twilio.com/v1/Sims/DEXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives update responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "unique_name": "unique_name",
          "commands_callback_method": "http_method",
          "commands_callback_url": "http://www.example.com",
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "friendly_name": "friendly_name",
          "links": {
              "data_sessions": "https://wireless.twilio.com/v1/Sims/DEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/DataSessions",
              "rate_plan": "https://wireless.twilio.com/v1/RatePlans/WPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
              "usage_records": "https://wireless.twilio.com/v1/Sims/DEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/UsageRecords"
          },
          "rate_plan_sid": "WPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "sid": "DEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "iccid": "iccid",
          "e_id": "e_id",
          "status": "new",
          "reset_status": null,
          "sms_fallback_method": "http_method",
          "sms_fallback_url": "http://www.example.com",
          "sms_method": "http_method",
          "sms_url": "http://www.example.com",
          "voice_fallback_method": "http_method",
          "voice_fallback_url": "http://www.example.com",
          "voice_method": "http_method",
          "voice_url": "http://www.example.com",
          "url": "https://wireless.twilio.com/v1/Sims/DEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "ip_address": "192.168.1.30"
      }
      ]
    ))

    actual = @client.wireless.v1.sims('DEXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()

    expect(actual).to_not eq(nil)
  end

  it "receives update_move_to_subaccount responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb",
          "unique_name": "unique_name",
          "commands_callback_method": "http_method",
          "commands_callback_url": "http://www.example.com",
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "friendly_name": "friendly_name",
          "links": {
              "data_sessions": "https://wireless.twilio.com/v1/Sims/DEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/DataSessions",
              "rate_plan": "https://wireless.twilio.com/v1/RatePlans/WPbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb",
              "usage_records": "https://wireless.twilio.com/v1/Sims/DEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/UsageRecords"
          },
          "rate_plan_sid": "WPbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb",
          "sid": "DEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "iccid": "iccid",
          "e_id": "e_id",
          "status": "new",
          "reset_status": null,
          "sms_fallback_method": "http_method",
          "sms_fallback_url": "http://www.example.com",
          "sms_method": "http_method",
          "sms_url": "http://www.example.com",
          "voice_fallback_method": "http_method",
          "voice_fallback_url": "http://www.example.com",
          "voice_method": "http_method",
          "voice_url": "http://www.example.com",
          "url": "https://wireless.twilio.com/v1/Sims/DEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "ip_address": "192.168.1.30"
      }
      ]
    ))

    actual = @client.wireless.v1.sims('DEXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()

    expect(actual).to_not eq(nil)
  end

  it "receives update_reset_connectivity responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "unique_name": "unique_name",
          "commands_callback_method": "http_method",
          "commands_callback_url": "http://www.example.com",
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "friendly_name": "friendly_name",
          "links": {
              "data_sessions": "https://wireless.twilio.com/v1/Sims/DEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/DataSessions",
              "rate_plan": "https://wireless.twilio.com/v1/RatePlans/WPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
              "usage_records": "https://wireless.twilio.com/v1/Sims/DEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/UsageRecords"
          },
          "rate_plan_sid": "WPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "sid": "DEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "iccid": "iccid",
          "e_id": "e_id",
          "status": "active",
          "reset_status": "resetting",
          "sms_fallback_method": "http_method",
          "sms_fallback_url": "http://www.example.com",
          "sms_method": "http_method",
          "sms_url": "http://www.example.com",
          "voice_fallback_method": "http_method",
          "voice_fallback_url": "http://www.example.com",
          "voice_method": "http_method",
          "voice_url": "http://www.example.com",
          "url": "https://wireless.twilio.com/v1/Sims/DEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "ip_address": "192.168.1.30"
      }
      ]
    ))

    actual = @client.wireless.v1.sims('DEXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()

    expect(actual).to_not eq(nil)
  end

  it "can delete" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.wireless.v1.sims('DEXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    headers = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'delete',
        url: 'https://wireless.twilio.com/v1/Sims/DEXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives delete responses" do
    @holodeck.mock(Twilio::Response.new(
        204,
      nil,
    ))

    actual = @client.wireless.v1.sims('DEXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()

    expect(actual).to eq(true)
  end
end