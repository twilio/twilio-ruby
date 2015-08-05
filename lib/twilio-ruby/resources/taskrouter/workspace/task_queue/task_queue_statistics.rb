module Twilio
  module Resources
    module Taskrouter
      class WorkspaceInstance
        class TaskQueueInstance
          class TaskQueueStatisticsList < ListResource
            can :get
            command_alias :task_queue_statistics
            
            def initialize(client, inheritance={})
              super
              instance_id_key 'sid'
              instance_class TaskQueueStatisticsInstance
            end
          end
        
          class TaskQueueStatisticsInstance < InstanceResource
            def initialize(client, inheritance={}, params={})
              super
              path "/Workspaces/#{@workspace_sid}/TaskQueues/#{@task_queue_sid}/Statistics"
              instance_id_key 'sid'
            end
          end
        end
      end
    end
  end
end