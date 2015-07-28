module Twilio
  module REST
    module Conversations
      class Conversations < NextGenListResource
        def initialize(path, client)
          super
          @submodule = :Conversations
          freeze_path
          resource :in_progress,
                   :completed
        end
      end

      class Conversation < InstanceResource
        def initialize(path, client, params={})
          super
          resource :participants
        end
      end
    end
  end
end
