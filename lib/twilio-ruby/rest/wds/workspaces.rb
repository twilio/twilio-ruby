module Twilio
  module REST
    module Wds
      class Workspaces < ListResource; end

      class Workspace < InstanceResource
        def initialize(path, client, params={})
          super path, client, params
          @submodule = :Wds
          resource :activities, :task_queues, :tasks, :workers, :workflows
        end
      end
    end
  end
end
