module Twilio
  module REST
    class Autopilot < AutopilotBase
      ##
      # @param [String] sid The unique string that we created to identify the Assistant
      #   resource.
      # @return [Twilio::REST::Autopilot::V1::AssistantInstance] if sid was passed.
      # @return [Twilio::REST::Autopilot::V1::AssistantList]
      def assistants(sid=:unset)
        warn "assistants is deprecated. Use v1.assistants instead."
        self.v1.assistants(sid)
      end

      ##
      # @return [Twilio::REST::Autopilot::V1::RestoreAssistantInstance]
      def restore_assistant
        warn "restore_assistant is deprecated. Use v1.restore_assistant instead."
        self.v1.restore_assistant()
      end
    end
  end
end