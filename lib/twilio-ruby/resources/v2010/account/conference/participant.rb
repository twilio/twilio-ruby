module Twilio
  module Resources
    module V2010
      class AccountInstance
        class ConferenceInstance
          class ParticipantList < ListResource
            can :list, :get
            command_alias :participants
            
            def initialize(client, inheritance={})
              super
              path "/Accounts/#{@account_sid}/Conferences/#{@parent_sid}/Participants.json"
              instance_id_key 'call_sid'
              instance_class ParticipantInstance
            end
          end
        
          class ParticipantInstance < InstanceResource
            can :update, :delete
            
            def initialize(client, inheritance={}, params={})
              super
              path "/Accounts/#{@account_sid}/Conferences/#{@parent_sid}/Participant/#{@sid}.json"
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