module Twilio
  module Resources
    module Taskrouter
      class WorkspaceInstance
        class WorkflowList < ListResource
          can :list, :get, :create
          command_alias :workflows
          
          def initialize(client, inheritance={})
            super
            path "/Workspace/#{@workspace_sid}/Workflows"
            instance_id_key 'sid'
            instance_class WorkflowInstance
          end
        end
      
        class WorkflowInstance < InstanceResource
          can :update, :delete
          
          def initialize(client, inheritance={}, params={})
            super
            path "/Workspace/#{@workspace_sid}/Workflows/#{@workflow_sid}"
            instance_id_key 'sid'
            dependent Twilio::Resources::Taskrouter::WorkspaceInstance::WorkflowInstance::StatisticsList, {
              workspace_sid: @workspace_sid,
              workflow_sid: @sid
            }
          end
        end
      end
    end
  end
end