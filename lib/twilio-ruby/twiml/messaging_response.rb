module Twilio
  module TwiML

    # Messaging TwiML Response
    class MessagingResponse < TwiML
      # Create a new <Response>
      def initialize()
        super()
        self.name = 'Response'
        yield(self) if block_given?
      end

      # Create a <Message> element
      #
      # == Parameters:
      # body:: body of the message
      # to:: number to send to
      # from_:: number to send from
      # method:: action HTTP method
      # action:: action URL
      # status_callback:: callback URL
      # keyword_args:: additional attributes
      #
      # == Returns:
      # A <Response> element with a <Message> child element
      def message(
        body: nil,
        to: nil,
        from: nil,
        method: nil,
        action: nil,
        status_callback: nil,
        **keyword_args)

        message = Message.new(
          body: body,
          to: to,
          from: from,
          method: method,
          action: action,
          status_callback: status_callback,
          **keyword_args
        )

        yield(message) if block_given?

        self.append(message)
      end

      # Create an <Redirect> element
      #
      # == Parameters:
      # url:: URL to redirect to
      # method:: HTTP method
      # keyword_args:: attributes
      #
      # == Returns:
      # A <Response> element with an <Redirect> child element
      def redirect(url, method: nil, **keyword_args)
        self.append(Redirect.new(url, method: method, **keyword_args))
      end
    end

    # <Message> element
    class Message < TwiML
      # Create a <Message> element
      #
      # == Parameters:
      # body:: message body
      # keyword_args:: additional attributes
      #
      # == Returns:
      # A <Message> element
      def initialize(body: nil, **keyword_args)
        super(**keyword_args)
        if !(body.nil?)
          @value = body
        end
        yield(self) if block_given?
      end

      # Create a <Body> element
      #
      # == Parameters:
      # body:: body of message
      # keyword_args:: additional attributes
      #
      # == Returns:
      # A <Message> element with a <Body> child element
      def body(body)
        self.append(Body.new(body))
      end

      # Create a <Media> element
      #
      # == Parameters:
      # body:: body of message
      # keyword_args:: additional attributes
      #
      # == Returns:
      # A <Message> element with a <Media> child element
      def media(url)
        self.append(Media.new(url))
      end
    end

    # <Body> element
    class Body < TwiML
      # Create a <Body> element
      #
      # == Parameters:
      # body:: message body
      #
      # == Returns:
      # A <Body> element
      def initialize(body)
        super()
        @value = body
      end
    end

    # <Media> element
    class Media < TwiML
      # Create a <Media> element
      #
      # == Parameters:
      # url:: media URL location
      #
      # == Returns:
      # A <Media> element
      def initialize(url)
        super()
        @value = url
      end
    end

    # <Redirect> element
    class Redirect < TwiML
      # Create a <Redirect> element
      #
      # == Parameters:
      # url:: redirect URL location
      # keyword_args:: additional attributes
      #
      # == Returns:
      # A <Redirect> element
      def initialize(url, **keyword_args)
        super(**keyword_args)
        @value = url
      end
    end
  end
end
