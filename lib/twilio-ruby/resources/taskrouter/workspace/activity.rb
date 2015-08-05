module Twilio
  module Resources
    module Taskrouter
      class WorkspaceInstance < Twilio::REST::InstanceResource
        class ActivityList < Twilio::REST::ListResource
          can :list, :get, :create
          command_alias :activities
          
          def initialize(client, inheritance={})
            super
            instance_id_key 'sid'
            instance_class ActivityInstance
            list_key 'activity'
          end
        end
      
        class ActivityInstance < Twilio::REST::InstanceResource
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