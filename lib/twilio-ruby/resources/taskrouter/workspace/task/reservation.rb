module Twilio
  module Resources
    module Taskrouter
      class WorkspaceInstance
        class TaskInstance
          class ReservationList < ListResource
            can :get
            command_alias :reservations
            
            def initialize(client, inheritance={})
              super
              instance_id_key 'sid'
              instance_class ReservationInstance
            end
          end
        
          class ReservationInstance < InstanceResource
            can :update
            
            def initialize(client, inheritance={}, params={})
              super
              path "/Workspace/#{@workspace_sid}/Tasks/#{@task_sid}/Reservations/#{@reservation_sid}"
              instance_id_key 'sid'
            end
          end
        end
      end
    end
  end
end