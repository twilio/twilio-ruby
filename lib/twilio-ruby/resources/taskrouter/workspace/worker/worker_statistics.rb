module Twilio
  module Resources
    module Taskrouter
      class WorkspaceInstance
        class WorkerInstance
          class WorkerStatisticsList < ListResource
            can :get
            command_alias :worker_statistics
            
            def initialize(client, inheritance={})
              super
              instance_id_key 'sid'
              instance_class WorkerStatisticsInstance
            end
          end
        
          class WorkerStatisticsInstance < InstanceResource
            def initialize(client, inheritance={}, params={})
              super
              path "/Workspace/#{@workspace_sid}/Workers/#{@worker_sid}/Statistics"
              instance_id_key 'sid'
            end
          end
        end
      end
    end
  end
end