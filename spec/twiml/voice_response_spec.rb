require 'spec_helper'

describe Twilio::TwiML::VoiceResponse do
  context 'Testing Response' do
    it 'should allow empty response' do
      response = Twilio::TwiML::VoiceResponse.new.to_s
      doc = parse(response)
      expect(doc.children.length).to eq(1)
      expect(doc.children.first.name).to eq('Response')
      expect(doc.children.first.content).to be_empty
    end

    it 'should allow using to_xml instead of to_s' do
      response = Twilio::TwiML::VoiceResponse.new.to_xml
      doc = parse(response)
      expect(doc.children.length).to eq(1)
      expect(doc.children.first.name).to eq('Response')
      expect(doc.children.first.content).to be_empty
      expect(doc.children.first.children).to be_empty
    end

    it 'should have an xml declaration by default' do
      twiml = Twilio::TwiML::VoiceResponse.new.to_xml
      expect(twiml).to match(/\A<\?xml version="1.0" encoding="UTF-8"\?>/)
    end

    it 'should allow no xml_declaration' do
      twiml = Twilio::TwiML::VoiceResponse.new.to_xml(false)
      expect(twiml).not_to match(/\A<\?xml version="1.0" encoding="UTF-8"\?>/)
    end

    it 'should allow populated response' do
      response = Twilio::TwiML::VoiceResponse.new
      response.hangup
      response.leave
      response.sms('twilio sms', to: '+11234567890', from: '+10987654321')

      doc = parse(response)
      response_element = doc.xpath('/Response')
      children = response_element.children
      expect(children.length).to eq(3)
      expect(children[0].name).to eq('Hangup')
      expect(children[0].children).to be_empty
      expect(children[1].name).to eq('Leave')
      expect(children[1].children).to be_empty
      expect(children[2].name).to eq('Sms')
      expect(children[2].content).to eq('twilio sms')
    end

    it 'should allow chaining' do
      response = Twilio::TwiML::VoiceResponse.new.hangup.leave.sms(
        'twilio sms',
        to: '+11234567890',
        from: '+10987654321'
      )

      doc = parse(response)
      response_element = doc.xpath('/Response')
      expect(response_element.children.length).to eq(3)
      children = response_element.children
      expect(children[0].name).to eq('Hangup')
      expect(children[0].children).to be_empty
      expect(children[1].name).to eq('Leave')
      expect(children[1].children).to be_empty
      expect(children[2].name).to eq('Sms')
      expect(children[2].content).to eq('twilio sms')
    end

    it 'should allow nesting' do
      response = Twilio::TwiML::VoiceResponse.new do |r|
        r.hangup
        r.leave
        r.sms('twilio sms', to: '+11234567890', from: '+10987654321')
      end

      doc = parse(response)
      response_element = doc.xpath('/Response')
      expect(response_element.children.length).to eq(3)
      children = response_element.children
      expect(children[0].name).to eq('Hangup')
      expect(children[0].children).to be_empty
      expect(children[1].name).to eq('Leave')
      expect(children[1].children).to be_empty
      expect(children[2].name).to eq('Sms')
      expect(children[2].content).to eq('twilio sms')
    end
  end

  context 'Testing Say' do
    it 'should allow empty say' do
      response = Twilio::TwiML::VoiceResponse.new
      response.say ''

      doc = parse(response)
      says = doc.xpath('/Response/Say')
      expect(says.length).to eq(1)
      expect(says.first.content).to be_empty
    end

    it 'should allow populated say' do
      response = Twilio::TwiML::VoiceResponse.new
      response.say 'Hello World'

      doc = parse(response)
      says = doc.xpath('/Response/Say')
      expect(says.length).to eq(1)
      expect(says.first.content).to eq('Hello World')
    end

    it 'should allow unicode say' do
      response = Twilio::TwiML::VoiceResponse.new
      response.say 'nécessaire et d\'autres'

      doc = parse(response)
      says = doc.xpath('/Response/Say')
      expect(says.length).to eq(1)
      expect(says.first.content).to eq('nécessaire et d\'autres')
    end

    it 'should allow looping' do
      response = Twilio::TwiML::VoiceResponse.new
      response.say 'Hello Monkey', loop: 3

      doc = parse(response)
      say = doc.xpath('/Response/Say').first
      expect(say[:loop]).to eq('3')
    end

    it 'should allow languages' do
      response = Twilio::TwiML::VoiceResponse.new
      response.say 'Hello Monkey', language: 'en-gb'

      doc = parse(response)
      say = doc.xpath('/Response/Say').first
      expect(say[:language]).to eq('en-gb')
    end

    it 'should allow all attributes' do
      response = Twilio::TwiML::VoiceResponse.new
      response.say 'Hello Monkey', loop: 3, voice: 'man', language: 'fr'

      doc = parse(response)
      say = doc.xpath('/Response/Say').first
      expect(say[:language]).to eq('fr')
      expect(say[:voice]).to eq('man')
      expect(say[:loop]).to eq('3')
    end
  end

  context 'Testing Play' do
    it 'should allow empty play' do
      response = Twilio::TwiML::VoiceResponse.new
      response.play

      doc = parse(response)
      plays = doc.xpath('/Response/Play')
      expect(plays.length).to eq(1)
      expect(plays.first.content).to be_empty
    end

    it 'should play hello' do
      response = Twilio::TwiML::VoiceResponse.new
      response.play(url: 'http://hellomonkey.mp3')
      doc = parse(response)
      plays = doc.xpath('/Response/Play')

      expect(plays.length).to eq(1)
      expect(plays.first.content).to eq('http://hellomonkey.mp3')
    end

    it 'should play hello on loop' do
      response = Twilio::TwiML::VoiceResponse.new
      response.play(url: 'http://hellomonkey.mp3', loop: 3)

      doc = parse(response)
      play = doc.xpath('/Response/Play').first
      expect(play[:loop]).to eq('3')
    end

    it 'should play digits' do
      response = Twilio::TwiML::VoiceResponse.new
      response.play(digits: 'w123')

      doc = parse(response)
      play = doc.xpath('/Response/Play').first
      expect(play[:digits]).to eq('w123')
    end
  end

  context 'Testing Record' do
    it 'should allow empty record' do
      response = Twilio::TwiML::VoiceResponse.new
      response.record
      doc = parse(response)
      records = doc.xpath('/Response/Record')
      expect(records.length).to eq(1)
      expect(records.first.content).to be_empty
    end

    it 'should allow action and method' do
      response = Twilio::TwiML::VoiceResponse.new
      response.record(action: 'example.com', method: 'GET')
      doc = parse(response)
      record = doc.xpath('/Response/Record').first
      expect(record[:action]).to eq('example.com')
      expect(record[:method]).to eq('GET')
    end

    it 'should allow max_length, finish_on_key, and timeout' do
      response = Twilio::TwiML::VoiceResponse.new
      response.record(timeout: 4, finish_on_key: '#', max_length: 30)
      doc = parse(response)
      record = doc.xpath('/Response/Record').first
      expect(record[:timeout]).to eq('4')
      expect(record[:finishOnKey]).to eq('#')
      expect(record[:maxLength]).to eq('30')
    end

    it 'should allow transcribe' do
      response = Twilio::TwiML::VoiceResponse.new
      response.record(transcribe_callback: 'example.com')
      doc = parse(response)
      record = doc.xpath('/Response/Record').first
      expect(record[:transcribeCallback]).to eq('example.com')
    end
  end

  context 'Testing Redirect' do
    it 'should allow empty redirect' do
      response = Twilio::TwiML::VoiceResponse.new
      response.redirect ''
      doc = parse(response)
      redirects = doc.xpath('/Response/Redirect')

      expect(redirects.length).to eq(1)
      expect(redirects.first.content).to be_empty
    end

    it 'should allow method' do
      response = Twilio::TwiML::VoiceResponse.new
      response.redirect('example.com', method: 'POST')
      doc = parse(response)
      redirect = doc.xpath('/Response/Redirect').first

      expect(redirect.content).to eq('example.com')
      expect(redirect[:method]).to eq('POST')
    end

    it 'should allow method and params' do
      response = Twilio::TwiML::VoiceResponse.new
      response.redirect('example.com?id=34&action=hey', method: 'POST')
      doc = parse(response)
      redirect = doc.xpath('/Response/Redirect').first

      expect(redirect.content).to eq('example.com?id=34&action=hey')
      expect(redirect[:method]).to eq('POST')
    end
  end

  context 'Testing Hangup' do
    it 'should allow hangup' do
      response = Twilio::TwiML::VoiceResponse.new
      response.hangup
      doc = parse(response)
      hangups = doc.xpath('/Response/Hangup')
      expect(hangups.length).to eq(1)
      expect(hangups.first.content).to be_empty
    end

    it 'should not allow content in the hangup' do
      response = Twilio::TwiML::VoiceResponse.new
      expect { response.hangup "Goodbye" }.to raise_error(ArgumentError)
    end
  end

  context 'Testing Leave' do
    it 'should allow leave' do
      response = Twilio::TwiML::VoiceResponse.new
      response.leave
      doc = parse(response)
      leaves = doc.xpath('/Response/Leave')
      expect(leaves.length).to eq(1)
      expect(leaves.first.content).to be_empty
    end

    it 'should not allow content in the leave' do
      response = Twilio::TwiML::VoiceResponse.new
      expect { response.leave "Goodbye" }.to raise_error(ArgumentError)
    end
  end

  context 'Testing Reject' do
    it 'should reject with a default reason' do
      response = Twilio::TwiML::VoiceResponse.new
      response.reject
      doc = parse(response)
      rejects = doc.xpath('/Response/Reject')
      expect(rejects.length).to eq(1)
      expect(rejects.first.content).to be_empty
    end

    it 'should not allow content in the reject' do
      response = Twilio::TwiML::VoiceResponse.new
      expect { response.reject "Goodbye" }.to raise_error(ArgumentError)
    end
  end

  context 'Testing SMS' do
    it 'should allow empty SMS' do
      response = Twilio::TwiML::VoiceResponse.new
      response.sms ''
      doc = parse(response)
      smses = doc.xpath('/Response/Sms')
      expect(smses.length).to eq(1)
      expect(smses.first.content).to be_empty
    end

    it 'should allow SMS body' do
      response = Twilio::TwiML::VoiceResponse.new
      response.sms 'Hello, World'
      doc = parse(response)
      sms = doc.xpath('/Response/Sms').first
      expect(sms.content).to eq('Hello, World')
    end

    it 'should allow to, from, action, and status_callback' do
      response = Twilio::TwiML::VoiceResponse.new
      response.sms('Hello, World', to: 1_231_231_234, from: 3_453_453_456, status_callback: 'example.com?id=34&action=hey')
      doc = parse(response)
      sms = doc.xpath('/Response/Sms').first
      expect(sms[:to]).to eq('1231231234')
      expect(sms[:from]).to eq('3453453456')
      expect(sms[:statusCallback]).to eq('example.com?id=34&action=hey')
    end

    it 'should allow action and method' do
      response = Twilio::TwiML::VoiceResponse.new
      response.sms('Hello', method: 'POST', action: 'example.com?id=34&action=hey')
      doc = parse(response)
      sms = doc.xpath('/Response/Sms').first
      expect(sms[:action]).to eq('example.com?id=34&action=hey')
      expect(sms[:method]).to eq('POST')
    end
  end

  context 'Testing Conference' do
    it 'should allow basic conferencing' do
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
      conferences = doc.xpath('/Response/Dial/Conference')
      expect(conferences.length).to eq(1)
      conference = conferences.first
      expect(conference.content).to eq('TestConferenceAttributes')
      expect(conference[:beep]).to eq('false')
      expect(conference[:waitUrl]).to be_empty
      expect(conference[:startConferenceOnEnter]).to eq('true')
      expect(conference[:endConferenceOnExit]).to eq('true')
    end

    it 'should allow muted conferencing' do
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
      conference = doc.xpath('/Response/Dial/Conference').first
      expect(conference[:muted]).to eq('true')
    end
  end

  context 'Testing Queue' do
    it 'should allow queues in VoiceResponse' do
      dial = Twilio::TwiML::Dial.new
      dial.queue('TestQueueAttribute', url: '', method: 'GET')

      response = Twilio::TwiML::VoiceResponse.new
      response.append(dial)
      doc = parse(response)
      queues = doc.xpath('/Response/Dial/Queue')
      expect(queues.length).to eq(1)
      queue = queues.first
      expect(queue.content).to eq('TestQueueAttribute')
      expect(queue[:url]).to be_empty
      expect(queue[:method]).to eq('GET')
    end
  end

  context 'Testing Echo' do
    it 'should allow VoiceResponse Echo' do
      response = Twilio::TwiML::VoiceResponse.new
      response.echo
      doc = parse(response)
      echoes = doc.xpath('/Response/Echo')
      expect(echoes.length).to eq(1)
      expect(echoes.first.content).to be_empty
    end
  end

  context 'Testing Enqueue' do
    it 'should allow VoiceResponse.enqueue' do
      response = Twilio::TwiML::VoiceResponse.new
      response.enqueue(
        name: 'TestEnqueueAttribute',
        action: 'act',
        method: 'GET',
        wait_url: 'wait',
        wait_url_method: 'POST'
      )
      doc = parse(response)
      enqueues = doc.xpath('/Response/Enqueue')
      expect(enqueues.length).to eq(1)
      enqueue = enqueues.first
      expect(enqueue.content).to eq('TestEnqueueAttribute')
      expect(enqueue[:action]).to eq('act')
      expect(enqueue[:method]).to eq('GET')
      expect(enqueue[:waitUrl]).to eq('wait')
      expect(enqueue[:waitUrlMethod]).to eq('POST')
    end

    it 'should allow Enqueue.task and appending Enqueue' do
      enqueue_elem = Twilio::TwiML::Enqueue.new(name: nil, workflow_sid: '123123123')
      task_json = '{"account_sid": "AC123123123"}'
      enqueue_elem.task(task_json)

      response = Twilio::TwiML::VoiceResponse.new
      response.append(enqueue_elem)
      doc = parse(response)

      enqueue = doc.xpath('/Response/Enqueue').first
      expect(enqueue[:workflowSid]).to eq('123123123')
      tasks = enqueue.xpath('./Task')
      expect(tasks.length).to eq(1)
      expect(tasks.first.content).to eq(task_json)
    end

    it 'should allow Enqueue.task with a dictionary and appending Enqueue' do
      enqueue_elem = Twilio::TwiML::Enqueue.new(name: nil, workflow_sid: '123123123')
      enqueue_elem.task(account_sid: 'AC123123123')

      response = Twilio::TwiML::VoiceResponse.new
      response.append(enqueue_elem)

      doc = parse(response)
      task = doc.xpath('/Response/Enqueue/Task').first
      expect(task.content).to eq('{"account_sid":"AC123123123"}')
    end
  end

  context 'Testing Dial' do
    it 'should allow VoiceResponse.dial' do
      response = Twilio::TwiML::VoiceResponse.new
      response.dial(number: '1231231234')
      doc = parse(response)
      dials = doc.xpath('/Response/Dial')
      expect(dials.length).to eq(1)
      expect(dials.first.content).to eq('1231231234')
    end

    it 'should allow Dial.sim' do
      dial = Twilio::TwiML::Dial.new
      dial.sim '123123123'

      response = Twilio::TwiML::VoiceResponse.new
      response.append(dial)

      doc = parse(response)
      sims = doc.xpath('/Response/Dial/Sim')
      expect(sims.length).to eq(1)
      expect(sims.first.content).to eq('123123123')
    end

    it 'should allow Dial.sip' do
      dial = Twilio::TwiML::Dial.new
      dial.sip 'foo@example.com'

      response = Twilio::TwiML::VoiceResponse.new
      response.append(dial)
      doc = parse(response)
      sips = doc.xpath('/Response/Dial/Sip')
      expect(sips.length).to eq(1)
      expect(sips.first.content).to eq('foo@example.com')
    end

    it 'should allow Dial.sip with username, password' do
      dial = Twilio::TwiML::Dial.new
      dial.sip('foo@example.com', username: 'foo', password: 'bar')

      response = Twilio::TwiML::VoiceResponse.new
      response.append(dial)
      doc = parse(response)
      sip = doc.xpath('/Response/Dial/Sip').first
      expect(sip[:username]).to eq('foo')
      expect(sip[:password]).to eq('bar')
    end

    it 'should allow Dial.number' do
      dial = Twilio::TwiML::Dial.new
      dial.number '1231231234'

      response = Twilio::TwiML::VoiceResponse.new
      response.append(dial)
      doc = parse(response)
      numbers = doc.xpath('/Response/Dial/Number')
      expect(numbers.length).to eq(1)
      expect(numbers.first.content).to eq('1231231234')
    end

    it 'should allow Dial.number with params' do
      dial = Twilio::TwiML::Dial.new
      dial.number('1231231234', status_callback: 'http://example.com', status_callback_event: 'initiated completed')

      response = Twilio::TwiML::VoiceResponse.new
      response.append(dial)
      doc = parse(response)
      number = doc.xpath('/Response/Dial/Number').first

      expect(number[:statusCallback]).to eq('http://example.com')
      expect(number[:statusCallbackEvent]).to eq('initiated completed')
    end

    it 'should allow Dial.conference' do
      dial = Twilio::TwiML::Dial.new
      dial.conference 'My Room'

      response = Twilio::TwiML::VoiceResponse.new
      response.append(dial)
      doc = parse(response)
      conferences = doc.xpath('/Response/Dial/Conference')
      expect(conferences.length).to eq(1)
      expect(conferences.first.content).to eq('My Room')
    end

    it 'should allow Dial.queue' do
      dial = Twilio::TwiML::Dial.new
      dial.queue 'The Cute Queue'

      response = Twilio::TwiML::VoiceResponse.new
      response.append(dial)
      doc = parse(response)
      queues = doc.xpath('/Response/Dial/Queue')
      expect(queues.length).to eq(1)
      expect(queues.first.content).to eq('The Cute Queue')
    end

    it 'should allow empty Dial.client' do
      dial = Twilio::TwiML::Dial.new
      dial.client ''

      response = Twilio::TwiML::VoiceResponse.new
      response.append(dial)
      doc = parse(response)
      clients = doc.xpath('/Response/Dial/Client')
      expect(clients.length).to eq(1)
      expect(clients.first.content).to be_empty
    end

    it 'should allow populated Dial.client' do
      dial = Twilio::TwiML::Dial.new
      dial.client 'alice'

      response = Twilio::TwiML::VoiceResponse.new
      response.append(dial)
      doc = parse(response)
      client = doc.xpath('/Response/Dial/Client').first
      expect(client.content).to eq('alice')
    end
  end

  context 'Testing Gather' do
    it 'should allow empty Gather' do
      response = Twilio::TwiML::VoiceResponse.new
      response.gather
      doc = parse(response)
      gathers = doc.xpath('/Response/Gather')
      expect(gathers.length).to eq(1)
      expect(gathers.first.content).to be_empty
    end

    it 'should allow nested Say in Gather' do
      gather_elem = Twilio::TwiML::Gather.new
      gather_elem.say 'Hello'

      response = Twilio::TwiML::VoiceResponse.new
      response.append(gather_elem)
      doc = parse(response)
      says = doc.xpath('/Response/Gather/Say')
      expect(says.length).to eq(1)
      expect(says.first.content).to eq('Hello')
    end

    it 'should allow nested play and pause' do
      gather = Twilio::TwiML::Gather.new
      gather.say 'Hey'
      gather.play(url: 'hey.mp3')
      gather.pause

      response = Twilio::TwiML::VoiceResponse.new
      response.append(gather)
      doc = parse(response)
      says = doc.xpath('/Response/Gather/Say')
      plays = doc.xpath('/Response/Gather/Play')
      pauses = doc.xpath('/Response/Gather/Pause')

      expect(says.length).to eq(1)
      expect(says.first.content).to eq('Hey')
      expect(plays.length).to eq(1)
      expect(plays.first.content).to eq('hey.mp3')
      expect(pauses.length).to eq(1)
      expect(pauses.first.content).to be_empty
    end
  end
end
