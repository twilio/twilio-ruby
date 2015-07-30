module Twilio
  module REST
    class Recording
      class Transcriptions < ListResource
        def initialize(client)
          super
          path "/Accounts/#{@account_sid}/Recordings/#{@recording_sid}/Transcriptions.json"
        end
      end

      class Transcription < InstanceResource
        def initialize(client, params={})
          super
          path "/Accounts/#{@account_sid}/Recordings/#{@recording_sid}/Transcriptions/#{@sid}.json"
        end
      end
    end
  end
end
