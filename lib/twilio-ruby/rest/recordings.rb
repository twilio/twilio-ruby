module Twilio
  module REST
    class Recordings < ListResource; end

    class Recording < InstanceResource
      def initialize(path, client, params={})
        path.sub! /\/Calls\/CA[^\/]+/, ''
        super path, client, params
        resource :transcriptions
        # grab a reference to the client's connection object for streaming
        @connection = @client.instance_variable_get :@connection
      end

      ##
      # Return the wav URL for this recording.
      def wav
        "https://#{@connection.address}#{@path}.wav"
      end

      def wav!(&block)
        @connection.request_get @path, &block
      end

      ##
      # Return the mp3 URL for this recording.
      def mp3
        "https://#{@connection.address}#{@path}.mp3"
      end

      def mp3!(&block)
        @connection.request_get "#{@path}.mp3", &block
      end
    end
  end
end
