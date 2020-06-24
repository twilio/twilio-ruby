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
          class BundleList < ListResource
            ##
            # Initialize the BundleList
            # @param [Version] version Version that contains the resource
            # @return [BundleList] BundleList
            def initialize(version)
              super(version)

              # Path Solution
              @solution = {}
              @uri = "/RegulatoryCompliance/Bundles"
            end

            ##
            # Create the BundleInstance
            # @param [String] friendly_name The string that you assigned to describe the
            #   resource.
            # @param [String] email The email address that will receive updates when the
            #   Bundle resource changes status.
            # @param [String] status_callback The URL we call to inform your application of
            #   status changes.
            # @param [String] regulation_sid The unique string of a regulation that is
            #   associated to the Bundle resource.
            # @param [String] iso_country The ISO country code of the Bundle's phone number
            #   country ownership request.
            # @param [bundle.EndUserType] end_user_type The type of End User of the Bundle
            #   resource.
            # @param [String] number_type The type of phone number of the Bundle's ownership
            #   request.
            # @return [BundleInstance] Created BundleInstance
            def create(friendly_name: nil, email: nil, status_callback: :unset, regulation_sid: :unset, iso_country: :unset, end_user_type: :unset, number_type: :unset)
              data = Twilio::Values.of({
                  'FriendlyName' => friendly_name,
                  'Email' => email,
                  'StatusCallback' => status_callback,
                  'RegulationSid' => regulation_sid,
                  'IsoCountry' => iso_country,
                  'EndUserType' => end_user_type,
                  'NumberType' => number_type,
              })

              payload = @version.create('POST', @uri, data: data)

              BundleInstance.new(@version, payload, )
            end

            ##
            # Lists BundleInstance records from the API as a list.
            # Unlike stream(), this operation is eager and will load `limit` records into
            # memory before returning.
            # @param [bundle.Status] status The verification status of the Bundle resource.
            # @param [String] friendly_name The string that you assigned to describe the
            #   resource.
            # @param [String] regulation_sid The unique string of a regulation that is
            #   associated to the Bundle resource.
            # @param [String] iso_country The ISO country code of the Bundle's phone number
            #   country ownership request.
            # @param [String] number_type The type of phone number of the Bundle's ownership
            #   request.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit.  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records.  If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Array] Array of up to limit results
            def list(status: :unset, friendly_name: :unset, regulation_sid: :unset, iso_country: :unset, number_type: :unset, limit: nil, page_size: nil)
              self.stream(
                  status: status,
                  friendly_name: friendly_name,
                  regulation_sid: regulation_sid,
                  iso_country: iso_country,
                  number_type: number_type,
                  limit: limit,
                  page_size: page_size
              ).entries
            end

            ##
            # Streams BundleInstance records from the API as an Enumerable.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [bundle.Status] status The verification status of the Bundle resource.
            # @param [String] friendly_name The string that you assigned to describe the
            #   resource.
            # @param [String] regulation_sid The unique string of a regulation that is
            #   associated to the Bundle resource.
            # @param [String] iso_country The ISO country code of the Bundle's phone number
            #   country ownership request.
            # @param [String] number_type The type of phone number of the Bundle's ownership
            #   request.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit. Default is no limit.
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records. If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Enumerable] Enumerable that will yield up to limit results
            def stream(status: :unset, friendly_name: :unset, regulation_sid: :unset, iso_country: :unset, number_type: :unset, limit: nil, page_size: nil)
              limits = @version.read_limits(limit, page_size)

              page = self.page(
                  status: status,
                  friendly_name: friendly_name,
                  regulation_sid: regulation_sid,
                  iso_country: iso_country,
                  number_type: number_type,
                  page_size: limits[:page_size],
              )

              @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
            end

            ##
            # When passed a block, yields BundleInstance records from the API.
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
            # Retrieve a single page of BundleInstance records from the API.
            # Request is executed immediately.
            # @param [bundle.Status] status The verification status of the Bundle resource.
            # @param [String] friendly_name The string that you assigned to describe the
            #   resource.
            # @param [String] regulation_sid The unique string of a regulation that is
            #   associated to the Bundle resource.
            # @param [String] iso_country The ISO country code of the Bundle's phone number
            #   country ownership request.
            # @param [String] number_type The type of phone number of the Bundle's ownership
            #   request.
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of BundleInstance
            def page(status: :unset, friendly_name: :unset, regulation_sid: :unset, iso_country: :unset, number_type: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
              params = Twilio::Values.of({
                  'Status' => status,
                  'FriendlyName' => friendly_name,
                  'RegulationSid' => regulation_sid,
                  'IsoCountry' => iso_country,
                  'NumberType' => number_type,
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              })

              response = @version.page('GET', @uri, params)

              BundlePage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of BundleInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of BundleInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              BundlePage.new(@version, response, @solution)
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Numbers.V2.BundleList>'
            end
          end

          class BundlePage < Page
            ##
            # Initialize the BundlePage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [BundlePage] BundlePage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of BundleInstance
            # @param [Hash] payload Payload response from the API
            # @return [BundleInstance] BundleInstance
            def get_instance(payload)
              BundleInstance.new(@version, payload, )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Numbers.V2.BundlePage>'
            end
          end

          class BundleContext < InstanceContext
            ##
            # Initialize the BundleContext
            # @param [Version] version Version that contains the resource
            # @param [String] sid The unique string that we created to identify the Bundle
            #   resource.
            # @return [BundleContext] BundleContext
            def initialize(version, sid)
              super(version)

              # Path Solution
              @solution = {sid: sid, }
              @uri = "/RegulatoryCompliance/Bundles/#{@solution[:sid]}"

              # Dependents
              @evaluations = nil
              @item_assignments = nil
            end

            ##
            # Fetch the BundleInstance
            # @return [BundleInstance] Fetched BundleInstance
            def fetch
              payload = @version.fetch('GET', @uri)

              BundleInstance.new(@version, payload, sid: @solution[:sid], )
            end

            ##
            # Update the BundleInstance
            # @param [bundle.Status] status The verification status of the Bundle resource.
            # @param [String] status_callback The URL we call to inform your application of
            #   status changes.
            # @param [String] friendly_name The string that you assigned to describe the
            #   resource.
            # @param [String] email The email address that will receive updates when the
            #   Bundle resource changes status.
            # @return [BundleInstance] Updated BundleInstance
            def update(status: :unset, status_callback: :unset, friendly_name: :unset, email: :unset)
              data = Twilio::Values.of({
                  'Status' => status,
                  'StatusCallback' => status_callback,
                  'FriendlyName' => friendly_name,
                  'Email' => email,
              })

              payload = @version.update('POST', @uri, data: data)

              BundleInstance.new(@version, payload, sid: @solution[:sid], )
            end

            ##
            # Access the evaluations
            # @return [EvaluationList]
            # @return [EvaluationContext] if sid was passed.
            def evaluations(sid=:unset)
              raise ArgumentError, 'sid cannot be nil' if sid.nil?

              if sid != :unset
                return EvaluationContext.new(@version, @solution[:sid], sid, )
              end

              unless @evaluations
                @evaluations = EvaluationList.new(@version, bundle_sid: @solution[:sid], )
              end

              @evaluations
            end

            ##
            # Access the item_assignments
            # @return [ItemAssignmentList]
            # @return [ItemAssignmentContext] if sid was passed.
            def item_assignments(sid=:unset)
              raise ArgumentError, 'sid cannot be nil' if sid.nil?

              if sid != :unset
                return ItemAssignmentContext.new(@version, @solution[:sid], sid, )
              end

              unless @item_assignments
                @item_assignments = ItemAssignmentList.new(@version, bundle_sid: @solution[:sid], )
              end

              @item_assignments
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Numbers.V2.BundleContext #{context}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Numbers.V2.BundleContext #{context}>"
            end
          end

          class BundleInstance < InstanceResource
            ##
            # Initialize the BundleInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] sid The unique string that we created to identify the Bundle
            #   resource.
            # @return [BundleInstance] BundleInstance
            def initialize(version, payload, sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'sid' => payload['sid'],
                  'account_sid' => payload['account_sid'],
                  'regulation_sid' => payload['regulation_sid'],
                  'friendly_name' => payload['friendly_name'],
                  'status' => payload['status'],
                  'email' => payload['email'],
                  'status_callback' => payload['status_callback'],
                  'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                  'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                  'url' => payload['url'],
                  'links' => payload['links'],
              }

              # Context
              @instance_context = nil
              @params = {'sid' => sid || @properties['sid'], }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return [BundleContext] BundleContext for this BundleInstance
            def context
              unless @instance_context
                @instance_context = BundleContext.new(@version, @params['sid'], )
              end
              @instance_context
            end

            ##
            # @return [String] The unique string that identifies the resource.
            def sid
              @properties['sid']
            end

            ##
            # @return [String] The SID of the Account that created the resource
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [String] The unique string of a regulation.
            def regulation_sid
              @properties['regulation_sid']
            end

            ##
            # @return [String] The string that you assigned to describe the resource
            def friendly_name
              @properties['friendly_name']
            end

            ##
            # @return [bundle.Status] The verification status of the Bundle resource
            def status
              @properties['status']
            end

            ##
            # @return [String] The email address
            def email
              @properties['email']
            end

            ##
            # @return [String] The URL we call to inform your application of status changes.
            def status_callback
              @properties['status_callback']
            end

            ##
            # @return [Time] The ISO 8601 date and time in GMT when the resource was created
            def date_created
              @properties['date_created']
            end

            ##
            # @return [Time] The ISO 8601 date and time in GMT when the resource was last updated
            def date_updated
              @properties['date_updated']
            end

            ##
            # @return [String] The absolute URL of the Bundle resource
            def url
              @properties['url']
            end

            ##
            # @return [String] The URLs of the Assigned Items of the Bundle resource
            def links
              @properties['links']
            end

            ##
            # Fetch the BundleInstance
            # @return [BundleInstance] Fetched BundleInstance
            def fetch
              context.fetch
            end

            ##
            # Update the BundleInstance
            # @param [bundle.Status] status The verification status of the Bundle resource.
            # @param [String] status_callback The URL we call to inform your application of
            #   status changes.
            # @param [String] friendly_name The string that you assigned to describe the
            #   resource.
            # @param [String] email The email address that will receive updates when the
            #   Bundle resource changes status.
            # @return [BundleInstance] Updated BundleInstance
            def update(status: :unset, status_callback: :unset, friendly_name: :unset, email: :unset)
              context.update(
                  status: status,
                  status_callback: status_callback,
                  friendly_name: friendly_name,
                  email: email,
              )
            end

            ##
            # Access the evaluations
            # @return [evaluations] evaluations
            def evaluations
              context.evaluations
            end

            ##
            # Access the item_assignments
            # @return [item_assignments] item_assignments
            def item_assignments
              context.item_assignments
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Numbers.V2.BundleInstance #{values}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Numbers.V2.BundleInstance #{values}>"
            end
          end
        end
      end
    end
  end
end