##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'Service' do
  it "can create" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.notify.v1.services.create()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    headers = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://notify.twilio.com/v1/Services',
    ))).to eq(true)
  end

  it "receives create responses" do
    @holodeck.mock(Twilio::Response.new(
        201,
      %q[
      {
          "sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "friendly_name": "733c7f0f-6541-42ec-84ce-e2ae1cac588c",
          "date_created": "2016-03-09T20:22:31Z",
          "date_updated": "2016-03-09T20:22:31Z",
          "apn_credential_sid": null,
          "gcm_credential_sid": null,
          "fcm_credential_sid": null,
          "messaging_service_sid": null,
          "facebook_messenger_page_id": "4",
          "alexa_skill_id": null,
          "default_apn_notification_protocol_version": "3",
          "default_gcm_notification_protocol_version": "3",
          "default_fcm_notification_protocol_version": "3",
          "default_alexa_notification_protocol_version": "3",
          "log_enabled": true,
          "type": "S",
          "delivery_callback_url": "Hello",
          "delivery_callback_enabled": true,
          "url": "https://notify.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "links": {
              "bindings": "https://notify.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Bindings",
              "notifications": "https://notify.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Notifications",
              "segments": "https://notify.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Segments",
              "users": "https://notify.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Users"
          }
      }
      ]
    ))

    actual = @client.notify.v1.services.create()

    expect(actual).to_not eq(nil)
  end

  it "can delete" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.notify.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    headers = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'delete',
        url: 'https://notify.twilio.com/v1/Services/ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives delete responses" do
    @holodeck.mock(Twilio::Response.new(
        204,
      nil,
    ))

    actual = @client.notify.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()

    expect(actual).to eq(true)
  end

  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.notify.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    headers = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://notify.twilio.com/v1/Services/ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "friendly_name": "733c7f0f-6541-42ec-84ce-e2ae1cac588c",
          "date_created": "2016-03-09T20:22:31Z",
          "date_updated": "2016-03-09T20:22:31Z",
          "apn_credential_sid": null,
          "gcm_credential_sid": null,
          "fcm_credential_sid": null,
          "messaging_service_sid": null,
          "facebook_messenger_page_id": "4",
          "alexa_skill_id": null,
          "default_apn_notification_protocol_version": "3",
          "default_gcm_notification_protocol_version": "3",
          "default_fcm_notification_protocol_version": "3",
          "default_alexa_notification_protocol_version": "3",
          "log_enabled": true,
          "type": "S",
          "delivery_callback_url": "Hello",
          "delivery_callback_enabled": true,
          "url": "https://notify.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "links": {
              "bindings": "https://notify.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Bindings",
              "notifications": "https://notify.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Notifications",
              "segments": "https://notify.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Segments",
              "users": "https://notify.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Users"
          }
      }
      ]
    ))

    actual = @client.notify.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()

    expect(actual).to_not eq(nil)
  end

  it "can read" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.notify.v1.services.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    headers = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://notify.twilio.com/v1/Services',
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
              "first_page_url": "https://notify.twilio.com/v1/Services?PageSize=50&Page=0",
              "previous_page_url": null,
              "url": "https://notify.twilio.com/v1/Services?PageSize=50&Page=0",
              "next_page_url": null,
              "key": "services"
          },
          "services": [
              {
                  "sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "friendly_name": "733c7f0f-6541-42ec-84ce-e2ae1cac588c",
                  "date_created": "2016-03-09T20:22:31Z",
                  "date_updated": "2016-03-09T20:22:31Z",
                  "apn_credential_sid": null,
                  "gcm_credential_sid": null,
                  "fcm_credential_sid": null,
                  "messaging_service_sid": null,
                  "facebook_messenger_page_id": "4",
                  "alexa_skill_id": null,
                  "default_apn_notification_protocol_version": "3",
                  "default_gcm_notification_protocol_version": "3",
                  "default_fcm_notification_protocol_version": "3",
                  "default_alexa_notification_protocol_version": "3",
                  "log_enabled": true,
                  "type": "S",
                  "delivery_callback_url": "Hello",
                  "delivery_callback_enabled": true,
                  "url": "https://notify.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "links": {
                      "bindings": "https://notify.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Bindings",
                      "notifications": "https://notify.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Notifications",
                      "segments": "https://notify.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Segments",
                      "users": "https://notify.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Users"
                  }
              }
          ]
      }
      ]
    ))

    actual = @client.notify.v1.services.list()

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
              "first_page_url": "https://notify.twilio.com/v1/Services?PageSize=50&Page=0",
              "previous_page_url": null,
              "url": "https://notify.twilio.com/v1/Services?PageSize=50&Page=0",
              "next_page_url": null,
              "key": "services"
          },
          "services": []
      }
      ]
    ))

    actual = @client.notify.v1.services.list()

    expect(actual).to_not eq(nil)
  end

  it "can update" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.notify.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    headers = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://notify.twilio.com/v1/Services/ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives update responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "friendly_name": "733c7f0f-6541-42ec-84ce-e2ae1cac588c",
          "date_created": "2016-03-09T20:22:31Z",
          "date_updated": "2016-03-09T20:22:31Z",
          "apn_credential_sid": null,
          "gcm_credential_sid": null,
          "fcm_credential_sid": null,
          "default_apn_notification_protocol_version": "3",
          "default_gcm_notification_protocol_version": "3",
          "default_fcm_notification_protocol_version": "3",
          "default_alexa_notification_protocol_version": "3",
          "messaging_service_sid": null,
          "alexa_skill_id": null,
          "facebook_messenger_page_id": "4",
          "log_enabled": true,
          "type": "S",
          "delivery_callback_url": "Hello",
          "delivery_callback_enabled": true,
          "url": "https://notify.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "links": {
              "bindings": "https://notify.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Bindings",
              "notifications": "https://notify.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Notifications",
              "segments": "https://notify.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Segments",
              "users": "https://notify.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Users"
          }
      }
      ]
    ))

    actual = @client.notify.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()

    expect(actual).to_not eq(nil)
  end
end