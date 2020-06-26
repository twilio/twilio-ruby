##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'Member' do
  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.ip_messaging.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                             .channels('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                             .members('MBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    headers = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://chat.twilio.com/v1/Services/ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Channels/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Members/MBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "sid": "MBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "channel_sid": "CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "identity": "jing",
          "role_sid": "RLaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "last_consumed_message_index": null,
          "last_consumption_timestamp": null,
          "date_created": "2016-03-24T21:05:50Z",
          "date_updated": "2016-03-24T21:05:50Z",
          "url": "https://chat.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Members/MBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.ip_messaging.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                    .channels('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                    .members('MBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()

    expect(actual).to_not eq(nil)
  end

  it "can create" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.ip_messaging.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                             .channels('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                             .members.create(identity: 'identity')
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {'Identity' => 'identity', }
    headers = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://chat.twilio.com/v1/Services/ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Channels/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Members',
        data: values,
    ))).to eq(true)
  end

  it "receives create responses" do
    @holodeck.mock(Twilio::Response.new(
        201,
      %q[
      {
          "sid": "MBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "channel_sid": "CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "identity": "jing",
          "role_sid": "RLaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "last_consumed_message_index": null,
          "last_consumption_timestamp": null,
          "date_created": "2016-03-24T21:05:50Z",
          "date_updated": "2016-03-24T21:05:50Z",
          "url": "https://chat.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Members/MBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.ip_messaging.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                    .channels('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                    .members.create(identity: 'identity')

    expect(actual).to_not eq(nil)
  end

  it "can read" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.ip_messaging.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                             .channels('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                             .members.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    headers = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://chat.twilio.com/v1/Services/ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Channels/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Members',
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
              "first_page_url": "https://chat.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Members?PageSize=50&Page=0",
              "previous_page_url": null,
              "url": "https://chat.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Members?PageSize=50&Page=0",
              "next_page_url": null,
              "key": "members"
          },
          "members": [
              {
                  "sid": "MBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "channel_sid": "CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "identity": "jing",
                  "role_sid": "RLaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "last_consumed_message_index": null,
                  "last_consumption_timestamp": null,
                  "date_created": "2016-03-24T21:05:50Z",
                  "date_updated": "2016-03-24T21:05:50Z",
                  "url": "https://chat.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Members/MBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
              }
          ]
      }
      ]
    ))

    actual = @client.ip_messaging.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                    .channels('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                    .members.list()

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
              "first_page_url": "https://chat.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Members?PageSize=50&Page=0",
              "previous_page_url": null,
              "url": "https://chat.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Members?PageSize=50&Page=0",
              "next_page_url": null,
              "key": "members"
          },
          "members": []
      }
      ]
    ))

    actual = @client.ip_messaging.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                    .channels('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                    .members.list()

    expect(actual).to_not eq(nil)
  end

  it "can delete" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.ip_messaging.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                             .channels('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                             .members('MBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    headers = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'delete',
        url: 'https://chat.twilio.com/v1/Services/ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Channels/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Members/MBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives delete responses" do
    @holodeck.mock(Twilio::Response.new(
        204,
      nil,
    ))

    actual = @client.ip_messaging.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                    .channels('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                    .members('MBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()

    expect(actual).to eq(true)
  end

  it "can update" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.ip_messaging.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                             .channels('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                             .members('MBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    headers = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://chat.twilio.com/v1/Services/ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Channels/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Members/MBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives update_role_sid responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "sid": "MBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "channel_sid": "CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "identity": "jing",
          "role_sid": "RLaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "last_consumed_message_index": null,
          "last_consumption_timestamp": null,
          "date_created": "2016-03-24T21:05:50Z",
          "date_updated": "2016-03-24T21:05:50Z",
          "url": "https://chat.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Members/MBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.ip_messaging.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                    .channels('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                    .members('MBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()

    expect(actual).to_not eq(nil)
  end

  it "receives update_last_consumed_message_index responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "sid": "MBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "channel_sid": "CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "identity": "jing",
          "role_sid": "RLaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "last_consumed_message_index": 666,
          "last_consumption_timestamp": null,
          "date_created": "2016-03-24T21:05:50Z",
          "date_updated": "2016-03-24T21:05:50Z",
          "url": "https://chat.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Members/MBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.ip_messaging.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                    .channels('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                    .members('MBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()

    expect(actual).to_not eq(nil)
  end
end