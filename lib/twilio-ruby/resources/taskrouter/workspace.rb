module Twilio
  module Resources
    module Taskrouter
      class WorkspaceList < ListResource
        can :list, :get, :create
        command_alias :workspaces
        
        def initialize(client, inheritance={})
          super
          instance_id_key 'sid'
          instance_class WorkspaceInstance
        end
      end
    
      class WorkspaceInstance < InstanceResource
        can :update, :delete
        
        def initialize(client, inheritance={}, params={})
          super
          path "/Workspaces/#{@workspace_sid}"
          instance_id_key 'sid'
          dependent Twilio::Resources::Taskrouter::WorkspaceInstance::ActivityList, {
            workspace_sid: @sid
          }
          dependent Twilio::Resources::Taskrouter::WorkspaceInstance::EventList, {
            workspace_sid: @sid
          }
          dependent Twilio::Resources::Taskrouter::WorkspaceInstance::TaskList, {
            workspace_sid: @sid
          }
          dependent Twilio::Resources::Taskrouter::WorkspaceInstance::TaskQueueList, {
            workspace_sid: @sid
          }
          dependent Twilio::Resources::Taskrouter::WorkspaceInstance::WorkerList, {
            workspace_sid: @sid
          }
          dependent Twilio::Resources::Taskrouter::WorkspaceInstance::WorkflowList, {
            workspace_sid: @sid
          }
          dependent Twilio::Resources::Taskrouter::WorkspaceInstance::StatisticsList, {
            workspace_sid: @sid
          }
        end
      end
    end
  end
end