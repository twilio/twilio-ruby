# frozen_string_literal: true

##
# This code was generated by
# ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#  |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#  |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
# NOTE: This class is auto generated by OpenAPI Generator.
# https://openapi-generator.tech
# Do not edit the class manually.
# frozen_string_literal: true
module Twilio
  module REST
    class PreviewIamBase < Domain
      ##
      # Initialize preview domain
      #
      # @param twilio - The twilio client
      #
      def initialize(twilio)
        super(twilio)
        @base_url =  "https://preview-iam.twilio.com"
        @host = "preview-iam.twilio.com"
        @port = 443
        @organizations = nil
        @v1 = nil
      end

      def v1
        @v1 ||= PreviewIam::V1.new(self)
      end

      ##
      # Provide a user friendly representation
      def to_s
        '<Twilio::REST::PreviewIam>';
      end
    end
  end
end