module Twilio
  module REST
    module Conversations
      class Conversations < NextGenListResource
        def initialize(path, client)
          @path, @client = path, client
          @submodule = :Conversations
          freeze_path
          resource :in_progress,
                   :completed
        end
      end

      class Conversation < InstanceResource
        def initialize(path, client, params={})
          super
          @submodule = :Conversations
          resource :participants
        end
      end
    end
  end
end
