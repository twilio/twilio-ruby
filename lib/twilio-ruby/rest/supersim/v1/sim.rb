##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Supersim < Domain
      class V1 < Version
        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class SimList < ListResource
          ##
          # Initialize the SimList
          # @param [Version] version Version that contains the resource
          # @return [SimList] SimList
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}
            @uri = "/Sims"
          end

          ##
          # Lists SimInstance records from the API as a list.
          # Unlike stream(), this operation is eager and will load `limit` records into
          # memory before returning.
          # @param [sim.Status] status The status of the Sim resources to read. Can be
          #   `new`, `active`, `inactive`, or `scheduled`.
          # @param [String] fleet The SID or unique name of the Fleet to which a list of
          #   Sims are assigned.
          # @param [String] iccid The
          #   [ICCID](https://en.wikipedia.org/wiki/Subscriber_identity_module#ICCID)
          #   associated with a Super SIM to filter the list by. Passing this parameter will
          #   always return a list containing zero or one SIMs.
          # @param [Integer] limit Upper limit for the number of records to return. stream()
          #    guarantees to never return more than limit.  Default is no limit
          # @param [Integer] page_size Number of records to fetch per request, when
          #    not set will use the default value of 50 records.  If no page_size is defined
          #    but a limit is defined, stream() will attempt to read the limit with the most
          #    efficient page size, i.e. min(limit, 1000)
          # @return [Array] Array of up to limit results
          def list(status: :unset, fleet: :unset, iccid: :unset, limit: nil, page_size: nil)
            self.stream(status: status, fleet: fleet, iccid: iccid, limit: limit, page_size: page_size).entries
          end

          ##
          # Streams SimInstance records from the API as an Enumerable.
          # This operation lazily loads records as efficiently as possible until the limit
          # is reached.
          # @param [sim.Status] status The status of the Sim resources to read. Can be
          #   `new`, `active`, `inactive`, or `scheduled`.
          # @param [String] fleet The SID or unique name of the Fleet to which a list of
          #   Sims are assigned.
          # @param [String] iccid The
          #   [ICCID](https://en.wikipedia.org/wiki/Subscriber_identity_module#ICCID)
          #   associated with a Super SIM to filter the list by. Passing this parameter will
          #   always return a list containing zero or one SIMs.
          # @param [Integer] limit Upper limit for the number of records to return. stream()
          #    guarantees to never return more than limit. Default is no limit.
          # @param [Integer] page_size Number of records to fetch per request, when
          #    not set will use the default value of 50 records. If no page_size is defined
          #    but a limit is defined, stream() will attempt to read the limit with the most
          #    efficient page size, i.e. min(limit, 1000)
          # @return [Enumerable] Enumerable that will yield up to limit results
          def stream(status: :unset, fleet: :unset, iccid: :unset, limit: nil, page_size: nil)
            limits = @version.read_limits(limit, page_size)

            page = self.page(status: status, fleet: fleet, iccid: iccid, page_size: limits[:page_size], )

            @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
          end

          ##
          # When passed a block, yields SimInstance records from the API.
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
          # Retrieve a single page of SimInstance records from the API.
          # Request is executed immediately.
          # @param [sim.Status] status The status of the Sim resources to read. Can be
          #   `new`, `active`, `inactive`, or `scheduled`.
          # @param [String] fleet The SID or unique name of the Fleet to which a list of
          #   Sims are assigned.
          # @param [String] iccid The
          #   [ICCID](https://en.wikipedia.org/wiki/Subscriber_identity_module#ICCID)
          #   associated with a Super SIM to filter the list by. Passing this parameter will
          #   always return a list containing zero or one SIMs.
          # @param [String] page_token PageToken provided by the API
          # @param [Integer] page_number Page Number, this value is simply for client state
          # @param [Integer] page_size Number of records to return, defaults to 50
          # @return [Page] Page of SimInstance
          def page(status: :unset, fleet: :unset, iccid: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
            params = Twilio::Values.of({
                'Status' => status,
                'Fleet' => fleet,
                'Iccid' => iccid,
                'PageToken' => page_token,
                'Page' => page_number,
                'PageSize' => page_size,
            })

            response = @version.page('GET', @uri, params)

            SimPage.new(@version, response, @solution)
          end

          ##
          # Retrieve a single page of SimInstance records from the API.
          # Request is executed immediately.
          # @param [String] target_url API-generated URL for the requested results page
          # @return [Page] Page of SimInstance
          def get_page(target_url)
            response = @version.domain.request(
                'GET',
                target_url
            )
            SimPage.new(@version, response, @solution)
          end

          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.Supersim.V1.SimList>'
          end
        end

        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class SimPage < Page
          ##
          # Initialize the SimPage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [SimPage] SimPage
          def initialize(version, response, solution)
            super(version, response)

            # Path Solution
            @solution = solution
          end

          ##
          # Build an instance of SimInstance
          # @param [Hash] payload Payload response from the API
          # @return [SimInstance] SimInstance
          def get_instance(payload)
            SimInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.Supersim.V1.SimPage>'
          end
        end

        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class SimContext < InstanceContext
          ##
          # Initialize the SimContext
          # @param [Version] version Version that contains the resource
          # @param [String] sid The SID of the Sim resource to fetch.
          # @return [SimContext] SimContext
          def initialize(version, sid)
            super(version)

            # Path Solution
            @solution = {sid: sid, }
            @uri = "/Sims/#{@solution[:sid]}"
          end

          ##
          # Fetch the SimInstance
          # @return [SimInstance] Fetched SimInstance
          def fetch
            payload = @version.fetch('GET', @uri)

            SimInstance.new(@version, payload, sid: @solution[:sid], )
          end

          ##
          # Update the SimInstance
          # @param [String] unique_name An application-defined string that uniquely
          #   identifies the resource. It can be used in place of the resource's `sid` in the
          #   URL to address the resource.
          # @param [sim.StatusUpdate] status The new status of the resource. Can be:
          #   `active` or `inactive`. See the [Super SIM Status
          #   Values](https://www.twilio.com/docs/iot/supersim/api/sim-resource#status-values)
          #   for more info.
          # @param [String] fleet The SID or unique name of the Fleet to which the SIM
          #   resource should be assigned.
          # @return [SimInstance] Updated SimInstance
          def update(unique_name: :unset, status: :unset, fleet: :unset)
            data = Twilio::Values.of({'UniqueName' => unique_name, 'Status' => status, 'Fleet' => fleet, })

            payload = @version.update('POST', @uri, data: data)

            SimInstance.new(@version, payload, sid: @solution[:sid], )
          end

          ##
          # Provide a user friendly representation
          def to_s
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Supersim.V1.SimContext #{context}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Supersim.V1.SimContext #{context}>"
          end
        end

        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class SimInstance < InstanceResource
          ##
          # Initialize the SimInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @param [String] sid The SID of the Sim resource to fetch.
          # @return [SimInstance] SimInstance
          def initialize(version, payload, sid: nil)
            super(version)

            # Marshaled Properties
            @properties = {
                'sid' => payload['sid'],
                'unique_name' => payload['unique_name'],
                'account_sid' => payload['account_sid'],
                'iccid' => payload['iccid'],
                'status' => payload['status'],
                'fleet_sid' => payload['fleet_sid'],
                'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                'url' => payload['url'],
            }

            # Context
            @instance_context = nil
            @params = {'sid' => sid || @properties['sid'], }
          end

          ##
          # Generate an instance context for the instance, the context is capable of
          # performing various actions.  All instance actions are proxied to the context
          # @return [SimContext] SimContext for this SimInstance
          def context
            unless @instance_context
              @instance_context = SimContext.new(@version, @params['sid'], )
            end
            @instance_context
          end

          ##
          # @return [String] The unique string that identifies the resource
          def sid
            @properties['sid']
          end

          ##
          # @return [String] An application-defined string that uniquely identifies the resource
          def unique_name
            @properties['unique_name']
          end

          ##
          # @return [String] The SID of the Account that the Super SIM belongs to
          def account_sid
            @properties['account_sid']
          end

          ##
          # @return [String] The ICCID associated with the SIM
          def iccid
            @properties['iccid']
          end

          ##
          # @return [sim.Status] The status of the Super SIM
          def status
            @properties['status']
          end

          ##
          # @return [String] The unique ID of the Fleet configured for this SIM
          def fleet_sid
            @properties['fleet_sid']
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
          # @return [String] The absolute URL of the Sim Resource
          def url
            @properties['url']
          end

          ##
          # Fetch the SimInstance
          # @return [SimInstance] Fetched SimInstance
          def fetch
            context.fetch
          end

          ##
          # Update the SimInstance
          # @param [String] unique_name An application-defined string that uniquely
          #   identifies the resource. It can be used in place of the resource's `sid` in the
          #   URL to address the resource.
          # @param [sim.StatusUpdate] status The new status of the resource. Can be:
          #   `active` or `inactive`. See the [Super SIM Status
          #   Values](https://www.twilio.com/docs/iot/supersim/api/sim-resource#status-values)
          #   for more info.
          # @param [String] fleet The SID or unique name of the Fleet to which the SIM
          #   resource should be assigned.
          # @return [SimInstance] Updated SimInstance
          def update(unique_name: :unset, status: :unset, fleet: :unset)
            context.update(unique_name: unique_name, status: status, fleet: fleet, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Supersim.V1.SimInstance #{values}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Supersim.V1.SimInstance #{values}>"
          end
        end
      end
    end
  end
end