module Twilio
  module Resources
    module Taskrouter
      class WorkspaceInstance
        class EventList < ListResource
          can :list, :get
          command_alias :events
          
          def initialize(client, inheritance={})
            super
            path "/Workspaces/#{@workspace_sid}/Events"
            instance_id_key 'sid'
            instance_class EventInstance
          end
        end
      
        class EventInstance < InstanceResource
          def initialize(client, inheritance={}, params={})
            super
            path "/Workspaces/#{@workspace_sid}/Events/#{@event_sid}"
            instance_id_key 'sid'
          end
        end
      end
    end
  end
end