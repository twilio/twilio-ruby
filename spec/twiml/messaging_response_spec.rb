require 'spec_helper'

describe Twilio::TwiML::MessagingResponse do
  context 'Testing Response' do
    it 'should allow empty response' do
      r = Twilio::TwiML::MessagingResponse.new
      expect(r.to_s).to eq('<?xml version="1.0" encoding="UTF-8"?><Response/>')
    end

    it 'should allow using to_xml instead of to_s' do
      r = Twilio::TwiML::MessagingResponse.new
      expect(r.to_xml).to eq('<?xml version="1.0" encoding="UTF-8"?><Response/>')
    end

    it 'should allow populated response' do
      r = Twilio::TwiML::MessagingResponse.new
      r.message(body: 'Hello')
      r.redirect('example.com')

      expect(r.to_s).to eq('<?xml version="1.0" encoding="UTF-8"?><Response><Message>Hello</Message><Redirect>example.com</Redirect></Response>')
    end

    it 'should allow chaining' do
      r = Twilio::TwiML::MessagingResponse.new.message(body: 'Hello').redirect('example.com')

      expect(r.to_s).to eq('<?xml version="1.0" encoding="UTF-8"?><Response><Message>Hello</Message><Redirect>example.com</Redirect></Response>')
    end

    it 'should allow nesting' do
      r = Twilio::TwiML::MessagingResponse.new
      r.message(body: 'Hello') do |m|
        m.media('foobar')
      end

      expect(r.to_s).to eq('<?xml version="1.0" encoding="UTF-8"?><Response><Message>Hello<Media>foobar</Media></Message></Response>')
    end

    it 'should allow nesting and chaining' do
      r = Twilio::TwiML::MessagingResponse.new
      r.message(body: 'Hello') do |m|
        m.media('foobar')
      end

      r.redirect('example.com')

      expect(r.to_s).to eq('<?xml version="1.0" encoding="UTF-8"?><Response><Message>Hello<Media>foobar</Media></Message><Redirect>example.com</Redirect></Response>')
    end

    it 'should allow nesting from the initializer' do
      response = Twilio::TwiML::MessagingResponse.new do |r|
        r.message(body: 'Hello')
        r.redirect('example.com')
      end
      expect(response.to_s).to eq('<?xml version="1.0" encoding="UTF-8"?><Response><Message>Hello</Message><Redirect>example.com</Redirect></Response>')
    end
  end

  context 'Testing Message' do
    it 'should allow a body' do
      r = Twilio::TwiML::MessagingResponse.new
      r.message(body: 'Hello')

      expect(r.to_s).to eq('<?xml version="1.0" encoding="UTF-8"?><Response><Message>Hello</Message></Response>')
    end

    it 'should allow appending Body' do
      b = Twilio::TwiML::Body.new('Hello World')

      r = Twilio::TwiML::MessagingResponse.new
      r.append(b)

      expect(r.to_s).to eq('<?xml version="1.0" encoding="UTF-8"?><Response><Body>Hello World</Body></Response>')
    end

    it 'should allow appending Body and Media' do
      b = Twilio::TwiML::Body.new('Hello World')
      m = Twilio::TwiML::Media.new('hey.jpg')

      r = Twilio::TwiML::MessagingResponse.new
      r.append(b)
      r.append(m)

      expect(r.to_s).to eq('<?xml version="1.0" encoding="UTF-8"?><Response><Body>Hello World</Body><Media>hey.jpg</Media></Response>')
    end
  end

  context 'Testing Redirect' do
    it 'should allow MessagingResponse.redirect' do
      r = Twilio::TwiML::MessagingResponse.new
      r.redirect('example.com')

      expect(r.to_s).to eq('<?xml version="1.0" encoding="UTF-8"?><Response><Redirect>example.com</Redirect></Response>')
    end
  end
end
