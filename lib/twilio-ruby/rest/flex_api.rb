##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class FlexApi < Domain
      ##
      # Initialize the FlexApi Domain
      def initialize(twilio)
        super

        @base_url = 'https://flex-api.twilio.com'
        @host = 'flex-api.twilio.com'
        @port = 443

        # Versions
        @v1 = nil
        @v2 = nil
      end

      ##
      # Version v1 of flex_api
      def v1
        @v1 ||= V1.new self
      end

      ##
      # Version v2 of flex_api
      def v2
        @v2 ||= V2.new self
      end

      ##
      # @param [String] sid The unique string that we created to identify the Channel
      #   resource.
      # @return [Twilio::REST::Flex_api::V1::ChannelInstance] if sid was passed.
      # @return [Twilio::REST::Flex_api::V1::ChannelList]
      def channel(sid=:unset)
        self.v1.channel(sid)
      end

      ##
      # @return [Twilio::REST::Flex_api::V1::ConfigurationInstance]
      def configuration
        self.v1.configuration()
      end

      ##
      # @param [String] sid The unique string that we created to identify the Flex Flow
      #   resource.
      # @return [Twilio::REST::Flex_api::V1::FlexFlowInstance] if sid was passed.
      # @return [Twilio::REST::Flex_api::V1::FlexFlowList]
      def flex_flow(sid=:unset)
        self.v1.flex_flow(sid)
      end

      ##
      # @param [String] assessment_id The unique id of the assessment
      # @return [Twilio::REST::Flex_api::V1::AssessmentsInstance] if assessment_id was passed.
      # @return [Twilio::REST::Flex_api::V1::AssessmentsList]
      def assessments(assessment_id=:unset)
        self.v1.assessments(assessment_id)
      end

      ##
      # @return [Twilio::REST::Flex_api::V1::InsightsAssessmentsCommentInstance]
      def insights_assessments_comment
        self.v1.insights_assessments_comment()
      end

      ##
      # @param [String] id The unique id of this questionnaire
      # @return [Twilio::REST::Flex_api::V1::InsightsQuestionnairesInstance] if id was passed.
      # @return [Twilio::REST::Flex_api::V1::InsightsQuestionnairesList]
      def insights_questionnaires(id=:unset)
        self.v1.insights_questionnaires(id)
      end

      ##
      # @param [String] category_id The unique ID for the category
      # @return [Twilio::REST::Flex_api::V1::InsightsQuestionnairesCategoryInstance] if category_id was passed.
      # @return [Twilio::REST::Flex_api::V1::InsightsQuestionnairesCategoryList]
      def insights_questionnaires_category(category_id=:unset)
        self.v1.insights_questionnaires_category(category_id)
      end

      ##
      # @param [String] question_id The unique ID of the question
      # @return [Twilio::REST::Flex_api::V1::InsightsQuestionnairesQuestionInstance] if question_id was passed.
      # @return [Twilio::REST::Flex_api::V1::InsightsQuestionnairesQuestionList]
      def insights_questionnaires_question(question_id=:unset)
        self.v1.insights_questionnaires_question(question_id)
      end

      ##
      # @param [String] segment_id To unique id of the segment
      # @return [Twilio::REST::Flex_api::V1::InsightsSegmentsInstance] if segment_id was passed.
      # @return [Twilio::REST::Flex_api::V1::InsightsSegmentsList]
      def insights_segments(segment_id=:unset)
        self.v1.insights_segments(segment_id)
      end

      ##
      # @return [Twilio::REST::Flex_api::V1::InsightsSessionInstance]
      def insights_session
        self.v1.insights_session()
      end

      ##
      # @return [Twilio::REST::Flex_api::V1::InsightsSettingsAnswerSetsInstance]
      def insights_settings_answer_sets
        self.v1.insights_settings_answer_sets()
      end

      ##
      # @return [Twilio::REST::Flex_api::V1::InsightsSettingsCommentInstance]
      def insights_settings_comment
        self.v1.insights_settings_comment()
      end

      ##
      # @return [Twilio::REST::Flex_api::V1::InsightsUserRolesInstance]
      def insights_user_roles
        self.v1.insights_user_roles()
      end

      ##
      # @param [String] sid The unique string created by Twilio to identify an
      #   Interaction resource, prefixed with KD.
      # @return [Twilio::REST::Flex_api::V1::InteractionInstance] if sid was passed.
      # @return [Twilio::REST::Flex_api::V1::InteractionList]
      def interaction(sid=:unset)
        self.v1.interaction(sid)
      end

      ##
      # @param [String] sid The unique string that we created to identify the WebChannel
      #   resource.
      # @return [Twilio::REST::Flex_api::V1::WebChannelInstance] if sid was passed.
      # @return [Twilio::REST::Flex_api::V1::WebChannelList]
      def web_channel(sid=:unset)
        self.v1.web_channel(sid)
      end

      ##
      # @return [Twilio::REST::Flex_api::V2::WebChannelsInstance]
      def web_channels
        self.v2.web_channels()
      end

      ##
      # Provide a user friendly representation
      def to_s
        '#<Twilio::REST::FlexApi>'
      end
    end
  end
end