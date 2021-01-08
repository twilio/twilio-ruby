require 'spec_helper'

describe Twilio::TwiML::VoiceResponse do
  context 'Testing Response' do
    it 'should allow empty response' do
      expected_doc = parse <<-XML
        <Response/>
      XML
      response = Twilio::TwiML::VoiceResponse.new.to_s
      doc = parse(response)
      expect(doc).to be_equivalent_to(expected_doc).respecting_element_order
    end

    it 'should allow using to_xml instead of to_s' do
      expected_doc = parse <<-XML
        <Response/>
      XML
      response = Twilio::TwiML::VoiceResponse.new.to_xml
      doc = parse(response)
      expect(doc).to be_equivalent_to(expected_doc).respecting_element_order
    end

    it 'should have an xml declaration by default' do
      twiml = Twilio::TwiML::VoiceResponse.new.to_xml
      expect(twiml).to match(/\A<\?xml version="1.0" encoding="UTF-8"\?>/)
    end

    it 'should allow no xml_declaration' do
      twiml = Twilio::TwiML::VoiceResponse.new.to_xml(false)
      expect(twiml).not_to match(/\A<\?xml version="1.0" encoding="UTF-8"\?>/)
    end

    it 'should allow comments' do
      twiml = Twilio::TwiML::VoiceResponse.new
      twiml.comment 'This is awesome'
      expect(twiml.to_xml).to match(/<!--This is awesome-->/)
    end

    it 'should allow text nodes' do
      expected_doc = parse <<-XML
        <Response>Look no tags</Response>
      XML
      twiml = Twilio::TwiML::VoiceResponse.new
      twiml.add_text 'Look no tags'
      expect(parse(twiml)).to be_equivalent_to(expected_doc).respecting_element_order
    end

    it 'should allow generic child nodes' do
      expected_doc = parse <<-XML
        <Response>
          <alexa omnipresent="true">
            <purchase>Kindle</purchase>
          </alexa>
        </Response>
      XML

      twiml = Twilio::TwiML::VoiceResponse.new
      twiml.add_child('alexa', omnipresent: 'true') do |alexa|
        alexa.add_child('purchase', 'Kindle')
      end

      expect(parse(twiml)).to be_equivalent_to(expected_doc).respecting_element_order
    end
    it 'should allow populated response' do
      expected_doc = parse <<-XML
        <Response>
          <Hangup/>
          <Leave/>
          <Sms to="+11234567890" from="+10987654321">twilio sms</Sms>
        </Response>
      XML
      response = Twilio::TwiML::VoiceResponse.new
      response.hangup
      response.leave
      response.sms('twilio sms', to: '+11234567890', from: '+10987654321')

      doc = parse(response)
      expect(doc).to be_equivalent_to(expected_doc).respecting_element_order
    end

    it 'should allow chaining' do
      expected_doc = parse <<-XML
        <Response>
          <Hangup/>
          <Leave/>
          <Sms to="+11234567890" from="+10987654321">twilio sms</Sms>
        </Response>
      XML
      response = Twilio::TwiML::VoiceResponse.new.hangup.leave.sms(
        'twilio sms',
        to: '+11234567890',
        from: '+10987654321'
      )

      doc = parse(response)
      expect(doc).to be_equivalent_to(expected_doc).respecting_element_order
    end

    it 'should allow nesting' do
      expected_doc = parse <<-XML
        <Response>
          <Hangup/>
          <Leave/>
          <Sms to="+11234567890" from="+10987654321">twilio sms</Sms>
        </Response>
      XML
      response = Twilio::TwiML::VoiceResponse.new do |r|
        r.hangup
        r.leave
        r.sms('twilio sms', to: '+11234567890', from: '+10987654321')
      end

      doc = parse(response)
      expect(doc).to be_equivalent_to(expected_doc).respecting_element_order
    end
  end

  context 'Testing Say' do
    it 'should allow empty say' do
      expected_doc = parse <<-XML
        <Response>
          <Say></Say>
        </Response>
      XML
      response = Twilio::TwiML::VoiceResponse.new
      response.say(message: '')

      doc = parse(response)
      expect(doc).to be_equivalent_to(expected_doc).respecting_element_order
    end

    it 'should allow populated say' do
      expected_doc = parse <<-XML
        <Response>
          <Say>Hello World</Say>
        </Response>
      XML
      response = Twilio::TwiML::VoiceResponse.new
      response.say(message: 'Hello World')

      doc = parse(response)
      expect(doc).to be_equivalent_to(expected_doc).respecting_element_order
    end

    it 'should allow unicode say' do
      expected_doc = parse <<-XML
        <Response>
          <Say>nécessaire et d'autres</Say>
        </Response>
      XML
      response = Twilio::TwiML::VoiceResponse.new
      response.say(message: 'nécessaire et d\'autres')

      doc = parse(response)
      expect(doc).to be_equivalent_to(expected_doc).respecting_element_order
    end

    it 'should allow looping' do
      expected_doc = parse <<-XML
        <Response>
          <Say loop="3">Hello Monkey</Say>
        </Response>
      XML
      response = Twilio::TwiML::VoiceResponse.new
      response.say(message: 'Hello Monkey', loop: 3)

      doc = parse(response)
      expect(doc).to be_equivalent_to(expected_doc).respecting_element_order
    end

    it 'should allow languages' do
      expected_doc = parse <<-XML
        <Response>
          <Say language="en-gb">Hello Monkey</Say>
        </Response>
      XML
      response = Twilio::TwiML::VoiceResponse.new
      response.say(message: 'Hello Monkey', language: 'en-gb')

      doc = parse(response)
      expect(doc).to be_equivalent_to(expected_doc).respecting_element_order
    end

    it 'should allow all attributes' do
      expected_doc = parse <<-XML
        <Response>
          <Say loop="3" voice="man" language="fr">Hello Monkey</Say>
        </Response>
      XML
      response = Twilio::TwiML::VoiceResponse.new
      response.say(message: 'Hello Monkey', loop: 3, voice: 'man', language: 'fr')

      doc = parse(response)
      expect(doc).to be_equivalent_to(expected_doc).respecting_element_order
    end
  end

  context 'Testing Play' do
    it 'should allow empty play' do
      expected_doc = parse <<-XML
        <Response>
          <Play></Play>
        </Response>
      XML
      response = Twilio::TwiML::VoiceResponse.new
      response.play

      doc = parse(response)
      expect(doc).to be_equivalent_to(expected_doc).respecting_element_order
    end

    it 'should play hello' do
      expected_doc = parse <<-XML
        <Response>
          <Play>http://hellomonkey.mp3</Play>
        </Response>
      XML
      response = Twilio::TwiML::VoiceResponse.new
      response.play(url: 'http://hellomonkey.mp3')
      doc = parse(response)
      expect(doc).to be_equivalent_to(expected_doc).respecting_element_order
    end

    it 'should play hello on loop' do
      expected_doc = parse <<-XML
        <Response>
          <Play loop="3">http://hellomonkey.mp3</Play>
        </Response>
      XML
      response = Twilio::TwiML::VoiceResponse.new
      response.play(url: 'http://hellomonkey.mp3', loop: 3)

      doc = parse(response)
      expect(doc).to be_equivalent_to(expected_doc).respecting_element_order
    end

    it 'should play digits' do
      expected_doc = parse <<-XML
        <Response>
          <Play digits="w123"></Play>
        </Response>
      XML
      response = Twilio::TwiML::VoiceResponse.new
      response.play(digits: 'w123')

      doc = parse(response)
      expect(doc).to be_equivalent_to(expected_doc).respecting_element_order
    end
  end

  context 'Testing Record' do
    it 'should allow empty record' do
      expected_doc = parse <<-XML
        <Response>
          <Record/>
        </Response>
      XML
      response = Twilio::TwiML::VoiceResponse.new
      response.record
      doc = parse(response)
      expect(doc).to be_equivalent_to(expected_doc).respecting_element_order
    end

    it 'should allow action and method' do
      expected_doc = parse <<-XML
        <Response>
          <Record action="example.com" method="GET" />
        </Response>
      XML
      response = Twilio::TwiML::VoiceResponse.new
      response.record(action: 'example.com', method: 'GET')
      doc = parse(response)
      expect(doc).to be_equivalent_to(expected_doc).respecting_element_order
    end

    it 'should allow max_length, finish_on_key, and timeout' do
      expected_doc = parse <<-XML
        <Response>
          <Record timeout="4" finishOnKey="#" maxLength="30" />
        </Response>
      XML
      response = Twilio::TwiML::VoiceResponse.new
      response.record(timeout: 4, finish_on_key: '#', max_length: 30)
      doc = parse(response)
      expect(doc).to be_equivalent_to(expected_doc).respecting_element_order
    end

    it 'should allow transcribe' do
      expected_doc = parse <<-XML
        <Response>
          <Record transcribeCallback="example.com" />
        </Response>
      XML
      response = Twilio::TwiML::VoiceResponse.new
      response.record(transcribe_callback: 'example.com')
      doc = parse(response)
      expect(doc).to be_equivalent_to(expected_doc).respecting_element_order
    end
  end

  context 'Testing Redirect' do
    it 'should allow empty redirect' do
      expected_doc = parse <<-XML
        <Response>
          <Redirect/>
        </Response>
      XML
      response = Twilio::TwiML::VoiceResponse.new
      response.redirect ''
      doc = parse(response)
      expect(doc).to be_equivalent_to(expected_doc).respecting_element_order
    end

    it 'should allow method' do
      expected_doc = parse <<-XML
        <Response>
          <Redirect method="POST">example.com</Redirect>
        </Response>
      XML
      response = Twilio::TwiML::VoiceResponse.new
      response.redirect('example.com', method: 'POST')
      doc = parse(response)
      expect(doc).to be_equivalent_to(expected_doc).respecting_element_order
    end

    it 'should allow method and params' do
      expected_doc = parse <<-XML
        <Response>
          <Redirect method="POST">example.com?id=34&amp;action=hey</Redirect>
        </Response>
      XML
      response = Twilio::TwiML::VoiceResponse.new
      response.redirect('example.com?id=34&action=hey', method: 'POST')
      doc = parse(response)
      expect(doc).to be_equivalent_to(expected_doc).respecting_element_order
    end
  end

  context 'Testing Hangup' do
    it 'should allow hangup' do
      expected_doc = parse <<-XML
        <Response>
          <Hangup/>
        </Response>
      XML
      response = Twilio::TwiML::VoiceResponse.new
      response.hangup
      doc = parse(response)
      expect(doc).to be_equivalent_to(expected_doc).respecting_element_order
    end

    it 'should not allow content in the hangup' do
      response = Twilio::TwiML::VoiceResponse.new
      expect { response.hangup 'Goodbye' }.to raise_error(ArgumentError)
    end
  end

  context 'Testing Leave' do
    it 'should allow leave' do
      expected_doc = parse <<-XML
        <Response>
          <Leave/>
        </Response>
      XML
      response = Twilio::TwiML::VoiceResponse.new
      response.leave
      doc = parse(response)
      expect(doc).to be_equivalent_to(expected_doc).respecting_element_order
    end

    it 'should not allow content in the leave' do
      response = Twilio::TwiML::VoiceResponse.new
      expect { response.leave 'Goodbye' }.to raise_error(ArgumentError)
    end
  end

  context 'Testing Reject' do
    it 'should reject with a default reason' do
      expected_doc = parse <<-XML
        <Response>
          <Reject/>
        </Response>
      XML
      response = Twilio::TwiML::VoiceResponse.new
      response.reject
      doc = parse(response)
      expect(doc).to be_equivalent_to(expected_doc).respecting_element_order
    end

    it 'should not allow content in the reject' do
      response = Twilio::TwiML::VoiceResponse.new
      expect { response.reject 'Goodbye' }.to raise_error(ArgumentError)
    end
  end

  context 'Testing SMS' do
    it 'should allow empty SMS' do
      expected_doc = parse <<-XML
        <Response>
          <Sms/>
        </Response>
      XML
      response = Twilio::TwiML::VoiceResponse.new
      response.sms ''
      doc = parse(response)
      expect(doc).to be_equivalent_to(expected_doc).respecting_element_order
    end

    it 'should allow SMS body' do
      expected_doc = parse <<-XML
        <Response>
          <Sms>Hello, World</Sms>
        </Response>
      XML
      response = Twilio::TwiML::VoiceResponse.new
      response.sms 'Hello, World'
      doc = parse(response)
      expect(doc).to be_equivalent_to(expected_doc).respecting_element_order
    end

    it 'should allow to, from, action, and status_callback' do
      expected_doc = parse <<-XML
        <Response>
          <Sms to="1231231234" from="3453453456" statusCallback="example.com?id=34&amp;action=hey">Hello, World</Sms>
        </Response>
      XML
      response = Twilio::TwiML::VoiceResponse.new
      response.sms('Hello, World', to: 1_231_231_234, from: 3_453_453_456, status_callback: 'example.com?id=34&action=hey')
      doc = parse(response)
      expect(doc).to be_equivalent_to(expected_doc).respecting_element_order
    end

    it 'should allow action and method' do
      expected_doc = parse <<-XML
        <Response>
          <Sms method="POST" action="example.com?id=34&amp;action=hey">Hello</Sms>
        </Response>
      XML
      response = Twilio::TwiML::VoiceResponse.new
      response.sms('Hello', method: 'POST', action: 'example.com?id=34&action=hey')
      doc = parse(response)
      expect(doc).to be_equivalent_to(expected_doc).respecting_element_order
    end
  end

  context 'Testing Conference' do
    it 'should allow basic conferencing' do
      expected_doc = parse <<-XML
        <Response>
          <Dial>
            <Conference beep="false" waitUrl="" startConferenceOnEnter="true" endConferenceOnExit="true">
              TestConferenceAttributes
            </Conference>
          </Dial>
        </Response>
      XML
      dial = Twilio::TwiML::Dial.new
      dial.conference(
        'TestConferenceAttributes',
        beep: false,
        wait_url: '',
        start_conference_on_enter: true,
        end_conference_on_exit: true
      )

      response = Twilio::TwiML::VoiceResponse.new
      response.append(dial)
      doc = parse(response)
      expect(doc).to be_equivalent_to(expected_doc).respecting_element_order
    end

    it 'should allow muted conferencing' do
      expected_doc = parse <<-XML
        <Response>
          <Dial>
            <Conference beep="false" waitUrl="" startConferenceOnEnter="true" endConferenceOnExit="true" muted="true">
              TestConferenceMutedAttribute
            </Conference>
          </Dial>
        </Response>
      XML
      dial = Twilio::TwiML::Dial.new
      dial.conference(
        'TestConferenceMutedAttribute',
        beep: false,
        muted: true,
        wait_url: '',
        start_conference_on_enter: true,
        end_conference_on_exit: true
      )

      response = Twilio::TwiML::VoiceResponse.new
      response.append(dial)
      doc = parse(response)
      expect(doc).to be_equivalent_to(expected_doc).respecting_element_order
    end
  end

  context 'Testing Queue' do
    it 'should allow queues in VoiceResponse' do
      expected_doc = parse <<-XML
        <Response>
          <Dial>
            <Queue url="" method="GET">TestQueueAttribute</Queue>
          </Dial>
        </Response>
      XML
      dial = Twilio::TwiML::Dial.new
      dial.queue('TestQueueAttribute', url: '', method: 'GET')

      response = Twilio::TwiML::VoiceResponse.new
      response.append(dial)
      doc = parse(response)
      expect(doc).to be_equivalent_to(expected_doc).respecting_element_order
    end
  end

  context 'Testing Echo' do
    it 'should allow VoiceResponse Echo' do
      expected_doc = parse <<-XML
        <Response>
          <Echo/>
        </Response>
      XML
      response = Twilio::TwiML::VoiceResponse.new
      response.echo
      doc = parse(response)
      expect(doc).to be_equivalent_to(expected_doc).respecting_element_order
    end
  end

  context 'Testing Enqueue' do
    it 'should allow VoiceResponse.enqueue' do
      expected_doc = parse <<-XML
        <Response>
          <Enqueue action="act" method="GET" waitUrl="wait" waitUrlMethod="POST">TestEnqueueAttribute</Enqueue>
        </Response>
      XML
      response = Twilio::TwiML::VoiceResponse.new
      response.enqueue(
        name: 'TestEnqueueAttribute',
        action: 'act',
        method: 'GET',
        wait_url: 'wait',
        wait_url_method: 'POST'
      )
      doc = parse(response)
      expect(doc).to be_equivalent_to(expected_doc).respecting_element_order
    end

    it 'should allow Enqueue.task and appending Enqueue' do
      task_json = '{"account_sid": "AC123123123"}'
      expected_doc = parse <<-XML
        <Response>
          <Enqueue workflowSid="123123123">
            <Task>#{task_json}</Task>
          </Enqueue>
        </Response>
      XML
      enqueue_elem = Twilio::TwiML::Enqueue.new(name: nil, workflow_sid: '123123123')
      enqueue_elem.task(task_json)

      response = Twilio::TwiML::VoiceResponse.new
      response.append(enqueue_elem)
      doc = parse(response)
      expect(doc).to be_equivalent_to(expected_doc).respecting_element_order
    end

    it 'should allow Enqueue.task with a dictionary and appending Enqueue' do
      expected_doc = parse <<-XML
        <Response>
          <Enqueue workflowSid="123123123">
            <Task>{"account_sid":"AC123123123"}</Task>
          </Enqueue>
        </Response>
      XML
      enqueue_elem = Twilio::TwiML::Enqueue.new(name: nil, workflow_sid: '123123123')
      enqueue_elem.task({ account_sid: 'AC123123123' })

      response = Twilio::TwiML::VoiceResponse.new
      response.append(enqueue_elem)

      doc = parse(response)
      expect(doc).to be_equivalent_to(expected_doc).respecting_element_order
    end
  end

  context 'Testing Dial' do
    it 'should allow VoiceResponse.dial' do
      expected_doc = parse <<-XML
        <Response>
          <Dial>1231231234</Dial>
        </Response>
      XML
      response = Twilio::TwiML::VoiceResponse.new
      response.dial(number: '1231231234')
      doc = parse(response)
      expect(doc).to be_equivalent_to(expected_doc).respecting_element_order
    end

    it 'should allow Dial.sim' do
      expected_doc = parse <<-XML
        <Response>
          <Dial>
            <Sim>123123123</Sim>
          </Dial>
        </Response>
      XML
      dial = Twilio::TwiML::Dial.new
      dial.sim '123123123'

      response = Twilio::TwiML::VoiceResponse.new
      response.append(dial)

      doc = parse(response)
      expect(doc).to be_equivalent_to(expected_doc).respecting_element_order
    end

    it 'should allow Dial.sip' do
      expected_doc = parse <<-XML
        <Response>
          <Dial>
            <Sip>foo@example.com</Sip>
          </Dial>
        </Response>
      XML
      dial = Twilio::TwiML::Dial.new
      dial.sip 'foo@example.com'

      response = Twilio::TwiML::VoiceResponse.new
      response.append(dial)
      doc = parse(response)
      expect(doc).to be_equivalent_to(expected_doc).respecting_element_order
    end

    it 'should allow Dial.sip with username, password' do
      expected_doc = parse <<-XML
        <Response>
          <Dial>
            <Sip username="foo" password="bar">foo@example.com</Sip>
          </Dial>
        </Response>
      XML
      dial = Twilio::TwiML::Dial.new
      dial.sip('foo@example.com', username: 'foo', password: 'bar')

      response = Twilio::TwiML::VoiceResponse.new
      response.append(dial)
      doc = parse(response)
      expect(doc).to be_equivalent_to(expected_doc).respecting_element_order
    end

    it 'should allow Dial.number' do
      expected_doc = parse <<-XML
        <Response>
          <Dial>
            <Number>1231231234</Number>
          </Dial>
        </Response>
      XML
      dial = Twilio::TwiML::Dial.new
      dial.number '1231231234'

      response = Twilio::TwiML::VoiceResponse.new
      response.append(dial)
      doc = parse(response)
      expect(doc).to be_equivalent_to(expected_doc).respecting_element_order
    end

    it 'should allow Dial.number with params' do
      expected_doc = parse <<-XML
        <Response>
          <Dial>
            <Number statusCallback="http://example.com" statusCallbackEvent="initiated completed">1231231234</Number>
          </Dial>
        </Response>
      XML
      dial = Twilio::TwiML::Dial.new
      dial.number('1231231234', status_callback: 'http://example.com', status_callback_event: 'initiated completed')

      response = Twilio::TwiML::VoiceResponse.new
      response.append(dial)
      doc = parse(response)
      expect(doc).to be_equivalent_to(expected_doc).respecting_element_order
    end

    it 'should allow Dial.conference' do
      expected_doc = parse <<-XML
        <Response>
          <Dial>
            <Conference>My Room</Conference>
          </Dial>
        </Response>
      XML
      dial = Twilio::TwiML::Dial.new
      dial.conference 'My Room'

      response = Twilio::TwiML::VoiceResponse.new
      response.append(dial)
      doc = parse(response)
      expect(doc).to be_equivalent_to(expected_doc).respecting_element_order
    end

    it 'should allow Dial.queue' do
      expected_doc = parse <<-XML
        <Response>
          <Dial>
            <Queue>The Cute Queue</Queue>
          </Dial>
        </Response>
      XML
      dial = Twilio::TwiML::Dial.new
      dial.queue 'The Cute Queue'

      response = Twilio::TwiML::VoiceResponse.new
      response.append(dial)
      doc = parse(response)
      expect(doc).to be_equivalent_to(expected_doc).respecting_element_order
    end

    it 'should allow empty Dial.client' do
      expected_doc = parse <<-XML
        <Response>
          <Dial>
            <Client></Client>
          </Dial>
        </Response>
      XML
      dial = Twilio::TwiML::Dial.new
      dial.client

      response = Twilio::TwiML::VoiceResponse.new
      response.append(dial)
      doc = parse(response)
      expect(doc).to be_equivalent_to(expected_doc).respecting_element_order
    end

    it 'should allow populated Dial.client' do
      expected_doc = parse <<-XML
        <Response>
          <Dial>
            <Client>alice</Client>
          </Dial>
        </Response>
      XML
      dial = Twilio::TwiML::Dial.new
      dial.client identity: 'alice'

      response = Twilio::TwiML::VoiceResponse.new
      response.append(dial)
      doc = parse(response)
      expect(doc).to be_equivalent_to(expected_doc).respecting_element_order
    end

    it 'should allow client identity and parameters' do
      expected_doc = parse <<-XML
        <Response>
          <Dial>
            <Client>
              <Identity>alice</Identity>
              <Parameter name="hello" value="world"/>
            </Client>
          </Dial>
        </Response>
      XML
      dial = Twilio::TwiML::Dial.new
      client = Twilio::TwiML::Client.new
      client.identity 'alice'
      client.parameter name: 'hello', value: 'world'

      response = Twilio::TwiML::VoiceResponse.new
      dial.append(client)
      response.append(dial)
      doc = parse(response)
      expect(doc).to be_equivalent_to(expected_doc).respecting_element_order
    end
  end

  context 'Testing Gather' do
    it 'should allow empty Gather' do
      expected_doc = parse <<-XML
        <Response>
          <Gather></Gather>
        </Response>
      XML
      response = Twilio::TwiML::VoiceResponse.new
      response.gather
      doc = parse(response)
      expect(doc).to be_equivalent_to(expected_doc).respecting_element_order
    end

    it 'should allow nested Say in Gather' do
      expected_doc = parse <<-XML
        <Response>
          <Gather>
            <Say>Hello</Say>
          </Gather>
        </Response>
      XML
      gather_elem = Twilio::TwiML::Gather.new
      gather_elem.say(message: 'Hello')

      response = Twilio::TwiML::VoiceResponse.new
      response.append(gather_elem)
      doc = parse(response)
      expect(doc).to be_equivalent_to(expected_doc).respecting_element_order
    end

    it 'should allow nested play and pause' do
      expected_doc = parse <<-XML
        <Response>
          <Gather>
            <Say>Hey</Say>
            <Play>hey.mp3</Play>
            <Pause/>
          </Gather>
        </Response>
      XML
      gather = Twilio::TwiML::Gather.new
      gather.say(message: 'Hey')
      gather.play(url: 'hey.mp3')
      gather.pause

      response = Twilio::TwiML::VoiceResponse.new
      response.append(gather)
      doc = parse(response)
      expect(doc).to be_equivalent_to(expected_doc).respecting_element_order
    end

    it 'should render ssml attributes correctly' do
      expected_doc = parse <<-XML
        <Response>
          <Say>
            <say-as interpret-as="spell-out">Twilio</say-as>
          </Say>
        </Response>
      XML

      response = Twilio::TwiML::VoiceResponse.new
      response.say do |s|
        s.say_as('Twilio', interpretAs: 'spell-out')
      end

      expect(parse(response)).to be_equivalent_to(expected_doc).respecting_element_order
    end
  end
end
