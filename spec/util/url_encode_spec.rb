require 'spec_helper'

describe Twilio::Util do
  include Twilio::Util

  it 'should parse a Date object' do
    today = Time.now
    url = url_encode('DateSent>' => today)

    expect(url).to eq("DateSent%3E=#{today.strftime('%Y-%m-%d')}")
  end
end
