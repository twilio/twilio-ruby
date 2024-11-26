##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Organization Public API
#    No description provided (generated by Openapi Generator https://github.com/openapitools/openapi-generator)
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#

module Twilio
    module REST
        class PreviewIam
            class V1 < Version
                ##
                # Initialize the V1 version of PreviewIam
                def initialize(domain)
                    super
                    @version = 'v1'
                    @authorize = nil
                    @token = nil
                end

                ##
                # @return [Twilio::REST::PreviewIam::V1::AuthorizeList]
                def authorize
                    @authorize ||= AuthorizeList.new self
                end
                ##
                # @return [Twilio::REST::PreviewIam::V1::TokenList]
                def token
                    @token ||= TokenList.new self
                end
                ##
                # Provide a user friendly representation
                def to_s
                    '<Twilio::REST::PreviewIam::V1>';
                end
            end
        end
    end
end
