module Twilio
  module Resources
    module Taskrouter
      class WorkspaceInstance
        class TaskList < ListResource
          can :list, :get, :create
          command_alias :tasks
          
          def initialize(client, inheritance={})
            super
            path "/Workspace/#{@workspace_sid}/Tasks"
            instance_id_key 'sid'
            instance_class TaskInstance
            list_key 'tasks'
          end
        end
      
        class TaskInstance < InstanceResource
          can :update, :delete
          
          def initialize(client, inheritance={}, params={})
            super
            path "/Workspace/#{@workspace_sid}/Tasks/#{@task_sid}"
            instance_id_key 'sid'
            dependent Twilio::Resources::Taskrouter::WorkspaceInstance::TaskInstance::ReservationList, {
              workspace_sid: @workspace_sid,
              task_sid: @sid
            }
          end
        end
      end
    end
  end
end