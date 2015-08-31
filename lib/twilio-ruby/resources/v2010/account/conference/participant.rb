module Twilio
  module Resources
    module V2010
      class AccountInstance < Twilio::REST::InstanceResource
        class ConferenceInstance < Twilio::REST::InstanceResource
          class ParticipantList < Twilio::REST::ListResource
            can :list, :get
            command_alias :participants
            
            def initialize(client, inheritance={})
              super
              path "/Accounts/#{@account_sid}/Conferences/#{@parent_sid}/Participants.json"
              instance_id_key 'call_sid'
              instance_class ParticipantInstance
              list_key 'participants'
            end
          end
        
          class ParticipantInstance < Twilio::REST::InstanceResource
            can :update, :delete
            
            def initialize(client, inheritance={}, params={}, query_params={})
              super
              path "/Accounts/#{@account_sid}/Conferences/#{@parent_sid}/Participants/#{@sid}.json"
              instance_id_key 'call_sid'
            end
            
            def mute
              update muted: True
            end
            
            def unmute
              update muted: False
            end
            
            def kick
              delete 
            end
          end
        end
      end
    end
  end
end