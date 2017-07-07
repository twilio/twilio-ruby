module Twilio
  module TwiML

    # Voice TwiML Response
    class VoiceResponse < TwiML
      # Create a new <Response>
      def initialize()
        super()
        self.name = 'Response'
        yield(self) if block_given?
      end

      # Create a <Dial> element
      #
      # == Parameters:
      # number:: phone number to dial
      # action:: action URL
      # method:: action HTTP method
      # timeout:: time to wait for answer
      # hangup_on_star:: hangup call on * press
      # time_limit:: max time length
      # caller_id:: caller ID to display
      # record:: record the call
      # trim:: trim the recording
      # recording_status_callback:: status callback URL
      # recording_status_callback_method:: status callback URL method
      # keyword_args:: additional attributes
      #
      # == Returns:
      # A <Response> element with a <Dial> child element
      def dial(
          number: nil,
          action: nil,
          method: nil,
          timeout: nil,
          hangup_on_star: nil,
          time_limit: nil,
          caller_id: nil,
          record: nil,
          trim: nil,
          recording_status_callback: nil,
          recording_status_callback_method: nil,
          **keyword_args)

        dial = Dial.new(
            number: number,
            action: action,
            method: method,
            timeout: timeout,
            hangup_on_star: hangup_on_star,
            time_limit: time_limit,
            caller_id: caller_id,
            record: record,
            trim: trim,
            recording_status_callback: recording_status_callback,
            recording_status_callback_method: recording_status_callback_method,
            **keyword_args
        )

        yield(dial) if block_given?

        self.append(dial)
      end

      # Create an <Echo> element
      #
      # == Parameters:
      # keyword_args:: attributes
      #
      # == Returns:
      # A <Response> element with an <Echo> child element
      def echo(**keyword_args)
        self.append(Echo.new(**keyword_args))
      end

      # Create an <Enqueue> element
      #
      # == Parameters:
      # name:: friendly name
      # action:: action URL
      # method:: action URL method
      # wait_url:: wait URL
      # wait_url_method:: wait URL method
      # workflow_sid:: TaskRouter workflow SID
      # keyword_args:: additional attributes
      #
      # == Returns:
      # A <Response> element with an <Enqueue> child element
      def enqueue(
        name,
        action: nil,
        method: nil,
        wait_url: nil,
        wait_url_method: nil,
        workflow_sid: nil,
        **keyword_args)

        enqueue = Enqueue.new(
          name,
          action: action,
          method: method,
          wait_url: wait_url,
          wait_url_method: wait_url_method,
          workflow_sid: workflow_sid,
          **keyword_args
        )

        yield(enqueue) if block_given?

        self.append(enqueue)
      end

      # Create a <Gather> element
      #
      # == Parameters:
      # action:: action URL
      # method:: action URL method
      # timeout:: time to wait while gathering input
      # finish_on_key:: finish on key press
      # num_digits:: digits to collect
      # partial_result_callback:: callback url
      # partial_result_callback_method:: callback method
      # language:: locale string
      # hints:: speech recognition hints
      # barge_in:: stop playing media upon speech
      # acknowledge_sound_url:: url to hit when sound starts
      # keyword_args:: additional attributes
      #
      # == Returns:
      # A <Response> element with a <Gather> child element
      def gather(
        action: nil,
        method: nil,
        timeout: nil,
        finish_on_key: nil,
        num_digits: nil,
        partial_result_callback: nil,
        partial_result_callback_method: nil,
        language: nil,
        hints: nil,
        barge_in: nil,
        acknowledge_sound_url: nil,
        **keyword_args)

        gather = Gather.new(
          action: action,
          method: method,
          timeout: timeout,
          finish_on_key: finish_on_key,
          num_digits: num_digits,
          partial_result_callback: partial_result_callback,
          partial_result_callback_method: partial_result_callback_method,
          language: language,
          hints: hints,
          barge_in: barge_in,
          acknowledge_sound_url: acknowledge_sound_url,
          **keyword_args
        )

        yield(gather) if block_given?

        self.append(gather)
      end

      # Create a <Hangup> element
      #
      # == Returns:
      # A <Response> element with a <Hangup> child element
      def hangup()
        self.append(Hangup.new)
      end

      # Create a <Leave> element
      #
      # == Returns:
      # A <Response> element with a <Leave> child element
      def leave()
        self.append(Leave.new)
      end

      # Create a <Pause> element
      #
      # == Parameters:
      # length:: time in seconds to pause
      #
      # == Returns:
      # A <Response> element with a <Pause> child element
      def pause(length: nil)
        self.append(Pause.new(length: length))
      end

      # Create a <Play> element
      #
      # == Parameters:
      # url:: url to play
      # loop:: times to loop
      # digits:: play DTMF tones during a call
      # keyword_args:: additional attributes
      #
      # == Returns:
      # A <Response> element with a <Play> child element
      def play(url: nil, loop: nil, digits: nil, **keyword_args)
        self.append(Play.new(
          url: url,
          loop: loop,
          digits: digits,
          **keyword_args
        ))
      end

      # Create a <Record> element
      #
      # == Parameters:
      # action:: action URL
      # method:: action URL method
      # timeout:: timeout for recording
      # finish_on_key:: finish recording on key
      # max_length:: max length to record
      # play_beep:: play beep
      # trim:: trim the recording
      # recording_status_callback:: status callback for the recordings
      # recording_status_callback_method:: status callback method
      # transcribe:: transcribe the recording
      # transcribe_callback:: transcribe callback URL
      # keyword_args:: additional attributes
      #
      # == Returns:
      # A <Response> element with a <Record> child element
      def record(
        action: nil,
        method: nil,
        timeout: nil,
        finish_on_key: nil,
        max_length: nil,
        play_beep: nil,
        trim: nil,
        recording_status_callback: nil,
        recording_status_callback_method: nil,
        transcribe: nil,
        transcribe_callback: nil,
        **keyword_args)
        self.append(Record.new(
          action: action,
          method: method,
          timeout: timeout,
          finish_on_key: finish_on_key,
          max_length: max_length,
          play_beep: play_beep,
          trim: trim,
          recording_status_callback: recording_status_callback,
          recording_status_callback_method: recording_status_callback_method,
          transcribe: transcribe,
          transcribe_callback: transcribe_callback,
          **keyword_args
        ))
      end

      # Create a <Redirect> element
      #
      # == Parameters:
      # url:: redirect URL
      # method:: redirect method
      # keyword_args:: additional attributes
      #
      # == Returns:
      # A <Response> element with a <Redirect> child element
      def redirect(url, method: nil, **keyword_args)
        self.append(Redirect.new(url, method: method, **keyword_args))
      end

      # Create a <Reject> element
      #
      # == Parameters:
      # reason:: rejection reason
      # keyword_args:: additional attributes
      #
      # == Returns:
      # A <Response> element with a <Reject> child element
      def reject(reason: nil, **keyword_args)
        self.append(Reject.new(reason: reason, **keyword_args))
      end

      # Create a <Say> element
      #
      # == Parameters:
      # body:: message body
      # loop:: times to loop
      # language:: language of message
      # voice:: voice to use
      # keyword_args:: additional attributes
      #
      # == Returns:
      # A <Response> element with a <Say> child element
      def say(body, loop: nil, language: nil, voice: nil, **keyword_args)
        self.append(Say.new(
          body,
          loop: loop,
          language: language,
          voice: voice,
          **keyword_args
        ))
      end

      # Create a <Sms> element
      #
      # == Parameters:
      # body:: body of message
      # to:: to phone number
      # from_:: from phone number
      # method:: action URL method
      # action:: action URL
      # status_callback:: status callback URL
      # keyword_args:: additional attributes
      #
      # == Returns:
      # A <Response> element with a <Sms> child element
      def sms(
        body,
        to: nil,
        from: nil,
        method: nil,
        action: nil,
        status_callback: nil,
        **keyword_args)
        self.append(Sms.new(
          body,
          to: to,
          from: from,
          method: method,
          action: action,
          status_callback: status_callback,
          **keyword_args
        ))
      end
    end

    # <Dial> element
    class Dial < TwiML
      # Create a <Dial> element
      #
      # == Parameters:
      # number:: phone number to dial
      # keyword_args:: additional attributes
      #
      # == Returns:
      # A <Dial> element
      def initialize(number: nil, **keyword_args)
        super(**keyword_args)
        if !(number.nil?)
          @value = number
        end
        yield(self) if block_given?
      end

      # Create a <Client> element
      #
      # == Parameters:
      # name:: name of client
      # method:: action URL method
      # url:: action URL
      # status_callback_event:: events to call status callback
      # status_callback_method:: status callback URL method
      # status_callback:: status callback URL
      # keyword_args:: additional attributes
      #
      # == Returns:
      # A <Dial> element with a <Client> child element
      def client(
        name,
        method: nil,
        url: nil,
        status_callback_event: nil,
        status_callback_method: nil,
        status_callback: nil,
        **keyword_args)
        self.append(Client.new(
          name,
          method: method,
          url: url,
          status_callback_event: status_callback_event,
          status_callback_method: status_callback_method,
          status_callback: status_callback,
          **keyword_args
        ))
      end

      # Create a <Conference> element
      #
      # == Parameters:
      # name:: name of conference
      # muted:: join the conference muted
      # start_conference_on_enter:: start the conference on enter
      # end_conference_on_exit:: end the conference on exit
      # max_participants:: max number of people in conference
      # beep:: play beep when joining
      # record:: record the conference
      # trim:: trim the recording
      # wait_method:: wait URL method
      # wait_url:: wait URL to play
      # event_callback_url:: event callback URL
      # status_callback_event:: events to call status callback
      # status_callback:: status callback URL
      # status_callback_method:: status callback URL method
      # recording_status_callback:: recording status callback URL
      # recording_status_callback_method:: recording status callback URL method
      # keyword_args:: additional attributes
      #
      # == Returns:
      # A <Dial> element with a <Conference> child element
      def conference(
        name,
        muted: nil,
        start_conference_on_enter: nil,
        end_conference_on_exit: nil,
        max_participants: nil,
        beep: nil,
        record: nil,
        trim: nil,
        wait_url: nil,
        wait_method: nil,
        event_callback_url: nil,
        status_callback: nil,
        status_callback_event: nil,
        status_callback_method: nil,
        recording_status_callback: nil,
        recording_status_callback_method: nil,
        **keyword_args)
        self.append(Conference.new(
          name,
          muted: muted,
          start_conference_on_enter: start_conference_on_enter,
          end_conference_on_exit: end_conference_on_exit,
          max_participants: max_participants,
          beep: beep,
          record: record,
          trim: trim,
          wait_url: wait_url,
          wait_method: wait_method,
          event_callback_url: event_callback_url,
          status_callback: status_callback,
          status_callback_event: status_callback_event,
          status_callback_method: status_callback_method,
          recording_status_callback: recording_status_callback,
          recording_status_callback_method: recording_status_callback_method,
          **keyword_args
        ))
      end

      # Create a <Number> element
      #
      # == Parameters:
      # number:: phone number to dial
      # send_digits:: play DTMF tones when the call is answered
      # url:: TwiML URL
      # method:: TwiML URL method
      # status_callback_event:: events to call status callback
      # status_callback:: status callback URL
      # status_callback_method:: status callback URL method
      # keyword_args:: additional attributes
      #
      # == Returns:
      # A <Dial> element with a <Number> child element
      def number(
        number,
        send_digits: nil,
        url: nil,
        method: nil,
        status_callback: nil,
        status_callback_event: nil,
        status_callback_method: nil,
        **keyword_args)
        self.append(Number.new(
          number,
          send_digits: send_digits,
          url: url,
          method: method,
          status_callback: status_callback,
          status_callback_event: status_callback_event,
          status_callback_method: status_callback_method,
          **keyword_args
        ))
      end

      # Create a <Queue> element
      #
      # == Parameters:
      # queue_name:: queue name
      # url:: action URL
      # method:: action URL method
      # reservation_sid:: TaskRouter reservation SID
      # post_work_activity_sid:: TaskRouter activity SID
      # keyword_args:: additional attributes
      #
      # == Returns:
      # A <Dial> element with a <Queue> child element
      def queue(
        queue_name,
        url: nil,
        method: nil,
        reservation_sid: nil,
        post_work_activity_sid: nil,
        **keyword_args)
        self.append(Queue.new(
          queue_name,
          url: url,
          method: method,
          reservation_sid: reservation_sid,
          post_work_activity_sid: post_work_activity_sid,
          **keyword_args
        ))
      end

      # Create a <Sim> element
      #
      # == Parameters:
      # sid:: sim sid
      # keyword_args:: additional attributes
      #
      # == Returns:
      # A <Dial> element with a <Sim> child element
      def sim(sid, **keyword_args)
        self.append(Sim.new(sid, **keyword_args))
      end

      # Create a <Sip> element
      #
      # == Parameters:
      # uri:: sip url
      # username:: sip username
      # password:: sip password
      # url:: action URL
      # method:: action URL method
      # status_callback_event:: events to call status callback
      # status_callback:: status callback URL
      # status_callback_method:: status callback URL method
      # keyword_args:: additional attributes
      #
      # == Returns:
      # A <Dial> element with a <Sip> child element
      def sip(
        uri,
        username: nil,
        password: nil,
        url: nil,
        method: nil,
        status_callback: nil,
        status_callback_event: nil,
        status_callback_method: nil,
        **keyword_args)
        self.append(Sip.new(
          uri,
          username: username,
          password: password,
          url: url,
          method: method,
          status_callback: status_callback,
          status_callback_event: status_callback_event,
          status_callback_method: status_callback_method,
          **keyword_args
        ))
      end
    end

    # <Client> element
    class Client < TwiML
      # Create a <Client> element
      #
      # == Parameters:
      # name:: name of client
      # keyword_args:: additional attributes
      #
      # == Returns:
      # A <Client> element
      def initialize(name, **keyword_args)
        super(**keyword_args)
        @value = name
      end
    end

    # <Conference> element
    class Conference < TwiML
      # Create a <Conference> element
      #
      # == Parameters:
      # name:: name of conference
      # keyword_args:: additional attributes
      #
      # == Returns:
      # A <Conference> element
      def initialize(name, **keyword_args)
        super(**keyword_args)
        @value = name
      end
    end

    # <Number> element
    class Number < TwiML
      # Create a <Number> element
      #
      # == Parameters:
      # number:: phone number
      # keyword_args:: additional attributes
      #
      # == Returns:
      # A <Number> element
      def initialize(number, **keyword_args)
        super(**keyword_args)
        @value = number
      end
    end

    # <Queue> element
    class Queue < TwiML
      # Create a <Queue> element
      #
      # == Parameters:
      # queue_name:: name of queues
      # keyword_args:: additional attributes
      #
      # == Returns:
      # A <Queue> element
      def initialize(queue_name, **keyword_args)
        super(**keyword_args)
        @value = queue_name
      end
    end

    # <Sim> element
    class Sim < TwiML
      # Create a <Sim> element
      #
      # == Parameters:
      # sid:: sim sid
      # keyword_args:: additional attributes
      #
      # == Returns:
      # A <Sim> element
      def initialize(sid, **keyword_args)
        super(**keyword_args)
        @value = sid
      end
    end
    # <Sip> element
    class Sip < TwiML
      # Create a <Sip> element
      #
      # == Parameters:
      # uri:: sip uri
      # keyword_args:: additional attributes
      #
      # == Returns:
      # A <Sip> element
      def initialize(uri, **keyword_args)
        super(**keyword_args)
        @value = uri
      end
    end

    # <Echo> element
    class Echo < TwiML
      # Create a <Echo> element
      #
      # == Parameters:
      # keyword_args:: additional attributes
      #
      # == Returns:
      # A <Echo> element
      def initialize(**keyword_args)
        super(**keyword_args)
      end
    end

    # <Enqueue> element
    class Enqueue < TwiML
      # Create a <Enqueue> element
      #
      # == Parameters:
      # name:: queue name
      # keyword_args:: additional attributes
      #
      # == Returns:
      # A <Enqueue> element
      def initialize(name, **keyword_args)
        super(**keyword_args)
        @value = name
        yield(self) if block_given?
      end

      # Create a <Task> element
      #
      # == Parameters:
      # attributes:: attributes for a task
      # keyword_args:: additional attributes
      #
      # == Returns:
      # An <Enqueue> element with a <Task> child element
      def task(attributes, **keyword_args)
        self.append(Task.new(attributes, **keyword_args))
      end
    end

    # <Task> element
    class Task < TwiML
      # Create a <Task> element
      #
      # == Parameters:
      # attributes:: attributes for a task
      # keyword_args:: additional attributes
      #
      # == Returns:
      # A <Task> element
      def initialize(attributes, **keyword_args)
        super(**keyword_args)
        if attributes.is_a?(String)
          @value = attributes
        else
          @value = JSON.generate(attributes)
        end
      end
    end

    # <Gather> element
    class Gather < TwiML
      # Create a <Gather> element
      #
      # == Parameters:
      # keyword_args:: additional attributes
      #
      # == Returns:
      # A <Gather> element
      def initialize(**keyword_args)
        super(**keyword_args)
        yield(self) if block_given?
      end

      # Create a <Say> element
      #
      # == Parameters:
      # name:: name of client
      # body:: message body
      # loop:: times to loop
      # language:: message language
      # voice:: voice to use
      # keyword_args:: additional attributes
      #
      # == Returns:
      # A <Gather> element with a <Say> child element
      def say(
        body,
        loop: nil,
        language: nil,
        voice: nil,
        **keyword_args)
        self.append(Say.new(
          body,
          loop: loop,
          language: language,
          voice: voice,
          **keyword_args
        ))
      end

      # Create a <Play> element
      #
      # == Parameters:
      # url:: media URL
      # loop:: times to loop
      # digits:: digits to simulate
      # keyword_args:: additional attributes
      #
      # == Returns:
      # A <Gather> element with a <Play> child element
      def play(url: nil, loop: nil, digits: nil, **keyword_args)
        self.append(Play.new(
          url: url,
          loop: loop,
          digits: digits,
          **keyword_args
        ))
      end

      # Create a <Pause> element
      #
      # == Parameters:
      # length:: time to pause
      #
      # == Returns:
      # A <Gather> element with a <Pause> child element
      def pause(length: nil)
        self.append(Pause.new(length: length))
      end
    end

    # <Pause> element
    class Pause < TwiML
      # Create a <Pause> element
      #
      # == Parameters:
      # keyword_args:: additional attributes
      #
      # == Returns:
      # A <Pause> element
      def initialize(**keyword_args)
        super(**keyword_args)
      end
    end

    # <Play> element
    class Play < TwiML
      # Create a <Play> element
      #
      # == Parameters:
      # url:: media URL
      # keyword_args:: additional attributes
      #
      # == Returns:
      # A <Play> element
      def initialize(url: nil, **keyword_args)
        super(**keyword_args)
        @value = url
      end
    end

    # <Say> element
    class Say < TwiML
      # Create a <Say> element
      #
      # == Parameters:
      # body:: message body
      # keyword_args:: additional attributes
      #
      # == Returns:
      # A <Say> element
      def initialize(body, **keyword_args)
        super(**keyword_args)
        @value = body
      end
    end

    # <Hangup> element
    class Hangup < TwiML
      # Create a <hangup_on_star> element
      #
      # == Parameters:
      # keyword_args:: additional attributes
      #
      # == Returns:
      # A <hangup_on_star> element
      def initialize(**keyword_args)
        super(**keyword_args)
      end
    end

    # <Leave> element
    class Leave < TwiML
      # Create a <Leave> element
      #
      # == Parameters:
      # keyword_args:: additional attributes
      #
      # == Returns:
      # A <Leave> element
      def initialize(**keyword_args)
        super(**keyword_args)
      end
    end

    # <Record> element
    class Record < TwiML
      # Create a <Record> element
      #
      # == Parameters:
      # keyword_args:: additional attributes
      #
      # == Returns:
      # A <Record> element
      def initialize(**keyword_args)
        super(**keyword_args)
      end
    end

    # <Redirect> element
    class Redirect < TwiML
      # Create a <Redirect> element
      #
      # == Parameters:
      # url:: TwiML URL
      # keyword_args:: additional attributes
      #
      # == Returns:
      # A <Redirect> element
      def initialize(url, **keyword_args)
        super(**keyword_args)
        @value = url
      end
    end

    # <Reject> element
    class Reject < TwiML
      # Create a <Reject> element
      #
      # == Parameters:
      # keyword_args:: additional attributes
      #
      # == Returns:
      # A <Reject> element
      def initialize(**keyword_args)
        super(**keyword_args)
      end
    end

    # <Sms> element
    class Sms < TwiML
      # Create a <Sms> element
      #
      # == Parameters:
      # body:: message body
      # keyword_args:: additional attributes
      #
      # == Returns:
      # A <Sms> element
      def initialize(body, **keyword_args)
        super(**keyword_args)
        @value = body
      end
    end
  end
end
