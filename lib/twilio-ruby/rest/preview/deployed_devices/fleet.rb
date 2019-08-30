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
      class DeployedDevices < Version
        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class FleetList < ListResource
          ##
          # Initialize the FleetList
          # @param [Version] version Version that contains the resource
          # @return [FleetList] FleetList
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}
            @uri = "/Fleets"
          end

          ##
          # Retrieve a single page of FleetInstance records from the API.
          # Request is executed immediately.
          # @param [String] friendly_name Provides a human readable descriptive text for
          #   this Fleet, up to 256 characters long.
          # @return [FleetInstance] Newly created FleetInstance
          def create(friendly_name: :unset)
            data = Twilio::Values.of({'FriendlyName' => friendly_name, })

            payload = @version.create(
                'POST',
                @uri,
                data: data
            )

            FleetInstance.new(@version, payload, )
          end

          ##
          # Lists FleetInstance records from the API as a list.
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
          # Streams FleetInstance records from the API as an Enumerable.
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
          # When passed a block, yields FleetInstance records from the API.
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
          # Retrieve a single page of FleetInstance records from the API.
          # Request is executed immediately.
          # @param [String] page_token PageToken provided by the API
          # @param [Integer] page_number Page Number, this value is simply for client state
          # @param [Integer] page_size Number of records to return, defaults to 50
          # @return [Page] Page of FleetInstance
          def page(page_token: :unset, page_number: :unset, page_size: :unset)
            params = Twilio::Values.of({
                'PageToken' => page_token,
                'Page' => page_number,
                'PageSize' => page_size,
            })
            response = @version.page(
                'GET',
                @uri,
                params
            )
            FleetPage.new(@version, response, @solution)
          end

          ##
          # Retrieve a single page of FleetInstance records from the API.
          # Request is executed immediately.
          # @param [String] target_url API-generated URL for the requested results page
          # @return [Page] Page of FleetInstance
          def get_page(target_url)
            response = @version.domain.request(
                'GET',
                target_url
            )
            FleetPage.new(@version, response, @solution)
          end

          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.Preview.DeployedDevices.FleetList>'
          end
        end

        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class FleetPage < Page
          ##
          # Initialize the FleetPage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [FleetPage] FleetPage
          def initialize(version, response, solution)
            super(version, response)

            # Path Solution
            @solution = solution
          end

          ##
          # Build an instance of FleetInstance
          # @param [Hash] payload Payload response from the API
          # @return [FleetInstance] FleetInstance
          def get_instance(payload)
            FleetInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.Preview.DeployedDevices.FleetPage>'
          end
        end

        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class FleetContext < InstanceContext
          ##
          # Initialize the FleetContext
          # @param [Version] version Version that contains the resource
          # @param [String] sid Provides a 34 character string that uniquely identifies the
          #   requested Fleet resource.
          # @return [FleetContext] FleetContext
          def initialize(version, sid)
            super(version)

            # Path Solution
            @solution = {sid: sid, }
            @uri = "/Fleets/#{@solution[:sid]}"

            # Dependents
            @devices = nil
            @deployments = nil
            @certificates = nil
            @keys = nil
          end

          ##
          # Fetch a FleetInstance
          # @return [FleetInstance] Fetched FleetInstance
          def fetch
            params = Twilio::Values.of({})

            payload = @version.fetch(
                'GET',
                @uri,
                params,
            )

            FleetInstance.new(@version, payload, sid: @solution[:sid], )
          end

          ##
          # Deletes the FleetInstance
          # @return [Boolean] true if delete succeeds, true otherwise
          def delete
            @version.delete('delete', @uri)
          end

          ##
          # Update the FleetInstance
          # @param [String] friendly_name Provides a human readable descriptive text for
          #   this Fleet, up to 256 characters long.
          # @param [String] default_deployment_sid Provides a string identifier of a
          #   Deployment that is going to be used as a default one for this Fleet.
          # @return [FleetInstance] Updated FleetInstance
          def update(friendly_name: :unset, default_deployment_sid: :unset)
            data = Twilio::Values.of({
                'FriendlyName' => friendly_name,
                'DefaultDeploymentSid' => default_deployment_sid,
            })

            payload = @version.update(
                'POST',
                @uri,
                data: data,
            )

            FleetInstance.new(@version, payload, sid: @solution[:sid], )
          end

          ##
          # Access the devices
          # @return [DeviceList]
          # @return [DeviceContext] if sid was passed.
          def devices(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return DeviceContext.new(@version, @solution[:sid], sid, )
            end

            unless @devices
              @devices = DeviceList.new(@version, fleet_sid: @solution[:sid], )
            end

            @devices
          end

          ##
          # Access the deployments
          # @return [DeploymentList]
          # @return [DeploymentContext] if sid was passed.
          def deployments(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return DeploymentContext.new(@version, @solution[:sid], sid, )
            end

            unless @deployments
              @deployments = DeploymentList.new(@version, fleet_sid: @solution[:sid], )
            end

            @deployments
          end

          ##
          # Access the certificates
          # @return [CertificateList]
          # @return [CertificateContext] if sid was passed.
          def certificates(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return CertificateContext.new(@version, @solution[:sid], sid, )
            end

            unless @certificates
              @certificates = CertificateList.new(@version, fleet_sid: @solution[:sid], )
            end

            @certificates
          end

          ##
          # Access the keys
          # @return [KeyList]
          # @return [KeyContext] if sid was passed.
          def keys(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return KeyContext.new(@version, @solution[:sid], sid, )
            end

            unless @keys
              @keys = KeyList.new(@version, fleet_sid: @solution[:sid], )
            end

            @keys
          end

          ##
          # Provide a user friendly representation
          def to_s
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Preview.DeployedDevices.FleetContext #{context}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Preview.DeployedDevices.FleetContext #{context}>"
          end
        end

        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class FleetInstance < InstanceResource
          ##
          # Initialize the FleetInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @param [String] sid Provides a 34 character string that uniquely identifies the
          #   requested Fleet resource.
          # @return [FleetInstance] FleetInstance
          def initialize(version, payload, sid: nil)
            super(version)

            # Marshaled Properties
            @properties = {
                'sid' => payload['sid'],
                'url' => payload['url'],
                'unique_name' => payload['unique_name'],
                'friendly_name' => payload['friendly_name'],
                'account_sid' => payload['account_sid'],
                'default_deployment_sid' => payload['default_deployment_sid'],
                'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                'links' => payload['links'],
            }

            # Context
            @instance_context = nil
            @params = {'sid' => sid || @properties['sid'], }
          end

          ##
          # Generate an instance context for the instance, the context is capable of
          # performing various actions.  All instance actions are proxied to the context
          # @return [FleetContext] FleetContext for this FleetInstance
          def context
            unless @instance_context
              @instance_context = FleetContext.new(@version, @params['sid'], )
            end
            @instance_context
          end

          ##
          # @return [String] A string that uniquely identifies this Fleet.
          def sid
            @properties['sid']
          end

          ##
          # @return [String] URL of this Fleet.
          def url
            @properties['url']
          end

          ##
          # @return [String] A unique, addressable name of this Fleet.
          def unique_name
            @properties['unique_name']
          end

          ##
          # @return [String] A human readable description for this Fleet.
          def friendly_name
            @properties['friendly_name']
          end

          ##
          # @return [String] The unique SID that identifies this Account.
          def account_sid
            @properties['account_sid']
          end

          ##
          # @return [String] The unique SID that identifies this Fleet's default Deployment.
          def default_deployment_sid
            @properties['default_deployment_sid']
          end

          ##
          # @return [Time] The date this Fleet was created.
          def date_created
            @properties['date_created']
          end

          ##
          # @return [Time] The date this Fleet was updated.
          def date_updated
            @properties['date_updated']
          end

          ##
          # @return [String] Nested resource URLs.
          def links
            @properties['links']
          end

          ##
          # Fetch a FleetInstance
          # @return [FleetInstance] Fetched FleetInstance
          def fetch
            context.fetch
          end

          ##
          # Deletes the FleetInstance
          # @return [Boolean] true if delete succeeds, true otherwise
          def delete
            context.delete
          end

          ##
          # Update the FleetInstance
          # @param [String] friendly_name Provides a human readable descriptive text for
          #   this Fleet, up to 256 characters long.
          # @param [String] default_deployment_sid Provides a string identifier of a
          #   Deployment that is going to be used as a default one for this Fleet.
          # @return [FleetInstance] Updated FleetInstance
          def update(friendly_name: :unset, default_deployment_sid: :unset)
            context.update(friendly_name: friendly_name, default_deployment_sid: default_deployment_sid, )
          end

          ##
          # Access the devices
          # @return [devices] devices
          def devices
            context.devices
          end

          ##
          # Access the deployments
          # @return [deployments] deployments
          def deployments
            context.deployments
          end

          ##
          # Access the certificates
          # @return [certificates] certificates
          def certificates
            context.certificates
          end

          ##
          # Access the keys
          # @return [keys] keys
          def keys
            context.keys
          end

          ##
          # Provide a user friendly representation
          def to_s
            values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Preview.DeployedDevices.FleetInstance #{values}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Preview.DeployedDevices.FleetInstance #{values}>"
          end
        end
      end
    end
  end
end