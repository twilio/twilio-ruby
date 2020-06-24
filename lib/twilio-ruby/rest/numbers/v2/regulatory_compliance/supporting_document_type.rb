##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Numbers < Domain
      class V2 < Version
        class RegulatoryComplianceList < ListResource
          class SupportingDocumentTypeList < ListResource
            ##
            # Initialize the SupportingDocumentTypeList
            # @param [Version] version Version that contains the resource
            # @return [SupportingDocumentTypeList] SupportingDocumentTypeList
            def initialize(version)
              super(version)

              # Path Solution
              @solution = {}
              @uri = "/RegulatoryCompliance/SupportingDocumentTypes"
            end

            ##
            # Lists SupportingDocumentTypeInstance records from the API as a list.
            # Unlike stream(), this operation is eager and will load `limit` records into
            # memory before returning.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit.  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records.  If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Array] Array of up to limit results
            def list(limit: nil, page_size: nil)
              self.stream(limit: limit, page_size: page_size).entries
            end

            ##
            # Streams SupportingDocumentTypeInstance records from the API as an Enumerable.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit. Default is no limit.
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records. If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Enumerable] Enumerable that will yield up to limit results
            def stream(limit: nil, page_size: nil)
              limits = @version.read_limits(limit, page_size)

              page = self.page(page_size: limits[:page_size], )

              @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
            end

            ##
            # When passed a block, yields SupportingDocumentTypeInstance records from the API.
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
            # Retrieve a single page of SupportingDocumentTypeInstance records from the API.
            # Request is executed immediately.
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of SupportingDocumentTypeInstance
            def page(page_token: :unset, page_number: :unset, page_size: :unset)
              params = Twilio::Values.of({
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              })

              response = @version.page('GET', @uri, params)

              SupportingDocumentTypePage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of SupportingDocumentTypeInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of SupportingDocumentTypeInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              SupportingDocumentTypePage.new(@version, response, @solution)
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Numbers.V2.SupportingDocumentTypeList>'
            end
          end

          class SupportingDocumentTypePage < Page
            ##
            # Initialize the SupportingDocumentTypePage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [SupportingDocumentTypePage] SupportingDocumentTypePage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of SupportingDocumentTypeInstance
            # @param [Hash] payload Payload response from the API
            # @return [SupportingDocumentTypeInstance] SupportingDocumentTypeInstance
            def get_instance(payload)
              SupportingDocumentTypeInstance.new(@version, payload, )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Numbers.V2.SupportingDocumentTypePage>'
            end
          end

          class SupportingDocumentTypeContext < InstanceContext
            ##
            # Initialize the SupportingDocumentTypeContext
            # @param [Version] version Version that contains the resource
            # @param [String] sid The unique string that identifies the Supporting Document
            #   Type resource.
            # @return [SupportingDocumentTypeContext] SupportingDocumentTypeContext
            def initialize(version, sid)
              super(version)

              # Path Solution
              @solution = {sid: sid, }
              @uri = "/RegulatoryCompliance/SupportingDocumentTypes/#{@solution[:sid]}"
            end

            ##
            # Fetch the SupportingDocumentTypeInstance
            # @return [SupportingDocumentTypeInstance] Fetched SupportingDocumentTypeInstance
            def fetch
              payload = @version.fetch('GET', @uri)

              SupportingDocumentTypeInstance.new(@version, payload, sid: @solution[:sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Numbers.V2.SupportingDocumentTypeContext #{context}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Numbers.V2.SupportingDocumentTypeContext #{context}>"
            end
          end

          class SupportingDocumentTypeInstance < InstanceResource
            ##
            # Initialize the SupportingDocumentTypeInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] sid The unique string that identifies the Supporting Document
            #   Type resource.
            # @return [SupportingDocumentTypeInstance] SupportingDocumentTypeInstance
            def initialize(version, payload, sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'sid' => payload['sid'],
                  'friendly_name' => payload['friendly_name'],
                  'machine_name' => payload['machine_name'],
                  'fields' => payload['fields'],
                  'url' => payload['url'],
              }

              # Context
              @instance_context = nil
              @params = {'sid' => sid || @properties['sid'], }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return [SupportingDocumentTypeContext] SupportingDocumentTypeContext for this SupportingDocumentTypeInstance
            def context
              unless @instance_context
                @instance_context = SupportingDocumentTypeContext.new(@version, @params['sid'], )
              end
              @instance_context
            end

            ##
            # @return [String] The unique string that identifies the Supporting Document Type resource
            def sid
              @properties['sid']
            end

            ##
            # @return [String] A human-readable description of the Supporting Document Type resource
            def friendly_name
              @properties['friendly_name']
            end

            ##
            # @return [String] The machine-readable description of the Supporting Document Type resource
            def machine_name
              @properties['machine_name']
            end

            ##
            # @return [Hash] The required information for creating a Supporting Document
            def fields
              @properties['fields']
            end

            ##
            # @return [String] The absolute URL of the Supporting Document Type resource
            def url
              @properties['url']
            end

            ##
            # Fetch the SupportingDocumentTypeInstance
            # @return [SupportingDocumentTypeInstance] Fetched SupportingDocumentTypeInstance
            def fetch
              context.fetch
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Numbers.V2.SupportingDocumentTypeInstance #{values}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Numbers.V2.SupportingDocumentTypeInstance #{values}>"
            end
          end
        end
      end
    end
  end
end