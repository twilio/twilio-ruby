module Twilio
  module Resources
    module Taskrouter
      class WorkspaceInstance < Twilio::REST::InstanceResource
        class WorkerList < Twilio::REST::ListResource
          class StatisticsList < Twilio::REST::ListResource
            can :get
            command_alias :statistics
            
            def initialize(client, inheritance={})
              super
              instance_id_key 'sid'
              instance_class StatisticsInstance
            end
          end
        
          class StatisticsInstance < Twilio::REST::InstanceResource
            def initialize(client, inheritance={}, params={})
              super
              path "/Workspaces/#{@workspace_sid}/Workers/Statistics"
              instance_id_key 'sid'
            end
          end
        end
      end
    end
  end
end