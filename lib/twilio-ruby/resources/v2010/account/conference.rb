module Twilio
  module Resources
    module V2010
      class AccountInstance
        class ConferenceList < ListResource
          can :list, :get
          command_alias :conferences
          
          def initialize(client, inheritance={})
            super
            path "/Accounts/#{@account_sid}/Conferences.json"
            instance_id_key 'sid'
            instance_class ConferenceInstance
          end
        end
      
        class ConferenceInstance < InstanceResource
          def initialize(client, inheritance={}, params={})
            super
            path "/Accounts/#{@account_sid}/Conferences/#{@sid}.json"
            instance_id_key 'sid'
            dependent Twilio::Resources::V2010::AccountInstance::ConferenceInstance::ParticipantList, {
              account_sid: @account_sid,
              conference_sid: @sid
            }
          end
        end
      end
    end
  end
end