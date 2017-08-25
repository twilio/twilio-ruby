##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

require 'spec_helper.rb'

describe 'Participant' do
  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.preview.proxy.services("KSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                           .sessions("KCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                           .participants("KPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://preview.twilio.com/Proxy/Services/KSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Sessions/KCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants/KPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "service_sid": "KSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "participant_type": "sms",
          "identifier": "identifier",
          "date_updated": "2015-07-30T20:00:00Z",
          "proxy_identifier": "proxy_identifier",
          "friendly_name": "friendly_name",
          "date_created": "2015-07-30T20:00:00Z",
          "url": "https://preview.twilio.com/Proxy/Services/KSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Sessions/KCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants/KPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "links": {
              "message_interactions": "https://preview.twilio.com/Proxy/Services/KSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Sessions/KCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants/KPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/MessageInteractions"
          },
          "sid": "KPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "session_sid": "KCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.preview.proxy.services("KSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                  .sessions("KCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                  .participants("KPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").fetch()

    expect(actual).to_not eq(nil)
  end

  it "can read" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.preview.proxy.services("KSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                           .sessions("KCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                           .participants.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://preview.twilio.com/Proxy/Services/KSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Sessions/KCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants',
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
              "url": "https://preview.twilio.com/Proxy/Services/KSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Sessions/KCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants?PageSize=50&Page=0",
              "page": 0,
              "first_page_url": "https://preview.twilio.com/Proxy/Services/KSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Sessions/KCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants?PageSize=50&Page=0",
              "page_size": 50,
              "key": "participants"
          },
          "participants": []
      }
      ]
    ))

    actual = @client.preview.proxy.services("KSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                  .sessions("KCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                  .participants.list()

    expect(actual).to_not eq(nil)
  end

  it "can create" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.preview.proxy.services("KSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                           .sessions("KCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                           .participants.create(identifier: "identifier")
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {
        'Identifier' => "identifier",
    }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://preview.twilio.com/Proxy/Services/KSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Sessions/KCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants',
        data: values,
    ))).to eq(true)
  end

  it "receives create responses" do
    @holodeck.mock(Twilio::Response.new(
        201,
      %q[
      {
          "service_sid": "KSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "participant_type": "sms",
          "identifier": "identifier",
          "date_updated": "2015-07-30T20:00:00Z",
          "proxy_identifier": "proxy_identifier",
          "friendly_name": "friendly_name",
          "date_created": "2015-07-30T20:00:00Z",
          "url": "https://preview.twilio.com/Proxy/Services/KSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Sessions/KCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants/KPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "links": {
              "message_interactions": "https://preview.twilio.com/Proxy/Services/KSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Sessions/KCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants/KPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/MessageInteractions"
          },
          "sid": "KPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "session_sid": "KCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.preview.proxy.services("KSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                  .sessions("KCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                  .participants.create(identifier: "identifier")

    expect(actual).to_not eq(nil)
  end

  it "can delete" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.preview.proxy.services("KSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                           .sessions("KCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                           .participants("KPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").delete()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'delete',
        url: 'https://preview.twilio.com/Proxy/Services/KSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Sessions/KCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants/KPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
    ))).to eq(true)
  end

  it "receives delete responses" do
    @holodeck.mock(Twilio::Response.new(
        204,
      nil,
    ))

    actual = @client.preview.proxy.services("KSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                  .sessions("KCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                  .participants("KPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").delete()

    expect(actual).to eq(true)
  end

  it "can update" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.preview.proxy.services("KSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                           .sessions("KCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                           .participants("KPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").update()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://preview.twilio.com/Proxy/Services/KSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Sessions/KCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants/KPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
    ))).to eq(true)
  end

  it "receives update responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "service_sid": "KSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "participant_type": "sms",
          "identifier": "identifier",
          "date_updated": "2015-07-30T20:00:00Z",
          "proxy_identifier": "proxy_identifier",
          "friendly_name": "friendly_name",
          "date_created": "2015-07-30T20:00:00Z",
          "url": "https://preview.twilio.com/Proxy/Services/KSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Sessions/KCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants/KPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "links": {
              "message_interactions": "https://preview.twilio.com/Proxy/Services/KSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Sessions/KCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants/KPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/MessageInteractions"
          },
          "sid": "KPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "session_sid": "KCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.preview.proxy.services("KSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                  .sessions("KCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                  .participants("KPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").update()

    expect(actual).to_not eq(nil)
  end
end