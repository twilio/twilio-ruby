##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'RateLimit' do
  it "can create" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.verify.v2.services('VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .rate_limits.create(unique_name: 'unique_name')
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {'UniqueName' => 'unique_name', }
    headers = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://verify.twilio.com/v2/Services/VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/RateLimits',
        data: values,
    ))).to eq(true)
  end

  it "receives create_rate_limit responses" do
    @holodeck.mock(Twilio::Response.new(
        201,
      %q[
      {
          "sid": "RKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "service_sid": "VAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "unique_name": "unique.name",
          "description": "Description",
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "url": "https://verify.twilio.com/v2/Services/VAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/RateLimits/RKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "links": {
              "buckets": "https://verify.twilio.com/v2/Services/VAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/RateLimits/RKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Buckets"
          }
      }
      ]
    ))

    actual = @client.verify.v2.services('VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .rate_limits.create(unique_name: 'unique_name')

    expect(actual).to_not eq(nil)
  end

  it "can update" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.verify.v2.services('VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .rate_limits('RKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    headers = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://verify.twilio.com/v2/Services/VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/RateLimits/RKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives update_rate_limit responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "sid": "RKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "service_sid": "VAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "unique_name": "unique.name",
          "description": "Description",
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "url": "https://verify.twilio.com/v2/Services/VAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/RateLimits/RKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "links": {
              "buckets": "https://verify.twilio.com/v2/Services/VAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/RateLimits/RKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Buckets"
          }
      }
      ]
    ))

    actual = @client.verify.v2.services('VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .rate_limits('RKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()

    expect(actual).to_not eq(nil)
  end

  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.verify.v2.services('VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .rate_limits('RKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    headers = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://verify.twilio.com/v2/Services/VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/RateLimits/RKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives fetch_rate_limit responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "sid": "RKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "service_sid": "VAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "unique_name": "unique.name",
          "description": "Description",
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "url": "https://verify.twilio.com/v2/Services/VAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/RateLimits/RKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "links": {
              "buckets": "https://verify.twilio.com/v2/Services/VAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/RateLimits/RKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Buckets"
          }
      }
      ]
    ))

    actual = @client.verify.v2.services('VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .rate_limits('RKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()

    expect(actual).to_not eq(nil)
  end

  it "can read" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.verify.v2.services('VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .rate_limits.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    headers = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://verify.twilio.com/v2/Services/VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/RateLimits',
    ))).to eq(true)
  end

  it "receives read_all responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "meta": {
              "page": 0,
              "page_size": 50,
              "first_page_url": "https://verify.twilio.com/v2/Services/VAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/RateLimits?PageSize=50&Page=0",
              "previous_page_url": null,
              "next_page_url": null,
              "key": "rate_limits",
              "url": "https://verify.twilio.com/v2/Services/VAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/RateLimits?PageSize=50&Page=0"
          },
          "rate_limits": [
              {
                  "sid": "RKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "service_sid": "VAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "unique_name": "unique.name",
                  "description": "Description",
                  "date_created": "2015-07-30T20:00:00Z",
                  "date_updated": "2015-07-30T20:00:00Z",
                  "url": "https://verify.twilio.com/v2/Services/VAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/RateLimits/RKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "links": {
                      "buckets": "https://verify.twilio.com/v2/Services/VAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/RateLimits/RKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Buckets"
                  }
              }
          ]
      }
      ]
    ))

    actual = @client.verify.v2.services('VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .rate_limits.list()

    expect(actual).to_not eq(nil)
  end

  it "can delete" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.verify.v2.services('VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .rate_limits('RKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    headers = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'delete',
        url: 'https://verify.twilio.com/v2/Services/VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/RateLimits/RKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives delete responses" do
    @holodeck.mock(Twilio::Response.new(
        204,
      nil,
    ))

    actual = @client.verify.v2.services('VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .rate_limits('RKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()

    expect(actual).to eq(true)
  end
end