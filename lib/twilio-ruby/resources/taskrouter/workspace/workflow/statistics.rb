module Twilio
  module Resources
    module Taskrouter
      class WorkspaceInstance < Twilio::REST::InstanceResource
        class WorkflowInstance < Twilio::REST::InstanceResource
          class StatisticsList < Twilio::REST::ListResource
            can :get
            command_alias :statistics
            
            def initialize(client, inheritance={})
              super
              path "/Workspace/#{@workspace_sid}/Workflows/#{@workflow_sid}/Statistics"
              instance_id_key 'sid'
              instance_class StatisticsInstance
            end
          end
        
          class StatisticsInstance < Twilio::REST::InstanceResource
            def initialize(client, inheritance={}, params={})
              super
              path "/Workspace/#{@workspace_sid}/Workflows/#{@workflow_sid}/Statistics"
              instance_id_key 'sid'
            end
          end
        end
      end
    end
  end
end