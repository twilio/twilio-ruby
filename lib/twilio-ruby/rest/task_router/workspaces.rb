module Twilio
  module REST
    module TaskRouter
      class Workspaces < ListResource; end

      class Workspace < InstanceResource
        def initialize(path, client, params={})
          super path, client, params
          @submodule = :TaskRouter
          resource :activities, :events, :task_queues, :tasks, :workers, :workflows
        end
      end
    end
  end
end
