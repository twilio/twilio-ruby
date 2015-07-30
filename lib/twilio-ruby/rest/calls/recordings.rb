module Twilio
  module REST
    class Call
      class Recordings < ListResource
        can :list, :get

        def initialize(client)
          super
          path "/Accounts/#{@account_sid}/Calls/#{@call_sid}/Recordings.json"
        end
      end

      class Recording < InstanceResource
        can :delete
        
        def initialize(client, params={})
          super
          path "/Accounts/#{@account_sid}/Calls/#{@call_sid}/Recordings/#{@sid}.json"
          # TODO: Compatibility Class
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
end
