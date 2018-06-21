require 'spec_helper'

describe Twilio::TwiML::MessagingResponse do
  context 'Testing Response' do
    it 'should allow empty response' do
      expected_doc = parse <<-XML
        <Response/>
      XML
      response = Twilio::TwiML::MessagingResponse.new.to_s
      doc = parse(response)
      expect(doc).to be_equivalent_to(expected_doc).respecting_element_order
    end

    it 'should allow using to_xml instead of to_s' do
      expected_doc = parse <<-XML
        <Response/>
      XML
      response = Twilio::TwiML::MessagingResponse.new.to_xml
      doc = parse(response)
      expect(doc).to be_equivalent_to(expected_doc).respecting_element_order
    end

    it 'should allow comments' do
      twiml = Twilio::TwiML::MessagingResponse.new
      twiml.comment 'This is awesome'
      expect(twiml.to_xml).to match(/<!--This is awesome-->/)
    end

    it 'should allow text nodes' do
      expected_doc = parse <<-XML
        <Response>Look no tags</Response>
      XML
      twiml = Twilio::TwiML::MessagingResponse.new
      twiml.add_text 'Look no tags'
      expect(parse(twiml)).to be_equivalent_to(expected_doc).respecting_element_order
    end

    it 'should allow generic child nodes' do
      expected_doc = parse <<-XML
        <Response>
          <message tag="global">
            <bold>Hello</bold>
          </alexa>
        </Response>
      XML

      twiml = Twilio::TwiML::MessagingResponse.new
      twiml.add_child('message', tag: 'global') do |custom|
        custom.add_child('bold', 'Hello')
      end

      expect(parse(twiml)).to be_equivalent_to(expected_doc).respecting_element_order
    end

    it 'should allow mixed text and generic nodes' do
      expected_doc = parse <<-XML
        <Response>
          before
          <Child>content</Child>
          after
        </Response>
      XML

      twiml = Twilio::TwiML::MessagingResponse.new
      twiml.add_text('before')
           .add_child('Child', 'content')
           .add_text('after')

      expect(parse(twiml)).to be_equivalent_to(expected_doc).respecting_element_order
    end

    it 'should allow populated response' do
      expected_doc = parse <<-XML
        <Response>
          <Message>Hello</Message>
          <Redirect>example.com</Redirect>
        </Response>
      XML
      response = Twilio::TwiML::MessagingResponse.new
      response.message(body: 'Hello')
      response.redirect('example.com')
      doc = parse(response)
      expect(doc).to be_equivalent_to(expected_doc).respecting_element_order
    end

    it 'should allow chaining' do
      expected_doc = parse <<-XML
        <Response>
          <Message>Hello</Message>
          <Redirect>example.com</Redirect>
        </Response>
      XML
      response = Twilio::TwiML::MessagingResponse.new.message(body: 'Hello').redirect('example.com')
      doc = parse(response)
      expect(doc).to be_equivalent_to(expected_doc).respecting_element_order
    end

    it 'should allow nesting' do
      expected_doc = parse <<-XML
        <Response>
          <Message>
            Hello
            <Media>foobar</Media>
          </Message>
        </Response>
      XML
      response = Twilio::TwiML::MessagingResponse.new
      response.message(body: 'Hello') do |message|
        message.media('foobar')
      end
      doc = parse(response)
      expect(doc).to be_equivalent_to(expected_doc).respecting_element_order
    end

    it 'should allow nesting and chaining' do
      expected_doc = parse <<-XML
        <Response>
          <Message>
            Hello
            <Media>foobar</Media>
          </Message>
          <Redirect>example.com</Redirec>
        </Response>
      XML
      response = Twilio::TwiML::MessagingResponse.new
      response.message(body: 'Hello') do |message|
        message.media('foobar')
      end

      response.redirect('example.com')

      doc = parse(response)
      expect(doc).to be_equivalent_to(expected_doc).respecting_element_order
    end

    it 'should allow nesting from the initializer' do
      expected_doc = parse <<-XML
        <Response>
          <Message>Hello</Message>
          <Redirect>example.com</Redirec>
        </Response>
      XML
      response = Twilio::TwiML::MessagingResponse.new do |res|
        res.message(body: 'Hello')
        res.redirect('example.com')
      end
      doc = parse(response)
      expect(doc).to be_equivalent_to(expected_doc).respecting_element_order
    end
  end

  context 'Testing Message' do
    it 'should allow a body' do
      expected_doc = parse <<-XML
        <Response>
          <Message>Hello</Message>
        </Response>
      XML
      response = Twilio::TwiML::MessagingResponse.new
      response.message(body: 'Hello')
      doc = parse(response)
      expect(doc).to be_equivalent_to(expected_doc).respecting_element_order
    end

    it 'should allow appending Body' do
      expected_doc = parse <<-XML
        <Response>
          <Message><Body>Hello World</Body></Message>
        </Response>
      XML
      body = Twilio::TwiML::Body.new('Hello World')
      message = Twilio::TwiML::Message.new

      response = Twilio::TwiML::MessagingResponse.new
      message.append(body)
      response.append(message)

      doc = parse(response)
      expect(doc).to be_equivalent_to(expected_doc).respecting_element_order
    end

    it 'should allow appending Body and Media' do
      expected_doc = parse <<-XML
        <Response>
          <Message>
            <Body>Hello World</Body>
            <Media>hey.jpg</Media>
          </Message>
        </Response>
      XML
      body = Twilio::TwiML::Body.new('Hello World')
      media = Twilio::TwiML::Media.new('hey.jpg')
      message = Twilio::TwiML::Message.new

      response = Twilio::TwiML::MessagingResponse.new
      message.append(body)
      message.append(media)
      response.append(message)

      doc = parse(response)
      expect(doc).to be_equivalent_to(expected_doc).respecting_element_order
    end

    it 'should allow and preserve new lines in messages' do
      expected_doc = parse <<-XML
        <Response>
          <Message>Hello
World
          </Message>
        </Response>
      XML

      response = Twilio::TwiML::MessagingResponse.new
      response.message(body: "Hello\nWorld")

      doc = parse(response)
      expect(doc).to be_equivalent_to(expected_doc).respecting_element_order
    end
  end

  context 'Testing Redirect' do
    it 'should allow MessagingResponse.redirect' do
      expected_doc = parse <<-XML
        <Response>
          <Redirect>example.com</Redirect>
        </Response>
      XML
      response = Twilio::TwiML::MessagingResponse.new
      response.redirect('example.com')

      doc = parse(response)
      expect(doc).to be_equivalent_to(expected_doc).respecting_element_order
    end
  end
end
