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
end
