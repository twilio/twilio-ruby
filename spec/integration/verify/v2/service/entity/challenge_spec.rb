##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'Challenge' do
  it "can create" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.verify.v2.services('VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .entities('identity') \
                       .challenges.create(factor_sid: 'YFXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {'FactorSid' => 'YFXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://verify.twilio.com/v2/Services/VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Entities/identity/Challenges',
        data: values,
    ))).to eq(true)
  end

  it "receives create_push responses" do
    @holodeck.mock(Twilio::Response.new(
        201,
      %q[
      {
          "sid": "YC03aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "service_sid": "VAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "entity_sid": "YEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "identity": "ff483d1ff591898a9942916050d2ca3f",
          "factor_sid": "YF03aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "date_responded": "2015-07-30T20:00:00Z",
          "expiration_date": "2015-07-30T20:00:00Z",
          "status": "pending",
          "responded_reason": "none",
          "details": {
              "message": "Hi! Mr. John Doe, would you like to sign up?",
              "date": "2020-07-01T12:13:14Z",
              "fields": [
                  {
                      "label": "Action",
                      "value": "Sign up in portal"
                  }
              ]
          },
          "hidden_details": {
              "ip": "172.168.1.234"
          },
          "metadata": null,
          "factor_type": "push",
          "url": "https://verify.twilio.com/v2/Services/VAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Entities/ff483d1ff591898a9942916050d2ca3f/Challenges/YC03aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "links": {
              "notifications": "https://verify.twilio.com/v2/Services/VAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Entities/ff483d1ff591898a9942916050d2ca3f/Challenges/YC03aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Notifications"
          }
      }
      ]
    ))

    actual = @client.verify.v2.services('VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .entities('identity') \
                              .challenges.create(factor_sid: 'YFXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')

    expect(actual).to_not eq(nil)
  end

  it "receives create_totp_without_auth_payload responses" do
    @holodeck.mock(Twilio::Response.new(
        201,
      %q[
      {
          "sid": "YC02aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "service_sid": "VAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "entity_sid": "YEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "identity": "ff483d1ff591898a9942916050d2ca3f",
          "factor_sid": "YF02aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "date_responded": "2015-07-30T20:00:00Z",
          "expiration_date": "2015-07-30T20:00:00Z",
          "status": "pending",
          "responded_reason": "none",
          "details": {
              "message": "Hi! Mr. John Doe, would you like to sign up?",
              "date": "2020-07-01T12:13:14Z",
              "fields": [
                  {
                      "label": "Action",
                      "value": "Sign up in portal"
                  }
              ]
          },
          "hidden_details": {
              "ip": "172.168.1.234"
          },
          "metadata": null,
          "factor_type": "totp",
          "url": "https://verify.twilio.com/v2/Services/VAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Entities/ff483d1ff591898a9942916050d2ca3f/Challenges/YC02aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "links": {
              "notifications": "https://verify.twilio.com/v2/Services/VAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Entities/ff483d1ff591898a9942916050d2ca3f/Challenges/YC02aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Notifications"
          }
      }
      ]
    ))

    actual = @client.verify.v2.services('VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .entities('identity') \
                              .challenges.create(factor_sid: 'YFXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')

    expect(actual).to_not eq(nil)
  end

  it "receives create_totp_with_auth_payload responses" do
    @holodeck.mock(Twilio::Response.new(
        201,
      %q[
      {
          "sid": "YC02aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "service_sid": "VAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "entity_sid": "YEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "identity": "ff483d1ff591898a9942916050d2ca3f",
          "factor_sid": "YF02aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "date_responded": "2015-07-30T20:00:00Z",
          "expiration_date": "2015-07-30T20:00:00Z",
          "status": "approved",
          "responded_reason": "none",
          "details": {
              "message": "Hi! Mr. John Doe, would you like to sign up?",
              "date": "2020-07-01T12:13:14Z",
              "fields": [
                  {
                      "label": "Action",
                      "value": "Sign up in portal"
                  }
              ]
          },
          "hidden_details": {
              "ip": "172.168.1.234"
          },
          "metadata": null,
          "factor_type": "totp",
          "url": "https://verify.twilio.com/v2/Services/VAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Entities/ff483d1ff591898a9942916050d2ca3f/Challenges/YC02aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "links": {
              "notifications": "https://verify.twilio.com/v2/Services/VAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Entities/ff483d1ff591898a9942916050d2ca3f/Challenges/YC02aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Notifications"
          }
      }
      ]
    ))

    actual = @client.verify.v2.services('VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .entities('identity') \
                              .challenges.create(factor_sid: 'YFXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')

    expect(actual).to_not eq(nil)
  end

  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.verify.v2.services('VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .entities('identity') \
                       .challenges('YCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://verify.twilio.com/v2/Services/VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Entities/identity/Challenges/YCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives fetch_sid responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "sid": "YCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "service_sid": "VAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "entity_sid": "YEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "identity": "ff483d1ff591898a9942916050d2ca3f",
          "factor_sid": "YFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "date_responded": "2015-07-30T20:00:00Z",
          "expiration_date": "2015-07-30T20:00:00Z",
          "status": "approved",
          "responded_reason": "none",
          "details": {
              "message": "Hi! Mr. John Doe, would you like to sign up?",
              "date": "2020-07-01T12:13:14Z",
              "fields": [
                  {
                      "label": "Action",
                      "value": "Sign up in portal"
                  }
              ]
          },
          "hidden_details": {
              "ip": "172.168.1.234"
          },
          "metadata": {
              "os": "Android"
          },
          "factor_type": "push",
          "url": "https://verify.twilio.com/v2/Services/VAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Entities/ff483d1ff591898a9942916050d2ca3f/Challenges/YCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "links": {
              "notifications": "https://verify.twilio.com/v2/Services/VAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Entities/ff483d1ff591898a9942916050d2ca3f/Challenges/YCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Notifications"
          }
      }
      ]
    ))

    actual = @client.verify.v2.services('VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .entities('identity') \
                              .challenges('YCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()

    expect(actual).to_not eq(nil)
  end

  it "can read" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.verify.v2.services('VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .entities('identity') \
                       .challenges.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://verify.twilio.com/v2/Services/VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Entities/identity/Challenges',
    ))).to eq(true)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "challenges": [],
          "meta": {
              "page": 0,
              "page_size": 50,
              "first_page_url": "https://verify.twilio.com/v2/Services/VAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Entities/ff483d1ff591898a9942916050d2ca3f/Challenges?PageSize=50&Page=0",
              "previous_page_url": null,
              "url": "https://verify.twilio.com/v2/Services/VAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Entities/ff483d1ff591898a9942916050d2ca3f/Challenges?PageSize=50&Page=0",
              "next_page_url": null,
              "key": "challenges"
          }
      }
      ]
    ))

    actual = @client.verify.v2.services('VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .entities('identity') \
                              .challenges.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_full responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "challenges": [
              {
                  "sid": "YC03aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "service_sid": "VAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "entity_sid": "YEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "identity": "ff483d1ff591898a9942916050d2ca3f",
                  "factor_sid": "YF03aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "date_created": "2015-07-30T20:00:00Z",
                  "date_updated": "2015-07-30T20:00:00Z",
                  "date_responded": "2015-07-30T20:00:00Z",
                  "expiration_date": "2015-07-30T20:00:00Z",
                  "status": "pending",
                  "responded_reason": "none",
                  "details": {
                      "message": "Hi! Mr. John Doe, would you like to sign up?",
                      "date": "2020-07-01T12:13:14Z",
                      "fields": [
                          {
                              "label": "Action",
                              "value": "Sign up in portal"
                          }
                      ]
                  },
                  "hidden_details": {
                      "ip": "172.168.1.234"
                  },
                  "metadata": null,
                  "factor_type": "push",
                  "url": "https://verify.twilio.com/v2/Services/VAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Entities/ff483d1ff591898a9942916050d2ca3f/Challenges/YC03aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "links": {
                      "notifications": "https://verify.twilio.com/v2/Services/VAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Entities/ff483d1ff591898a9942916050d2ca3f/Challenges/YC03aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Notifications"
                  }
              },
              {
                  "sid": "YC02aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "service_sid": "VAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "entity_sid": "YEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "identity": "ff483d1ff591898a9942916050d2ca3f",
                  "factor_sid": "YF02aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "date_created": "2015-07-30T20:00:00Z",
                  "date_updated": "2015-07-30T20:00:00Z",
                  "date_responded": "2015-07-30T20:00:00Z",
                  "expiration_date": "2015-07-30T20:00:00Z",
                  "status": "pending",
                  "responded_reason": "none",
                  "details": {
                      "message": "Hi! Mr. John Doe, would you like to sign up?",
                      "date": "2020-07-01T12:13:14Z",
                      "fields": [
                          {
                              "label": "Action",
                              "value": "Sign up in portal"
                          }
                      ]
                  },
                  "hidden_details": {
                      "ip": "172.168.1.234"
                  },
                  "metadata": null,
                  "factor_type": "totp",
                  "url": "https://verify.twilio.com/v2/Services/VAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Entities/ff483d1ff591898a9942916050d2ca3f/Challenges/YC02aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "links": {
                      "notifications": "https://verify.twilio.com/v2/Services/VAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Entities/ff483d1ff591898a9942916050d2ca3f/Challenges/YC02aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Notifications"
                  }
              }
          ],
          "meta": {
              "page": 0,
              "page_size": 50,
              "first_page_url": "https://verify.twilio.com/v2/Services/VAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Entities/ff483d1ff591898a9942916050d2ca3f/Challenges?PageSize=50&Page=0",
              "previous_page_url": null,
              "url": "https://verify.twilio.com/v2/Services/VAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Entities/ff483d1ff591898a9942916050d2ca3f/Challenges?PageSize=50&Page=0",
              "next_page_url": null,
              "key": "challenges"
          }
      }
      ]
    ))

    actual = @client.verify.v2.services('VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .entities('identity') \
                              .challenges.list()

    expect(actual).to_not eq(nil)
  end

  it "can update" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.verify.v2.services('VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .entities('identity') \
                       .challenges('YCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()
    }.to raise_exception(Twilio::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://verify.twilio.com/v2/Services/VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Entities/identity/Challenges/YCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives verify_push responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "sid": "YC03aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "service_sid": "VAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "entity_sid": "YEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "identity": "ff483d1ff591898a9942916050d2ca3f",
          "factor_sid": "YF03aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "date_responded": "2015-07-30T20:00:00Z",
          "expiration_date": "2015-07-30T20:00:00Z",
          "status": "approved",
          "responded_reason": "none",
          "details": {
              "message": "Hi! Mr. John Doe, would you like to sign up?",
              "date": "2020-07-01T12:13:14Z",
              "fields": [
                  {
                      "label": "Action",
                      "value": "Sign up in portal"
                  }
              ]
          },
          "hidden_details": {
              "ip": "172.168.1.234"
          },
          "metadata": {
              "os": "Android"
          },
          "factor_type": "push",
          "url": "https://verify.twilio.com/v2/Services/VAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Entities/ff483d1ff591898a9942916050d2ca3f/Challenges/YC03aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "links": {
              "notifications": "https://verify.twilio.com/v2/Services/VAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Entities/ff483d1ff591898a9942916050d2ca3f/Challenges/YC03aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Notifications"
          }
      }
      ]
    ))

    actual = @client.verify.v2.services('VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .entities('identity') \
                              .challenges('YCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()

    expect(actual).to_not eq(nil)
  end

  it "receives verify_totp responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "sid": "YC02aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "service_sid": "VAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "entity_sid": "YEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "identity": "ff483d1ff591898a9942916050d2ca3f",
          "factor_sid": "YF02aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "date_responded": "2015-07-30T20:00:00Z",
          "expiration_date": "2015-07-30T20:00:00Z",
          "status": "approved",
          "responded_reason": "none",
          "details": {
              "message": "Hi! Mr. John Doe, would you like to sign up?",
              "date": "2020-07-01T12:13:14Z",
              "fields": [
                  {
                      "label": "Action",
                      "value": "Sign up in portal"
                  }
              ]
          },
          "hidden_details": {
              "ip": "172.168.1.234"
          },
          "metadata": null,
          "factor_type": "totp",
          "url": "https://verify.twilio.com/v2/Services/VAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Entities/ff483d1ff591898a9942916050d2ca3f/Challenges/YC02aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "links": {
              "notifications": "https://verify.twilio.com/v2/Services/VAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Entities/ff483d1ff591898a9942916050d2ca3f/Challenges/YC02aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Notifications"
          }
      }
      ]
    ))

    actual = @client.verify.v2.services('VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .entities('identity') \
                              .challenges('YCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()

    expect(actual).to_not eq(nil)
  end
end