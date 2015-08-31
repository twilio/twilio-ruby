module Twilio
  module Resources
    module V2010
      class AccountInstance < Twilio::REST::InstanceResource
        class ConferenceList < Twilio::REST::ListResource
          can :list, :get
          command_alias :conferences
          
          def initialize(client, inheritance={})
            super
            path "/Accounts/#{@account_sid}/Conferences.json"
            instance_id_key 'sid'
            instance_class ConferenceInstance
            list_key 'conferences'
          end
        end
      
        class ConferenceInstance < Twilio::REST::InstanceResource
          def initialize(client, inheritance={}, params={}, query_params={})
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