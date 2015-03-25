require 'spec_helper'

describe Twilio::REST::Lookups::PhoneNumbers do
  it 'creates a phone_number object' do
    client = Twilio::REST::LookupsClient.new 'otherSid', 'otherToken'
    expect(client).to respond_to(:phone_numbers)
  end
end
