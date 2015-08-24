module Twilio
  module Resources
    module Taskrouter
      class WorkspaceInstance < Twilio::REST::InstanceResource
        class WorkflowList < Twilio::REST::ListResource
          can :list, :get, :create
          command_alias :workflows
          
          def initialize(client, inheritance={})
            super
            path "/Workspace/#{@workspace_sid}/Workflows"
            instance_id_key 'sid'
            instance_class WorkflowInstance
            list_key 'workflows'
          end
        end
      
        class WorkflowInstance < Twilio::REST::InstanceResource
          can :update, :delete
          
          def initialize(client, inheritance={}, params={})
            super
            path "/Workspace/#{@workspace_sid}/Workflows/#{@sid}"
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