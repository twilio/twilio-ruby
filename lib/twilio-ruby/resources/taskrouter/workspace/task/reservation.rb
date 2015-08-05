module Twilio
  module Resources
    module Taskrouter
      class WorkspaceInstance < Twilio::REST::InstanceResource
        class TaskInstance < Twilio::REST::InstanceResource
          class ReservationList < Twilio::REST::ListResource
            can :get
            command_alias :reservations
            
            def initialize(client, inheritance={})
              super
              instance_id_key 'sid'
              instance_class ReservationInstance
            end
          end
        
          class ReservationInstance < Twilio::REST::InstanceResource
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