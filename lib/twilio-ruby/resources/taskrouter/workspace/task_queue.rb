module Twilio
  module Resources
    module Taskrouter
      class WorkspaceInstance < Twilio::REST::InstanceResource
        class TaskQueueList < Twilio::REST::ListResource
          can :list, :get, :create
          command_alias :task_queues
          
          def initialize(client, inheritance={})
            super
            path "/Workspace/#{@workspace_sid}/TaskQueues"
            instance_id_key 'sid'
            instance_class TaskQueueInstance
            list_key 'task_queue'
            components Twilio::Resources::Taskrouter::WorkspaceInstance::TaskQueueList::StatisticsList
          end
        end
      
        class TaskQueueInstance < Twilio::REST::InstanceResource
          can :update, :delete
          
          def initialize(client, inheritance={}, params={})
            super
            path "/Workspace/#{@workspace_sid}/TaskQueues/#{@task_queue_sid}"
            instance_id_key 'sid'
            dependent Twilio::Resources::Taskrouter::WorkspaceInstance::TaskQueueInstance::StatisticsList, {
              workspace_sid: @workspace_sid,
              task_queue_sid: @sid
            }
          end
        end
      end
    end
  end
end