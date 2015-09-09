module Twilio
  module Resources
    module Taskrouter
      class WorkspaceInstance < Twilio::REST::InstanceResource
        class TaskInstance < Twilio::REST::InstanceResource
          class ReservationList < Twilio::REST::ListResource
            can :list, :get
            command_alias :reservations
            
            def initialize(client, inheritance={})
              super
              path "/Workspaces/#{@workspace_sid}/Tasks/#{@task_sid}/Reservations"
              instance_id_key 'sid'
              instance_class ReservationInstance
              list_key 'reservations'
            end
          end
        
          class ReservationInstance < Twilio::REST::InstanceResource
            can :update
            
            def initialize(client, inheritance={}, params={}, query_params={})
              super
              path "/Workspaces/#{@workspace_sid}/Tasks/#{@task_sid}/Reservations/#{@sid}"
              instance_id_key 'sid'
            end
          end
        end
      end
    end
  end
end