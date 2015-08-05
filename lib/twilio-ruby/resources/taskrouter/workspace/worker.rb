module Twilio
  module Resources
    module Taskrouter
      class WorkspaceInstance
        class WorkerList < ListResource
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
      
        class WorkerInstance < InstanceResource
          can :update, :delete
          
          def initialize(client, inheritance={}, params={})
            super
            path "/Workspaces/#{@workspace_sid}/Workers/#{@worker_sid}"
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