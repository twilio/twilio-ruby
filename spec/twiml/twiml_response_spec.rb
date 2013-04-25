require 'spec_helper'

def collapse_xml(s)
  s.strip.gsub(/\>\s+/, '>')
end

describe Twilio::TwiML::Response do
  let(:expected_xml) do
    %q`<?xml version="1.0" encoding="UTF-8"?>
      <Response>
          <Gather action="/action.php" method="GET">
              <Say>First</Say>
          </Gather>
          <Say>Second</Say>
      </Response>
    `.strip.gsub(/\>\s+/, '>')
  end

  it 'returns correct response via block and capitalized syntax' do
    result = Twilio::TwiML::Response.new do |t|
      t.Gather action: '/action.php', method: 'GET' do |g|
        g.Say 'First'
      end
      t.Say 'Second'
    end
    result.text.should eq(expected_xml)
  end

  it 'returns correct response via block and lowercase syntax' do
    result = Twilio::TwiML::Response.new do |t|
      t.gather action: '/action.php', method: 'GET' do |g|
        g.say 'First'
      end
      t.say 'Second'
    end
    result.text.should eq(expected_xml)
  end

  it 'returns correct response via non-block, lowercase syntax' do
    t = Twilio::TwiML::Response.new
    t.gather action: '/action.php', method: 'GET' do |g|
      g.say 'First'
    end
    t.say 'Second'
    t.text.should eq(expected_xml)
  end
end

