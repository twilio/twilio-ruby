##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Preview < Domain
      class HostedNumbers < Version
        class AuthorizationDocumentContext < InstanceContext
          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class DependentHostedNumberOrderList < ListResource
            ##
            # Initialize the DependentHostedNumberOrderList
            # @param [Version] version Version that contains the resource
            # @param [String] signing_document_sid A 34 character string that uniquely
            #   identifies the LOA document associated with this HostedNumberOrder.
            # @return [DependentHostedNumberOrderList] DependentHostedNumberOrderList
            def initialize(version, signing_document_sid: nil)
              super(version)

              # Path Solution
              @solution = {signing_document_sid: signing_document_sid}
              @uri = "/AuthorizationDocuments/#{@solution[:signing_document_sid]}/DependentHostedNumberOrders"
            end

            ##
            # Lists DependentHostedNumberOrderInstance records from the API as a list.
            # Unlike stream(), this operation is eager and will load `limit` records into
            # memory before returning.
            # @param [dependent_hosted_number_order.Status] status Status of an instance
            #   resource. It can hold one of the values: 1. opened 2. signing, 3. signed LOA, 4.
            #   canceled, 5. failed. See the section entitled [Status
            #   Values](https://www.twilio.com/docs/api/phone-numbers/hosted-number-authorization-documents#status-values) for more information on each of these statuses.
            # @param [String] phone_number An E164 formatted phone number hosted by this
            #   HostedNumberOrder.
            # @param [String] incoming_phone_number_sid A 34 character string that uniquely
            #   identifies the IncomingPhoneNumber resource created by this HostedNumberOrder.
            # @param [String] friendly_name A human readable description of this resource, up
            #   to 64 characters.
            # @param [String] unique_name Provides a unique and addressable name to be
            #   assigned to this HostedNumberOrder, assigned by the developer, to be optionally
            #   used in addition to SID.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit.  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records.  If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Array] Array of up to limit results
            def list(status: :unset, phone_number: :unset, incoming_phone_number_sid: :unset, friendly_name: :unset, unique_name: :unset, limit: nil, page_size: nil)
              self.stream(
                  status: status,
                  phone_number: phone_number,
                  incoming_phone_number_sid: incoming_phone_number_sid,
                  friendly_name: friendly_name,
                  unique_name: unique_name,
                  limit: limit,
                  page_size: page_size
              ).entries
            end

            ##
            # Streams DependentHostedNumberOrderInstance records from the API as an Enumerable.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [dependent_hosted_number_order.Status] status Status of an instance
            #   resource. It can hold one of the values: 1. opened 2. signing, 3. signed LOA, 4.
            #   canceled, 5. failed. See the section entitled [Status
            #   Values](https://www.twilio.com/docs/api/phone-numbers/hosted-number-authorization-documents#status-values) for more information on each of these statuses.
            # @param [String] phone_number An E164 formatted phone number hosted by this
            #   HostedNumberOrder.
            # @param [String] incoming_phone_number_sid A 34 character string that uniquely
            #   identifies the IncomingPhoneNumber resource created by this HostedNumberOrder.
            # @param [String] friendly_name A human readable description of this resource, up
            #   to 64 characters.
            # @param [String] unique_name Provides a unique and addressable name to be
            #   assigned to this HostedNumberOrder, assigned by the developer, to be optionally
            #   used in addition to SID.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit. Default is no limit.
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records. If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Enumerable] Enumerable that will yield up to limit results
            def stream(status: :unset, phone_number: :unset, incoming_phone_number_sid: :unset, friendly_name: :unset, unique_name: :unset, limit: nil, page_size: nil)
              limits = @version.read_limits(limit, page_size)

              page = self.page(
                  status: status,
                  phone_number: phone_number,
                  incoming_phone_number_sid: incoming_phone_number_sid,
                  friendly_name: friendly_name,
                  unique_name: unique_name,
                  page_size: limits[:page_size],
              )

              @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
            end

            ##
            # When passed a block, yields DependentHostedNumberOrderInstance records from the API.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            def each
              limits = @version.read_limits

              page = self.page(page_size: limits[:page_size], )

              @version.stream(page,
                              limit: limits[:limit],
                              page_limit: limits[:page_limit]).each {|x| yield x}
            end

            ##
            # Retrieve a single page of DependentHostedNumberOrderInstance records from the API.
            # Request is executed immediately.
            # @param [dependent_hosted_number_order.Status] status Status of an instance
            #   resource. It can hold one of the values: 1. opened 2. signing, 3. signed LOA, 4.
            #   canceled, 5. failed. See the section entitled [Status
            #   Values](https://www.twilio.com/docs/api/phone-numbers/hosted-number-authorization-documents#status-values) for more information on each of these statuses.
            # @param [String] phone_number An E164 formatted phone number hosted by this
            #   HostedNumberOrder.
            # @param [String] incoming_phone_number_sid A 34 character string that uniquely
            #   identifies the IncomingPhoneNumber resource created by this HostedNumberOrder.
            # @param [String] friendly_name A human readable description of this resource, up
            #   to 64 characters.
            # @param [String] unique_name Provides a unique and addressable name to be
            #   assigned to this HostedNumberOrder, assigned by the developer, to be optionally
            #   used in addition to SID.
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of DependentHostedNumberOrderInstance
            def page(status: :unset, phone_number: :unset, incoming_phone_number_sid: :unset, friendly_name: :unset, unique_name: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
              params = Twilio::Values.of({
                  'Status' => status,
                  'PhoneNumber' => phone_number,
                  'IncomingPhoneNumberSid' => incoming_phone_number_sid,
                  'FriendlyName' => friendly_name,
                  'UniqueName' => unique_name,
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              })

              response = @version.page('GET', @uri, params)

              DependentHostedNumberOrderPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of DependentHostedNumberOrderInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of DependentHostedNumberOrderInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              DependentHostedNumberOrderPage.new(@version, response, @solution)
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Preview.HostedNumbers.DependentHostedNumberOrderList>'
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class DependentHostedNumberOrderPage < Page
            ##
            # Initialize the DependentHostedNumberOrderPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [DependentHostedNumberOrderPage] DependentHostedNumberOrderPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of DependentHostedNumberOrderInstance
            # @param [Hash] payload Payload response from the API
            # @return [DependentHostedNumberOrderInstance] DependentHostedNumberOrderInstance
            def get_instance(payload)
              DependentHostedNumberOrderInstance.new(
                  @version,
                  payload,
                  signing_document_sid: @solution[:signing_document_sid],
              )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Preview.HostedNumbers.DependentHostedNumberOrderPage>'
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class DependentHostedNumberOrderInstance < InstanceResource
            ##
            # Initialize the DependentHostedNumberOrderInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] signing_document_sid A 34 character string that uniquely
            #   identifies the LOA document associated with this HostedNumberOrder.
            # @return [DependentHostedNumberOrderInstance] DependentHostedNumberOrderInstance
            def initialize(version, payload, signing_document_sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'sid' => payload['sid'],
                  'account_sid' => payload['account_sid'],
                  'incoming_phone_number_sid' => payload['incoming_phone_number_sid'],
                  'address_sid' => payload['address_sid'],
                  'signing_document_sid' => payload['signing_document_sid'],
                  'phone_number' => payload['phone_number'],
                  'capabilities' => payload['capabilities'],
                  'friendly_name' => payload['friendly_name'],
                  'unique_name' => payload['unique_name'],
                  'status' => payload['status'],
                  'failure_reason' => payload['failure_reason'],
                  'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                  'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                  'verification_attempts' => payload['verification_attempts'].to_i,
                  'email' => payload['email'],
                  'cc_emails' => payload['cc_emails'],
                  'verification_type' => payload['verification_type'],
                  'verification_document_sid' => payload['verification_document_sid'],
                  'extension' => payload['extension'],
                  'call_delay' => payload['call_delay'].to_i,
                  'verification_code' => payload['verification_code'],
                  'verification_call_sids' => payload['verification_call_sids'],
              }
            end

            ##
            # @return [String] HostedNumberOrder sid.
            def sid
              @properties['sid']
            end

            ##
            # @return [String] Account sid.
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [String] IncomingPhoneNumber sid.
            def incoming_phone_number_sid
              @properties['incoming_phone_number_sid']
            end

            ##
            # @return [String] Address sid.
            def address_sid
              @properties['address_sid']
            end

            ##
            # @return [String] LOA document sid.
            def signing_document_sid
              @properties['signing_document_sid']
            end

            ##
            # @return [String] An E164 formatted phone number.
            def phone_number
              @properties['phone_number']
            end

            ##
            # @return [String] A mapping of phone number capabilities.
            def capabilities
              @properties['capabilities']
            end

            ##
            # @return [String] A human readable description of this resource.
            def friendly_name
              @properties['friendly_name']
            end

            ##
            # @return [String] A unique, developer assigned name of this HostedNumberOrder.
            def unique_name
              @properties['unique_name']
            end

            ##
            # @return [dependent_hosted_number_order.Status] The Status of this HostedNumberOrder.
            def status
              @properties['status']
            end

            ##
            # @return [String] Why a hosted_number_order reached status "action-required"
            def failure_reason
              @properties['failure_reason']
            end

            ##
            # @return [Time] The date this HostedNumberOrder was created.
            def date_created
              @properties['date_created']
            end

            ##
            # @return [Time] The date this HostedNumberOrder was updated.
            def date_updated
              @properties['date_updated']
            end

            ##
            # @return [String] The number of attempts made to verify ownership of the phone number.
            def verification_attempts
              @properties['verification_attempts']
            end

            ##
            # @return [String] Email.
            def email
              @properties['email']
            end

            ##
            # @return [String] A list of emails.
            def cc_emails
              @properties['cc_emails']
            end

            ##
            # @return [dependent_hosted_number_order.VerificationType] The method used for verifying ownership of the number to be hosted.
            def verification_type
              @properties['verification_type']
            end

            ##
            # @return [String] Verification Document Sid.
            def verification_document_sid
              @properties['verification_document_sid']
            end

            ##
            # @return [String] Phone extension to use for ownership verification call.
            def extension
              @properties['extension']
            end

            ##
            # @return [String] Seconds (0-30) to delay ownership verification call by.
            def call_delay
              @properties['call_delay']
            end

            ##
            # @return [String] The digits passed during the ownership verification call.
            def verification_code
              @properties['verification_code']
            end

            ##
            # @return [String] List of IDs for ownership verification calls.
            def verification_call_sids
              @properties['verification_call_sids']
            end

            ##
            # Provide a user friendly representation
            def to_s
              "<Twilio.Preview.HostedNumbers.DependentHostedNumberOrderInstance>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              "<Twilio.Preview.HostedNumbers.DependentHostedNumberOrderInstance>"
            end
          end
        end
      end
    end
  end
end