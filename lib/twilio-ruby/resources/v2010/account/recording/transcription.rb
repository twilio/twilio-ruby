module Twilio
  module Resources
    module V2010
      class AccountInstance
        class RecordingInstance
          class TranscriptionList < ListResource
            can :list, :get
            command_alias :transcriptions
            
            def initialize(client, inheritance={})
              super
              path "/Accounts/#{@account_sid}/Recordings/#{@recording_sid}/Transcriptions.json"
              instance_id_key 'sid'
              instance_class TranscriptionInstance
              list_key 'transcriptions'
            end
          end
        
          class TranscriptionInstance < InstanceResource
            can :delete
            
            def initialize(client, inheritance={}, params={})
              super
              path "/Accounts/#{@account_sid}/Recordings/#{@recording_sid}/Transcriptions/#{@sid}.json"
              instance_id_key 'sid'
            end
          end
        end
      end
    end
  end
end