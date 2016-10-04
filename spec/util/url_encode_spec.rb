require 'spec_helper'

describe Twilio::Util do
  include Twilio::Util

  it 'should turn a hash into a url encoded string of parameters' do
    hash = { :param => 'test', :param2 => 'hello monkey', :param3 => '<3' }
    url = url_encode(hash)

    expect(url).to eq('param=test&param2=hello+monkey&param3=%3C3')
  end

  it 'should parse a Date object' do
    today = Time.now
    url = url_encode('DateSent>' => today)

    expect(url).to eq("DateSent%3E=#{today.strftime('%Y-%m-%d')}")
  end

  it 'should turn an array into multiple keys in the path' do
    hash = { :param => 'test', :type => ['carrier', 'caller-name'] }
    url = url_encode(hash)

    expect(url).to eq('param=test&type=carrier&type=caller-name')
  end
end
