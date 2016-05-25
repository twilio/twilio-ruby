require 'spec_helper'

class UtilClass
  include Twilio::REST::Utils
end

describe UtilClass do
  subject(:util) { UtilClass.new }

  it 'should convert a parameter name to a Twilio-style name' do
    expect(util.twilify('sms_url')).to eq('SmsUrl')
  end

  it 'should convert all parameter names to Twilio-style names' do
    untwilified = {
      :sms_url => 'someUrl',
      'voiceFallbackUrl' => 'anotherUrl',
      'Status_callback' => 'yetAnotherUrl'
    }
    twilified = {
      :SmsUrl => 'someUrl',
      :VoiceFallbackUrl => 'anotherUrl',
      :StatusCallback => 'yetAnotherUrl'
    }
    expect(util.twilify(untwilified)).to eq(twilified)
  end

  it 'should convert a Twilio-style name to a parameter name' do
    expect(util.detwilify('SmsUrl')).to eq('sms_url')
  end

  it 'should convert all Twilio-style names to parameter names' do
    untwilified = {
      :sms_url => 'someUrl',
      :voice_fallback_url => 'anotherUrl',
      :status_callback => 'yetAnotherUrl'
    }
    twilified = {
      :SmsUrl => 'someUrl',
      :VoiceFallbackUrl => 'anotherUrl',
      :StatusCallback => 'yetAnotherUrl'
    }
    expect(util.detwilify(twilified)).to eq(untwilified)
  end

  it 'should convert an array of pairs to parameter names' do
    untwilified = [[ :sms_url, 'someUrl' ], [ :voice_fallback_url, 'anotherUrl' ], [ :statusCallback, 'yetAnotherUrl' ]]
    twilified = [[:SmsUrl, "someUrl"], [:VoiceFallbackUrl, "anotherUrl"], [:StatusCallback, "yetAnotherUrl"]]
    expect(util.twilify(untwilified)).to eq(twilified)
  end

  it 'should convert array of pairs of Twilio-style names to parameter names' do
    twilified = [[:SmsUrl, "someUrl"], [:VoiceFallbackUrl, "anotherUrl"], [:StatusCallback, "yetAnotherUrl"]]
    untwilified = [[ :sms_url, 'someUrl' ], [ :voice_fallback_url, 'anotherUrl' ], [ :status_callback, 'yetAnotherUrl' ]]
    expect(util.detwilify(twilified)).to eq(untwilified)
  end

  it 'should allow duplicate parameter names when converting array of pairs' do
    untwilified = [[ :type, 'carrier' ], [:other, :foo], [ :type, 'caller-name']]
    twilified = [[:Type, "carrier"], [:Other, "foo"], [:Type, "caller-name"]]
    expect(util.twilify(untwilified)).to eq(twilified)
  end

end
