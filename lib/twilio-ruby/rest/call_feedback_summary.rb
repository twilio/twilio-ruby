module Twilio
  module REST
    class FeedbackSummary < ListResource
      def initialize(path, client)
        super
        @instance_class = Twilio::REST::FeedbackSummaryInstance
        @list_key = 'feedback_summary'
        @instance_id_key = 'sid'
      end
    end

    class FeedbackSummaryInstance < InstanceResource; end
  end
end
