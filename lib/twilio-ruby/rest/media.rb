module Twilio
  module REST
    class Media < MediaBase
      ##
      # @param [String] sid The unique string generated to identify the MediaProcessor
      #   resource.
      # @return [Twilio::REST::Media::V1::MediaProcessorInstance] if sid was passed.
      # @return [Twilio::REST::Media::V1::MediaProcessorList]
      def media_processor(sid=:unset)
        warn "media_processor is deprecated. Use v1.media_processor instead."
        self.v1.media_processor(sid)
      end

      ##
      # @param [String] sid The unique string generated to identify the MediaRecording
      #   resource.
      # @return [Twilio::REST::Media::V1::MediaRecordingInstance] if sid was passed.
      # @return [Twilio::REST::Media::V1::MediaRecordingList]
      def media_recording(sid=:unset)
        warn "media_recording is deprecated. Use v1.media_recording instead."
        self.v1.media_recording(sid)
      end

      ##
      # @param [String] sid The unique string generated to identify the PlayerStreamer
      #   resource.
      # @return [Twilio::REST::Media::V1::PlayerStreamerInstance] if sid was passed.
      # @return [Twilio::REST::Media::V1::PlayerStreamerList]
      def player_streamer(sid=:unset)
        warn "player_streamer is deprecated. Use v1.player_streamer instead."
        self.v1.player_streamer(sid)
      end
    end
  end
end