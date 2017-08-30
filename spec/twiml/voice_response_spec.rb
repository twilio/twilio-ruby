require 'spec_helper'

describe Twilio::TwiML::VoiceResponse do
  context 'Testing Response' do
    it 'should allow empty response' do
      r = Twilio::TwiML::VoiceResponse.new
      expect(r.to_s).to eq('<?xml version="1.0" encoding="UTF-8"?><Response/>')
    end

    it 'should allow using to_xml instead of to_s' do
      r = Twilio::TwiML::VoiceResponse.new
      expect(r.to_xml).to eq('<?xml version="1.0" encoding="UTF-8"?><Response/>')
    end

    it 'should allow populated response' do
      r = Twilio::TwiML::VoiceResponse.new
      r.hangup
      r.leave
      r.sms('twilio sms', to: '+11234567890', from: '+10987654321')

      expect(r.to_s).to eq('<?xml version="1.0" encoding="UTF-8"?><Response><Hangup/><Leave/><Sms from="+10987654321" to="+11234567890">twilio sms</Sms></Response>')
    end

    it 'should allow chaining' do
      r = Twilio::TwiML::VoiceResponse.new.hangup.leave.sms(
        'twilio sms',
        to: '+11234567890',
        from: '+10987654321'
      )

      expect(r.to_s).to eq('<?xml version="1.0" encoding="UTF-8"?><Response><Hangup/><Leave/><Sms from="+10987654321" to="+11234567890">twilio sms</Sms></Response>')
    end

    it 'should allow nesting' do
      response = Twilio::TwiML::VoiceResponse.new do |r|
        r.hangup
        r.leave
        r.sms('twilio sms', to: '+11234567890', from: '+10987654321')
      end
      expect(response.to_s).to eq('<?xml version="1.0" encoding="UTF-8"?><Response><Hangup/><Leave/><Sms from="+10987654321" to="+11234567890">twilio sms</Sms></Response>')
    end
  end

  context 'Testing Say' do
    it 'should allow empty say' do
      r = Twilio::TwiML::VoiceResponse.new
      r.say ''

      # For Ruby 2.0, 2.1, 2.2 both opening and closing tags are generated
      # Ruby 2.4 generates an empty tag
      expect(r.to_s)
        .to eq('<?xml version="1.0" encoding="UTF-8"?><Response><Say></Say></Response>')
        .or(eq('<?xml version="1.0" encoding="UTF-8"?><Response><Say/></Response>'))
    end

    it 'should allow populated say' do
      r = Twilio::TwiML::VoiceResponse.new
      r.say 'Hello World'

      expect(r.to_s).to eq('<?xml version="1.0" encoding="UTF-8"?><Response><Say>Hello World</Say></Response>')
    end

    it 'should allow unicode say' do
      r = Twilio::TwiML::VoiceResponse.new
      r.say 'nécessaire et d\'autres'

      expect(r.to_s).to eq('<?xml version="1.0" encoding="UTF-8"?><Response><Say>nécessaire et d\'autres</Say></Response>')
    end

    it 'should allow looping' do
      r = Twilio::TwiML::VoiceResponse.new
      r.say 'Hello Monkey', loop: 3

      expect(r.to_s).to eq('<?xml version="1.0" encoding="UTF-8"?><Response><Say loop="3">Hello Monkey</Say></Response>')
    end

    it 'should allow languages' do
      r = Twilio::TwiML::VoiceResponse.new
      r.say 'Hello Monkey', language: 'en-gb'

      expect(r.to_s).to eq('<?xml version="1.0" encoding="UTF-8"?><Response><Say language="en-gb">Hello Monkey</Say></Response>')
    end

    it 'should allow all attributes' do
      r = Twilio::TwiML::VoiceResponse.new
      r.say 'Hello Monkey', loop: 3, voice: 'man', language: 'fr'

      expect(r.to_s).to eq('<?xml version="1.0" encoding="UTF-8"?><Response><Say language="fr" loop="3" voice="man">Hello Monkey</Say></Response>')
    end
  end

  context 'Testing Play' do
    it 'should allow empty play' do
      r = Twilio::TwiML::VoiceResponse.new
      r.play

      # For Ruby 2.0, 2.1, 2.2 both opening and closing tags are generated
      # Ruby 2.4 generates an empty tag
      expect(r.to_s)
        .to eq('<?xml version="1.0" encoding="UTF-8"?><Response><Play></Play></Response>')
        .or(eq('<?xml version="1.0" encoding="UTF-8"?><Response><Play/></Response>'))
    end

    it 'should play hello' do
      r = Twilio::TwiML::VoiceResponse.new
      r.play(url: 'http://hellomonkey.mp3')

      expect(r.to_s).to eq('<?xml version="1.0" encoding="UTF-8"?><Response><Play>http://hellomonkey.mp3</Play></Response>')
    end

    it 'should play hello on loop' do
      r = Twilio::TwiML::VoiceResponse.new
      r.play(url: 'http://hellomonkey.mp3', loop: 3)

      expect(r.to_s).to eq('<?xml version="1.0" encoding="UTF-8"?><Response><Play loop="3">http://hellomonkey.mp3</Play></Response>')
    end

    it 'should play digits' do
      r = Twilio::TwiML::VoiceResponse.new
      r.play(digits: 'w123')

      # For Ruby 2.0, 2.1, 2.2 both opening and closing tags are generated
      # Ruby 2.4 generates an empty tag
      expect(r.to_s)
        .to eq('<?xml version="1.0" encoding="UTF-8"?><Response><Play digits="w123"></Play></Response>')
        .or(eq('<?xml version="1.0" encoding="UTF-8"?><Response><Play digits="w123"/></Response>'))
    end
  end

  context 'Testing Record' do
    it 'should allow empty record' do
      r = Twilio::TwiML::VoiceResponse.new
      r.record

      expect(r.to_s).to eq('<?xml version="1.0" encoding="UTF-8"?><Response><Record/></Response>')
    end

    it 'should allow action and method' do
      r = Twilio::TwiML::VoiceResponse.new
      r.record(action: 'example.com', method: 'GET')

      expect(r.to_s).to eq('<?xml version="1.0" encoding="UTF-8"?><Response><Record action="example.com" method="GET"/></Response>')
    end

    it 'should allow max_length, finish_on_key, and timeout' do
      r = Twilio::TwiML::VoiceResponse.new
      r.record(timeout: 4, finish_on_key: '#', max_length: 30)

      expect(r.to_s).to eq('<?xml version="1.0" encoding="UTF-8"?><Response><Record finishOnKey="#" maxLength="30" timeout="4"/></Response>')
    end

    it 'should allow transcribe' do
      r = Twilio::TwiML::VoiceResponse.new
      r.record(transcribe_callback: 'example.com')

      expect(r.to_s).to eq('<?xml version="1.0" encoding="UTF-8"?><Response><Record transcribeCallback="example.com"/></Response>')
    end
  end

  context 'Testing Redirect' do
    it 'should allow empty redirect' do
      r = Twilio::TwiML::VoiceResponse.new
      r.redirect ''

      # For Ruby 2.0, 2.1, 2.2 both opening and closing tags are generated
      # Ruby 2.4 generates an empty tag
      expect(r.to_s)
        .to eq('<?xml version="1.0" encoding="UTF-8"?><Response><Redirect></Redirect></Response>')
        .or(eq('<?xml version="1.0" encoding="UTF-8"?><Response><Redirect/></Response>'))
    end

    it 'should allow method' do
      r = Twilio::TwiML::VoiceResponse.new
      r.redirect('example.com', method: 'POST')

      expect(r.to_s).to eq('<?xml version="1.0" encoding="UTF-8"?><Response><Redirect method="POST">example.com</Redirect></Response>')
    end

    it 'should allow method and params' do
      r = Twilio::TwiML::VoiceResponse.new
      r.redirect('example.com?id=34&action=hey', method: 'POST')

      expect(r.to_s).to eq('<?xml version="1.0" encoding="UTF-8"?><Response><Redirect method="POST">example.com?id=34&amp;action=hey</Redirect></Response>')
    end
  end

  context 'Testing Hangup' do
    it 'should allow hangup' do
      r = Twilio::TwiML::VoiceResponse.new
      r.hangup

      expect(r.to_s).to eq('<?xml version="1.0" encoding="UTF-8"?><Response><Hangup/></Response>')
    end
  end

  context 'Testing Leave' do
    it 'should allow leave' do
      r = Twilio::TwiML::VoiceResponse.new
      r.leave

      expect(r.to_s).to eq('<?xml version="1.0" encoding="UTF-8"?><Response><Leave/></Response>')
    end
  end

  context 'Testing Reject' do
    it 'should reject with a default reason' do
      r = Twilio::TwiML::VoiceResponse.new
      r.reject

      expect(r.to_s).to eq('<?xml version="1.0" encoding="UTF-8"?><Response><Reject/></Response>')
    end
  end

  context 'Testing SMS' do
    it 'should allow empty SMS' do
      r = Twilio::TwiML::VoiceResponse.new
      r.sms ''

      # For Ruby 2.0, 2.1, 2.2 both opening and closing tags are generated
      # Ruby 2.4 generates an empty tag
      expect(r.to_s)
        .to eq('<?xml version="1.0" encoding="UTF-8"?><Response><Sms></Sms></Response>')
        .or(eq('<?xml version="1.0" encoding="UTF-8"?><Response><Sms/></Response>'))
    end

    it 'should allow SMS body' do
      r = Twilio::TwiML::VoiceResponse.new
      r.sms 'Hello, World'

      expect(r.to_s).to eq('<?xml version="1.0" encoding="UTF-8"?><Response><Sms>Hello, World</Sms></Response>')
    end

    it 'should allow to, from, action, and status_callback' do
      r = Twilio::TwiML::VoiceResponse.new
      r.sms('Hello, World', to: 1_231_231_234, from: 3_453_453_456, status_callback: 'example.com?id=34&action=hey')

      expect(r.to_s).to eq('<?xml version="1.0" encoding="UTF-8"?><Response><Sms from="3453453456" statusCallback="example.com?id=34&amp;action=hey" to="1231231234">Hello, World</Sms></Response>')
    end

    it 'should allow action and method' do
      r = Twilio::TwiML::VoiceResponse.new
      r.sms('Hello', method: 'POST', action: 'example.com?id=34&action=hey')

      expect(r.to_s).to eq('<?xml version="1.0" encoding="UTF-8"?><Response><Sms action="example.com?id=34&amp;action=hey" method="POST">Hello</Sms></Response>')
    end
  end

  context 'Testing Conference' do
    it 'should allow basic conferencing' do
      d = Twilio::TwiML::Dial.new
      d.conference(
        'TestConferenceAttributes',
        beep: false,
        wait_url: '',
        start_conference_on_enter: true,
        end_conference_on_exit: true
      )

      r = Twilio::TwiML::VoiceResponse.new
      r.append(d)

      expect(r.to_s).to eq('<?xml version="1.0" encoding="UTF-8"?><Response><Dial><Conference beep="false" endConferenceOnExit="true" startConferenceOnEnter="true" waitUrl="">TestConferenceAttributes</Conference></Dial></Response>')
    end

    it 'should allow muted conferencing' do
      d = Twilio::TwiML::Dial.new
      d.conference(
        'TestConferenceMutedAttribute',
        beep: false,
        muted: true,
        wait_url: '',
        start_conference_on_enter: true,
        end_conference_on_exit: true
      )

      r = Twilio::TwiML::VoiceResponse.new
      r.append(d)

      expect(r.to_s).to eq('<?xml version="1.0" encoding="UTF-8"?><Response><Dial><Conference beep="false" endConferenceOnExit="true" muted="true" startConferenceOnEnter="true" waitUrl="">TestConferenceMutedAttribute</Conference></Dial></Response>')
    end
  end

  context 'Testing Queue' do
    it 'should allow queues in VoiceResponse' do
      d = Twilio::TwiML::Dial.new
      d.queue('TestQueueAttribute', url: '', method: 'GET')

      r = Twilio::TwiML::VoiceResponse.new
      r.append(d)

      expect(r.to_s).to eq('<?xml version="1.0" encoding="UTF-8"?><Response><Dial><Queue method="GET" url="">TestQueueAttribute</Queue></Dial></Response>')
    end
  end

  context 'Testing Echo' do
    it 'should allow VoiceResponse Echo' do
      r = Twilio::TwiML::VoiceResponse.new
      r.echo

      expect(r.to_s).to eq('<?xml version="1.0" encoding="UTF-8"?><Response><Echo/></Response>')
    end
  end

  context 'Testing Enqueue' do
    it 'should allow VoiceResponse.enqueue' do
      r = Twilio::TwiML::VoiceResponse.new
      r.enqueue(
        name: 'TestEnqueueAttribute',
        action: 'act',
        method: 'GET',
        wait_url: 'wait',
        wait_url_method: 'POST'
      )

      expect(r.to_s).to eq('<?xml version="1.0" encoding="UTF-8"?><Response><Enqueue action="act" method="GET" waitUrl="wait" waitUrlMethod="POST">TestEnqueueAttribute</Enqueue></Response>')
    end

    it 'should allow Enqueue.task and appending Enqueue' do
      e = Twilio::TwiML::Enqueue.new(name: nil, workflow_sid: '123123123')
      e.task('{"account_sid": "AC123123123"}')

      r = Twilio::TwiML::VoiceResponse.new
      r.append(e)

      expect(r.to_s).to eq('<?xml version="1.0" encoding="UTF-8"?><Response><Enqueue workflowSid="123123123"><Task>{"account_sid": "AC123123123"}</Task></Enqueue></Response>')
    end

    it 'should allow Enqueue.task with a dictionary and appending Enqueue' do
      e = Twilio::TwiML::Enqueue.new(name: nil, workflow_sid: '123123123')
      e.task({ account_sid: 'AC123123123' })

      r = Twilio::TwiML::VoiceResponse.new
      r.append(e)

      expect(r.to_s).to eq('<?xml version="1.0" encoding="UTF-8"?><Response><Enqueue workflowSid="123123123"><Task>{"account_sid":"AC123123123"}</Task></Enqueue></Response>')
    end
  end

  context 'Testing Dial' do
    it 'should allow VoiceResponse.dial' do
      r = Twilio::TwiML::VoiceResponse.new
      r.dial(number: '1231231234')

      expect(r.to_s).to eq('<?xml version="1.0" encoding="UTF-8"?><Response><Dial>1231231234</Dial></Response>')
    end

    it 'should allow Dial.sim' do
      d = Twilio::TwiML::Dial.new
      d.sim '123123123'

      r = Twilio::TwiML::VoiceResponse.new
      r.append(d)

      expect(r.to_s).to eq('<?xml version="1.0" encoding="UTF-8"?><Response><Dial><Sim>123123123</Sim></Dial></Response>')
    end

    it 'should allow Dial.sip' do
      d = Twilio::TwiML::Dial.new
      d.sip 'foo@example.com'

      r = Twilio::TwiML::VoiceResponse.new
      r.append(d)

      expect(r.to_s).to eq('<?xml version="1.0" encoding="UTF-8"?><Response><Dial><Sip>foo@example.com</Sip></Dial></Response>')
    end

    it 'should allow Dial.sip with username, password' do
      d = Twilio::TwiML::Dial.new
      d.sip('foo@example.com', username: 'foo', password: 'bar')

      r = Twilio::TwiML::VoiceResponse.new
      r.append(d)

      expect(r.to_s).to eq('<?xml version="1.0" encoding="UTF-8"?><Response><Dial><Sip password="bar" username="foo">foo@example.com</Sip></Dial></Response>')
    end

    it 'should allow Dial.number' do
      d = Twilio::TwiML::Dial.new
      d.number '1231231234'

      r = Twilio::TwiML::VoiceResponse.new
      r.append(d)

      expect(r.to_s).to eq('<?xml version="1.0" encoding="UTF-8"?><Response><Dial><Number>1231231234</Number></Dial></Response>')
    end

    it 'should allow Dial.number with params' do
      d = Twilio::TwiML::Dial.new
      d.number('1231231234', status_callback: 'http://example.com', status_callback_event: 'initiated completed')

      r = Twilio::TwiML::VoiceResponse.new
      r.append(d)

      expect(r.to_s).to eq('<?xml version="1.0" encoding="UTF-8"?><Response><Dial><Number statusCallback="http://example.com" statusCallbackEvent="initiated completed">1231231234</Number></Dial></Response>')
    end

    it 'should allow Dial.conference' do
      d = Twilio::TwiML::Dial.new
      d.conference 'My Room'

      r = Twilio::TwiML::VoiceResponse.new
      r.append(d)

      expect(r.to_s).to eq('<?xml version="1.0" encoding="UTF-8"?><Response><Dial><Conference>My Room</Conference></Dial></Response>')
    end

    it 'should allow Dial.queue' do
      d = Twilio::TwiML::Dial.new
      d.queue 'The Cute Queue'

      r = Twilio::TwiML::VoiceResponse.new
      r.append(d)

      expect(r.to_s).to eq('<?xml version="1.0" encoding="UTF-8"?><Response><Dial><Queue>The Cute Queue</Queue></Dial></Response>')
    end

    it 'should allow empty Dial.client' do
      d = Twilio::TwiML::Dial.new
      d.client ''

      r = Twilio::TwiML::VoiceResponse.new
      r.append(d)

      # For Ruby 2.0, 2.1, 2.2 both opening and closing tags are generated
      # Ruby 2.4 generates an empty tag
      expect(r.to_s)
        .to eq('<?xml version="1.0" encoding="UTF-8"?><Response><Dial><Client></Client></Dial></Response>')
        .or(eq('<?xml version="1.0" encoding="UTF-8"?><Response><Dial><Client/></Dial></Response>'))
    end

    it 'should allow populated Dial.client' do
      d = Twilio::TwiML::Dial.new
      d.client 'alice'

      r = Twilio::TwiML::VoiceResponse.new
      r.append(d)

      expect(r.to_s).to eq('<?xml version="1.0" encoding="UTF-8"?><Response><Dial><Client>alice</Client></Dial></Response>')
    end
  end

  context 'Testing Gather' do
    it 'should allow empty Gather' do
      r = Twilio::TwiML::VoiceResponse.new
      r.gather

      expect(r.to_s).to eq('<?xml version="1.0" encoding="UTF-8"?><Response><Gather/></Response>')
    end

    it 'should allow Gather.say' do
      g = Twilio::TwiML::Gather.new
      g.say 'Hello'

      r = Twilio::TwiML::VoiceResponse.new
      r.append(g)

      expect(r.to_s).to eq('<?xml version="1.0" encoding="UTF-8"?><Response><Gather><Say>Hello</Say></Gather></Response>')
    end

    it 'should allow nested play and pause' do
      g = Twilio::TwiML::Gather.new
      g.say 'Hey'
      g.play(url: 'hey.mp3')
      g.pause

      r = Twilio::TwiML::VoiceResponse.new
      r.append(g)

      expect(r.to_s).to eq('<?xml version="1.0" encoding="UTF-8"?>' \
                             '<Response>' \
                               '<Gather>' \
                                 '<Say>Hey</Say>' \
                                 '<Play>hey.mp3</Play>' \
                                 '<Pause/>' \
                               '</Gather>' \
                             '</Response>')
    end
  end
end
