require 'spec_helper'

describe Twilio::TwiML::MessagingResponse do
  context 'Testing Response' do
    it 'should allow empty response' do
      response = Twilio::TwiML::MessagingResponse.new.to_s
      doc = parse(response)
      expect(doc.children.length).to eq(1)
      expect(doc.children.first.name).to eq('Response')
      expect(doc.children.first.content).to be_empty
    end

    it 'should allow using to_xml instead of to_s' do
      response = Twilio::TwiML::MessagingResponse.new.to_xml
      doc = parse(response)
      expect(doc.children.length).to eq(1)
      expect(doc.children.first.name).to eq('Response')
      expect(doc.children.first.content).to be_empty
    end

    it 'should allow populated response' do
      response = Twilio::TwiML::MessagingResponse.new
      response.message(body: 'Hello')
      response.redirect('example.com')
      doc = parse(response)
      response_element = doc.xpath('/Response')
      children = response_element.children
      expect(children.length).to eq(2)
      expect(children[0].name).to eq('Message')
      expect(children[0].content).to eq('Hello')
      expect(children[1].name).to eq('Redirect')
      expect(children[1].content).to eq('example.com')
    end

    it 'should allow chaining' do
      response = Twilio::TwiML::MessagingResponse.new.message(body: 'Hello').redirect('example.com')
      doc = parse(response)
      response_element = doc.xpath('/Response')
      children = response_element.children
      expect(children.length).to eq(2)
      expect(children[0].name).to eq('Message')
      expect(children[0].content).to eq('Hello')
      expect(children[1].name).to eq('Redirect')
      expect(children[1].content).to eq('example.com')
    end

    it 'should allow nesting' do
      response = Twilio::TwiML::MessagingResponse.new
      response.message(body: 'Hello') do |message|
        message.media('foobar')
      end
      doc = parse(response)
      response_element = doc.xpath('/Response')
      children = response_element.children
      expect(children.length).to eq(1)
      message = doc.xpath('/Response/Message')
      expect(message.children[0].content).to eq('Hello')
      media = message.children[1]
      expect(media.name).to eq('Media')
      expect(media.content).to eq('foobar')
    end

    it 'should allow nesting and chaining' do
      response = Twilio::TwiML::MessagingResponse.new
      response.message(body: 'Hello') do |message|
        message.media('foobar')
      end

      response.redirect('example.com')

      doc = parse(response)
      response_element = doc.xpath('/Response')
      children = response_element.children
      expect(children.length).to eq(2)
      message = doc.xpath('/Response/Message')
      expect(message.children[0].content).to eq('Hello')
      media = message.children[1]
      expect(media.name).to eq('Media')
      expect(media.content).to eq('foobar')
      redirect = doc.xpath('/Response/Redirect').first
      expect(redirect.content).to eq('example.com')
    end

    it 'should allow nesting from the initializer' do
      response = Twilio::TwiML::MessagingResponse.new do |res|
        res.message(body: 'Hello')
        res.redirect('example.com')
      end
      doc = parse(response)
      response_element = doc.xpath('/Response')
      expect(response_element.children.length).to eq(2)
      message = response_element.children.first
      redirect = response_element.children[1]
      expect(message.name).to eq('Message')
      expect(message.content).to eq('Hello')
      expect(redirect.name).to eq('Redirect')
      expect(redirect.content).to eq('example.com')
    end
  end

  context 'Testing Message' do
    it 'should allow a body' do
      response = Twilio::TwiML::MessagingResponse.new
      response.message(body: 'Hello')
      doc = parse(response)
      message = doc.xpath('/Response/Message').first
      expect(message.content).to eq('Hello')
    end

    it 'should allow appending Body' do
      body = Twilio::TwiML::Body.new('Hello World')
      message = Twilio::TwiML::Message.new

      response = Twilio::TwiML::MessagingResponse.new
      message.append(body)
      response.append(message)

      doc = parse(response)
      body_elem = doc.xpath('/Response/Message/Body').first
      expect(body_elem.content).to eq('Hello World')
    end

    it 'should allow appending Body and Media' do
      body = Twilio::TwiML::Body.new('Hello World')
      media = Twilio::TwiML::Media.new('hey.jpg')
      message = Twilio::TwiML::Message.new

      response = Twilio::TwiML::MessagingResponse.new
      message.append(body)
      message.append(media)
      response.append(message)

      doc = parse(response)
      body_elem = doc.xpath('/Response/Message/Body').first
      message_elem = doc.xpath('/Response/Message/Media').first
      expect(body_elem.content).to eq('Hello World')
      expect(message_elem.content).to eq('hey.jpg')
    end
  end

  context 'Testing Redirect' do
    it 'should allow MessagingResponse.redirect' do
      response = Twilio::TwiML::MessagingResponse.new
      response.redirect('example.com')

      doc = parse(response)
      redirect = doc.xpath('/Response/Redirect').first
      expect(redirect.content).to eq('example.com')
    end
  end
end
