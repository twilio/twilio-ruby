module Twilio
  module Resources
    module Taskrouter
      class WorkspaceInstance
        class TaskQueueList
          class StatisticsList < ListResource
            can :get
            command_alias :statistics
            
            def initialize(client, inheritance={})
              super
              instance_id_key 'sid'
              instance_class StatisticsInstance
            end
          end
        
          class StatisticsInstance < InstanceResource
            def initialize(client, inheritance={}, params={})
              super
              path "/Workspaces/#{@workspace_sid}/TaskQueues/Statistics"
              instance_id_key 'sid'
            end
          end
        end
      end
    end
  end
end