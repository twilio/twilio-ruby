module Twilio
  module REST
    class Recordings < ListResource; end

    class Recording < InstanceResource
      def initialize(uri, client, params={})
        super uri, client, params
        resource :transcriptions
        # grab a reference to the client's connection object for streaming
        @connection = @client.instance_variable_get :@connection
      end

      def wav
        scheme = @connection.use_ssl ? 'https' : 'http'
        "#{scheme}://#{@connection.address}#{@uri}.wav"
      end

      def wav!(&block)
        @connection.request_get @uri, &block
      end

      def mp3
        scheme = @connection.use_ssl ? 'https' : 'http'
        "#{scheme}://#{@connection.address}#{@uri}.mp3"
      end

      def mp3!(&block)
        @connection.request_get "#{@uri}.mp3", &block
      end
    end
  end
end
