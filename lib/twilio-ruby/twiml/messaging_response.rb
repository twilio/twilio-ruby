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
          body,
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
        redirect = Redirect.new(url, method: method, **keyword_args)

        yield(redirect) if block_given?

        self.append(redirect)
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
        body = Body.new(body)

        yield(body) if block_given?

        self.append(body)
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
        media = Media.new(url)

        yield(media) if block_given?

        self.append(media)
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
