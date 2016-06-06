require 'spec_helper'

describe Twilio do
  describe 'prefixed_collapsible_map' do

    it 'should serialize nil' do
      actual = Twilio.prefixed_collapsible_map(nil, 'Prefix')
      expect(actual).to eq({})
    end

    it 'should serialize a single key' do
      actual = Twilio.prefixed_collapsible_map({
        'foo' => 'bar'
      }, 'Prefix')
      expect(actual).to eq({
        'Prefix.foo' => 'bar'
      })
    end

    it 'should serialize nested key' do
      actual = Twilio.prefixed_collapsible_map({
        'foo' => {
          'bar' => 'baz'
        }
      }, 'Prefix')
      expect(actual).to eq({
        'Prefix.foo.bar' => 'baz'
      })
    end

    it 'should serialize multiple keys' do
      actual = Twilio.prefixed_collapsible_map({
        'watson' => {
          'language' => 'en',
          'alice' => 'bob'
        },
          'foo' => 'bar'
      }, 'Prefix')
      expect(actual).to eq({
        'Prefix.watson.language' => 'en',
        'Prefix.watson.alice' => 'bob',
        'Prefix.foo' => 'bar'
      })
    end

    it 'should serialize list' do
      actual = Twilio.prefixed_collapsible_map(['foo', 'bar'], 'Prefix')
      expect(actual).to eq({})
    end


  end
end