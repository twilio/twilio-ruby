module Twilio
  module Resources
    module V2010
      class AccountInstance < Twilio::REST::InstanceResource
        class CallInstance < Twilio::REST::InstanceResource
          class RecordingList < Twilio::REST::ListResource
            can :list, :get
            command_alias :recordings
            
            def initialize(client, inheritance={})
              super
              path "/Accounts/#{@account_sid}/Calls/#{@call_sid}/Recordings.json"
              instance_id_key 'sid'
              instance_class RecordingInstance
              list_key 'recordings'
            end
          end
        
          class RecordingInstance < Twilio::REST::InstanceResource
            can :delete
            
            def initialize(client, inheritance={}, params={}, query_params={})
              super
              path "/Accounts/#{@account_sid}/Calls/#{@call_sid}/Recordings/#{@sid}.json"
              instance_id_key 'sid'
            end
          end
        end
      end
    end
  end
end