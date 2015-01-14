require 'spec_helper'

describe Twilio::REST::PricingClient do
  before do
    @client = Twilio::REST::PricingClient.new('AC123', 'foobar')
  end

  it 'should set up a voice resources object' do
    expect(@client).to respond_to(:voice)
    expect(@client.voice.instance_variable_get('@path')).to eq(
      '/v1/Voice'
    )
  end

  it 'should set up the country list resource on voice' do
    voice = @client.voice
    expect(voice).to respond_to(:countries)
    expect(voice.countries.instance_variable_get('@path')).to eq(
      '/v1/Voice/Countries'
    )
  end

  it 'should set up the numbers resource on voice' do
    voice = @client.voice
    expect(voice).to respond_to(:numbers)
    expect(voice.numbers.instance_variable_get('@path')).to eq(
      '/v1/Voice/Numbers'
    )
  end

  it 'should set up a phone numbers resource object' do
    expect(@client).to respond_to(:phone_numbers)
    expect(@client.phone_numbers.instance_variable_get('@path')).to eq(
      '/v1/PhoneNumbers'
    )
  end

  it 'should set up a countries list on phone numbers' do
    numbers = @client.phone_numbers
    expect(numbers).to respond_to(:countries)
    expect(numbers.countries.instance_variable_get('@path')).to eq(
      '/v1/PhoneNumbers/Countries'
    )
  end
end
