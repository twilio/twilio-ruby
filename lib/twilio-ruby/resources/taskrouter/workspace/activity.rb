module Twilio
  module Resources
    module Taskrouter
      class WorkspaceInstance
        class ActivityList < ListResource
          can :list, :get, :create
          command_alias :activities
          
          def initialize(client, inheritance={})
            super
            instance_id_key 'sid'
            instance_class ActivityInstance
          end
        end
      
        class ActivityInstance < InstanceResource
          can :update, :delete
          
          def initialize(client, inheritance={}, params={})
            super
            path "/Workspaces/#{@workspace_sid}/Activities/#{@activity_sid}"
            instance_id_key 'sid'
          end
        end
      end
    end
  end
end