require 'spec_helper'

describe Twilio::REST::Lookups::PhoneNumbers do
  it 'creates a phone_number object' do
    client = Twilio::REST::LookupsClient.new 'otherSid', 'otherToken'
    expect(client).to respond_to(:phone_numbers)
  end

  it 'gets phone numbers without special encoding' do
    number = '+13123131434'
    client = Twilio::REST::LookupsClient.new 'otherSid', 'otherToken'
    expect(client).to receive(:get).once
      .with('/v1/PhoneNumbers/+13123131434')
      .and_return({ phone_number: number })
    phone_number = client.phone_numbers.get('+13123131434').phone_number
    expect(phone_number).to be(number)
  end

  it 'URI encodes phone number path parameters' do
    number = '+13123131434'
    client = Twilio::REST::LookupsClient.new 'otherSid', 'otherToken'
    expect(client).to receive(:get).once
      .with('/v1/PhoneNumbers/+1%20312%20313%201434')
      .and_return({ phone_number: number })
    phone_number = client.phone_numbers.get('+1 312 313 1434').phone_number
    expect(phone_number).to be(number)
  end
end
