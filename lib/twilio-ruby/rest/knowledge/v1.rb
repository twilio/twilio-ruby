##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Knowledge
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#

module Twilio
    module REST
        class Knowledge
            class V1 < Version
                ##
                # Initialize the V1 version of Knowledge
                def initialize(domain)
                    super
                    @version = 'v1'
                    @knowledge = nil
                end

                ##
                # @param [String] id 
                # @return [Twilio::REST::Knowledge::V1::KnowledgeContext] if id was passed.
                # @return [Twilio::REST::Knowledge::V1::KnowledgeList]
                def knowledge(id=:unset)
                    if id.nil?
                        raise ArgumentError, 'id cannot be nil'
                    end
                    if id == :unset
                        @knowledge ||= KnowledgeList.new self
                    else
                        KnowledgeContext.new(self, id)
                    end
                end
                ##
                # Provide a user friendly representation
                def to_s
                    '<Twilio::REST::Knowledge::V1>';
                end
            end
        end
    end
end
