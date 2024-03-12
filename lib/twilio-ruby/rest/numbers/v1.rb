##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Numbers
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#

module Twilio
    module REST
        class Numbers
            class V1 < Version
                ##
                # Initialize the V1 version of Numbers
                def initialize(domain)
                    super
                    @version = 'v1'
                    @bulk_eligibilities = nil
                    @porting_bulk_portabilities = nil
                    @porting_port_ins_fetch = nil
                    @porting_portabilities = nil
                end

                ##
                # @param [String] request_id The SID of the bulk eligibility check that you want to know about.
                # @return [Twilio::REST::Numbers::V1::BulkEligibilityContext] if requestId was passed.
                # @return [Twilio::REST::Numbers::V1::BulkEligibilityList]
                def bulk_eligibilities(request_id=:unset)
                    if request_id.nil?
                        raise ArgumentError, 'request_id cannot be nil'
                    end
                    if request_id == :unset
                        @bulk_eligibilities ||= BulkEligibilityList.new self
                    else
                        BulkEligibilityContext.new(self, request_id)
                    end
                end
                ##
                # @param [String] sid A 34 character string that uniquely identifies the Portability check.
                # @return [Twilio::REST::Numbers::V1::PortingBulkPortabilityContext] if sid was passed.
                # @return [Twilio::REST::Numbers::V1::PortingBulkPortabilityList]
                def porting_bulk_portabilities(sid=:unset)
                    if sid.nil?
                        raise ArgumentError, 'sid cannot be nil'
                    end
                    if sid == :unset
                        @porting_bulk_portabilities ||= PortingBulkPortabilityList.new self
                    else
                        PortingBulkPortabilityContext.new(self, sid)
                    end
                end
                ##
                # @param [String] port_in_request_sid The SID of the Port In request. This is a unique identifier of the port in request.
                # @return [Twilio::REST::Numbers::V1::PortingPortInFetchContext] if portInRequestSid was passed.
                # @return [Twilio::REST::Numbers::V1::PortingPortInFetchList]
                def porting_port_ins_fetch(port_in_request_sid=:unset)
                    if port_in_request_sid.nil?
                        raise ArgumentError, 'port_in_request_sid cannot be nil'
                    end
                    if port_in_request_sid == :unset
                        @porting_port_ins_fetch ||= PortingPortInFetchList.new self
                    else
                        PortingPortInFetchContext.new(self, port_in_request_sid)
                    end
                end
                ##
                # @param [String] phone_number The phone number which portability is to be checked. Phone numbers are in E.164 format (e.g. +16175551212).
                # @return [Twilio::REST::Numbers::V1::PortingPortabilityContext] if phoneNumber was passed.
                # @return [Twilio::REST::Numbers::V1::PortingPortabilityList]
                def porting_portabilities(phone_number=:unset)
                    if phone_number.nil?
                        raise ArgumentError, 'phone_number cannot be nil'
                    end
                    if phone_number == :unset
                        @porting_portabilities ||= PortingPortabilityList.new self
                    else
                        PortingPortabilityContext.new(self, phone_number)
                    end
                end
                ##
                # Provide a user friendly representation
                def to_s
                    '<Twilio::REST::Numbers::V1>';
                end
            end
        end
    end
end
