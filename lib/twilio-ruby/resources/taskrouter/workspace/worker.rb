module Twilio
  module Resources
    module Taskrouter
      class WorkspaceInstance < Twilio::REST::InstanceResource
        class WorkerList < Twilio::REST::ListResource
          can :list, :get, :create
          command_alias :workers
          
          def initialize(client, inheritance={})
            super
            path "/Workspaces/#{@workspace_sid}/Workers"
            instance_id_key 'sid'
            instance_class WorkerInstance
            list_key 'workers'
            components Twilio::Resources::Taskrouter::WorkspaceInstance::WorkerList::StatisticsList
          end
        end
      
        class WorkerInstance < Twilio::REST::InstanceResource
          can :update, :delete
          
          def initialize(client, inheritance={}, params={}, query_params={})
            super
            path "/Workspaces/#{@workspace_sid}/Workers/#{@sid}"
            instance_id_key 'sid'
            dependent Twilio::Resources::Taskrouter::WorkspaceInstance::WorkerInstance::StatisticsList, {
              workspace_sid: @workspace_sid,
              worker_sid: @sid
            }
          end
        end
      end
    end
  end
end