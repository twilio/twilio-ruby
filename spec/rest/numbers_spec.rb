require 'spec_helper'

describe Twilio::REST::Country do

  before do
    @country = Twilio::REST::Country.new('someUri', 'someClient')
  end

  it 'sets up a local resources object' do
    expect(@country).to respond_to(:local)
    expect(@country.local.instance_variable_get('@path')).to eq('someUri/Local')
  end

  it 'sets up a toll_free resources object' do
    expect(@country).to respond_to(:toll_free)
    expect(@country.toll_free.instance_variable_get('@path')).to eq(
      'someUri/TollFree'
    )
  end

  it 'sets up a mobile resources object' do
    expect(@country).to respond_to(:mobile)
    expect(@country.mobile.instance_variable_get('@path')).to eq(
      'someUri/Mobile'
    )
  end

end

describe Twilio::REST::NumberType do

  before do
    @incoming_phone_numbers = Twilio::REST::IncomingPhoneNumbers.new(
      'someUri', 'someClient'
    )
  end

  it 'sets up a local resources object' do
    expect(@incoming_phone_numbers).to respond_to(:local)
    expect(@incoming_phone_numbers.local.instance_variable_get('@path')).to eq(
      'someUri/Local'
    )
  end

  it 'sets up a toll_free resources object' do
    expect(@incoming_phone_numbers).to respond_to(:toll_free)
    expect(@incoming_phone_numbers.toll_free.instance_variable_get('@path')).to(
      eq('someUri/TollFree')
    )
  end

  it 'sets up a mobile resources object' do
    expect(@incoming_phone_numbers).to respond_to(:mobile)
    expect(@incoming_phone_numbers.mobile.instance_variable_get('@path')).to eq(
      'someUri/Mobile'
    )
  end
end
