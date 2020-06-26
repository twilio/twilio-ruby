##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'Payment' do
  it "can create" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .calls('CAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .payments.create(idempotency_key: 'idempotency_key', status_callback: 'https://example.com')
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {'IdempotencyKey' => 'idempotency_key', 'StatusCallback' => 'https://example.com', }
    headers = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://api.twilio.com/2010-04-01/Accounts/ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Calls/CAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Payments.json',
        data: values,
    ))).to eq(true)
  end

  it "receives start_payment_session_success responses" do
    @holodeck.mock(Twilio::Response.new(
        201,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "call_sid": "CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "Wed, 18 Dec 2019 20:02:01 +0000",
          "date_updated": "Wed, 18 Dec 2019 20:02:01 +0000",
          "sid": "PKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Calls/CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Payments/PKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
      ]
    ))

    actual = @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .calls('CAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .payments.create(idempotency_key: 'idempotency_key', status_callback: 'https://example.com')

    expect(actual).to_not eq(nil)
  end

  it "can update" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .calls('CAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .payments('PKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update(idempotency_key: 'idempotency_key', status_callback: 'https://example.com')
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {'IdempotencyKey' => 'idempotency_key', 'StatusCallback' => 'https://example.com', }
    headers = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://api.twilio.com/2010-04-01/Accounts/ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Calls/CAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Payments/PKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.json',
        data: values,
    ))).to eq(true)
  end

  it "receives collect_credit_card_number responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "call_sid": "CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "Wed, 18 Dec 2019 20:02:01 +0000",
          "date_updated": "Wed, 18 Dec 2019 20:02:01 +0000",
          "sid": "PKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Calls/CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Payments/PKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
      ]
    ))

    actual = @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .calls('CAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .payments('PKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update(idempotency_key: 'idempotency_key', status_callback: 'https://example.com')

    expect(actual).to_not eq(nil)
  end

  it "receives collect_credit_card_expiry_date responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "call_sid": "CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "Wed, 18 Dec 2019 20:02:01 +0000",
          "date_updated": "Wed, 18 Dec 2019 20:02:01 +0000",
          "sid": "PKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Calls/CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Payments/PKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
      ]
    ))

    actual = @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .calls('CAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .payments('PKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update(idempotency_key: 'idempotency_key', status_callback: 'https://example.com')

    expect(actual).to_not eq(nil)
  end

  it "receives complete_payment responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "call_sid": "CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "Wed, 18 Dec 2019 20:02:01 +0000",
          "date_updated": "Wed, 18 Dec 2019 20:02:01 +0000",
          "sid": "PKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Calls/CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Payments/PKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
      ]
    ))

    actual = @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .calls('CAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .payments('PKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update(idempotency_key: 'idempotency_key', status_callback: 'https://example.com')

    expect(actual).to_not eq(nil)
  end
end