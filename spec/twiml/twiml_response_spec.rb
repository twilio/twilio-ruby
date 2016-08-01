require 'spec_helper'

describe Twilio::TwiML::Response do
  it 'should render empty' do
    twiml = Twilio::TwiML::Response.new
    expect(twiml.text).to eq('<?xml version="1.0" encoding="UTF-8"?>' +
                             '<Response/>')
  end

  it 'should render top level tags' do
    twiml = Twilio::TwiML::Response.new do |r|
      r.Say 'hello world'
      r.Hangup
    end
    expect(twiml.text).to eq('<?xml version="1.0" encoding="UTF-8"?>' +
                             '<Response>' +
                               '<Say>hello world</Say>' +
                               '<Hangup/>' +
                             '</Response>')
  end

  it 'should render attributes in top level tags' do
    twiml = Twilio::TwiML::Response.new do |r|
      r.Say 'hello world', voice: 'alice'
    end

    expect(twiml.text).to eq('<?xml version="1.0" encoding="UTF-8"?>' +
                             '<Response>' +
                               '<Say voice="alice">hello world</Say>' +
                             '</Response>')
  end

  it 'should render nested tags' do
    twiml = Twilio::TwiML::Response.new do |r|
      r.Dial callerId: '+14158675309' do |d|
        d.Client 'jenny'
      end
    end

    expect(twiml.text).to eq('<?xml version="1.0" encoding="UTF-8"?>' +
                             '<Response>' +
                               '<Dial callerId="+14158675309">' +
                                 '<Client>jenny</Client>' +
                               '</Dial>' +
                             '</Response>')
  end
end