module Twilio
  module Resources
    module V2010
      class AccountInstance
        class RecordingList < ListResource
          can :list, :get
          command_alias :recordings
          
          def initialize(client, inheritance={})
            super
            path "/Accounts/#{@account_sid}/Recordings.json"
            instance_id_key 'sid'
            instance_class RecordingInstance
            list_key 'recordings'
          end
        end
      
        class RecordingInstance < InstanceResource
          can :delete
          
          def initialize(client, inheritance={}, params={})
            super
            path "/Accounts/#{@account_sid}/Recordings/#{@sid}.json"
            instance_id_key 'sid'
            dependent Twilio::Resources::V2010::AccountInstance::RecordingInstance::TranscriptionList, {
              account_sid: @account_sid,
              recording_sid: @sid
            }
          end
        end
      end
    end
  end
end