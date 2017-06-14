##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Taskrouter < Domain
      class V1 < Version
        class WorkspaceContext < InstanceContext
          class WorkerContext < InstanceContext
            class ReservationList < ListResource
              ##
              # Initialize the ReservationList
              # @param [Version] version Version that contains the resource
              # @param [String] workspace_sid The workspace_sid
              # @param [String] worker_sid The worker_sid
              # @return [ReservationList] ReservationList
              def initialize(version, workspace_sid: nil, worker_sid: nil)
                super(version)

                # Path Solution
                @solution = {
                    workspace_sid: workspace_sid,
                    worker_sid: worker_sid
                }
                @uri = "/Workspaces/#{@solution[:workspace_sid]}/Workers/#{@solution[:worker_sid]}/Reservations"
              end

              ##
              # Lists ReservationInstance records from the API as a list.
              # Unlike stream(), this operation is eager and will load `limit` records into
              # memory before returning.
              # @param [reservation.Status] reservation_status The reservation_status
              # @param [Integer] limit Upper limit for the number of records to return. stream()
              #                   guarantees to never return more than limit.  Default is no limit
              # @param [Integer] page_size Number of records to fetch per request, when not set will                      use
              #  the default value of 50 records.  If no page_size is                      defined
              #  but a limit is defined, stream() will attempt to read                      the
              #  limit with the most efficient page size,                      i.e. min(limit, 1000)
              # @return [Array] Array of up to limit results
              def list(reservation_status: Twilio::Values::Unset, limit: nil, page_size: nil)
                self.stream(
                    reservation_status: reservation_status,
                    limit: limit,
                    page_size: page_size
                ).entries
              end

              ##
              # Streams ReservationInstance records from the API as an Enumerable.
              # This operation lazily loads records as efficiently as possible until the limit
              # is reached.
              # @param [reservation.Status] reservation_status The reservation_status
              # @param [Integer] limit Upper limit for the number of records to return.                  stream()
              #  guarantees to never return more than limit.                  Default is no limit
              # @param [Integer] page_size Number of records to fetch per request, when                      not set will use
              #  the default value of 50 records.                      If no page_size is defined
              #                       but a limit is defined, stream() will attempt to                      read the
              #  limit with the most efficient page size,                       i.e. min(limit, 1000)
              # @return [Enumerable] Enumerable that will yield up to limit results
              def stream(reservation_status: Twilio::Values::Unset, limit: nil, page_size: nil)
                limits = @version.read_limits(limit, page_size)

                page = self.page(
                    reservation_status: reservation_status,
                    page_size: limits[:page_size],
                )

                @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
              end

              ##
              # When passed a block, yields ReservationInstance records from the API.
              # This operation lazily loads records as efficiently as possible until the limit
              # is reached.
              # @param [reservation.Status] reservation_status The reservation_status
              # @param [Integer] limit Upper limit for the number of records to return.                  stream()
              #  guarantees to never return more than limit.                  Default is no limit
              # @param [Integer] page_size Number of records to fetch per request, when                       not set will use
              #  the default value of 50 records.                      If no page_size is defined
              #                       but a limit is defined, stream() will attempt to read the
              #                       limit with the most efficient page size, i.e. min(limit, 1000)
              def each
                limits = @version.read_limits

                page = self.page(
                    page_size: limits[:page_size],
                )

                @version.stream(page,
                                limit: limits[:limit],
                                page_limit: limits[:page_limit]).each {|x| yield x}
              end

              ##
              # Retrieve a single page of ReservationInstance records from the API.
              # Request is executed immediately.
              # @param [reservation.Status] reservation_status The reservation_status
              # @param [String] page_token PageToken provided by the API
              # @param [Integer] page_number Page Number, this value is simply for client state
              # @param [Integer] page_size Number of records to return, defaults to 50
              # @return [Page] Page of ReservationInstance
              def page(reservation_status: Twilio::Values::Unset, page_token: Twilio::Values::Unset, page_number: Twilio::Values::Unset, page_size: Twilio::Values.Unset)
                params = Twilio::Values.of({
                    'ReservationStatus' => reservation_status,
                    'PageToken' => page_token,
                    'Page' => page_number,
                    'PageSize' => page_size,
                })
                response = @version.page(
                    'GET',
                    @uri,
                    params
                )
                return ReservationPage.new(@version, response, @solution)
              end

              ##
              # Retrieve a single page of ReservationInstance records from the API.
              # Request is executed immediately.
              # @param [String] target_url API-generated URL for the requested results page
              # @return [Page] Page of ReservationInstance
              def get_page(target_url: nil)
                response = @version.domain.request(
                    'GET',
                    target_url
                )
                return ReservationPage.new(@version, response, @solution)
              end

              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Taskrouter.V1.ReservationList>'
              end
            end

            class ReservationPage < Page
              ##
              # Initialize the ReservationPage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @param [String] workspace_sid The workspace_sid
              # @param [String] worker_sid The worker_sid
              # @return [ReservationPage] ReservationPage
              def initialize(version, response, solution)
                super(version, response)

                # Path Solution
                @solution = solution
              end

              ##
              # Build an instance of ReservationInstance
              # @param [Hash] payload Payload response from the API
              # @return [ReservationInstance] ReservationInstance
              def get_instance(payload)
                return ReservationInstance.new(
                    @version,
                    payload,
                    workspace_sid: @solution[:workspace_sid],
                    worker_sid: @solution[:worker_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Taskrouter.V1.ReservationPage>'
              end
            end

            class ReservationContext < InstanceContext
              ##
              # Initialize the ReservationContext
              # @param [Version] version Version that contains the resource
              # @param [String] workspace_sid The workspace_sid
              # @param [String] worker_sid The worker_sid
              # @param [String] sid The sid
              # @return [ReservationContext] ReservationContext
              def initialize(version, workspace_sid, worker_sid, sid)
                super(version)

                # Path Solution
                @solution = {
                    workspace_sid: workspace_sid,
                    worker_sid: worker_sid,
                    sid: sid,
                }
                @uri = "/Workspaces/#{@solution[:workspace_sid]}/Workers/#{@solution[:worker_sid]}/Reservations/#{@solution[:sid]}"
              end

              ##
              # Fetch a ReservationInstance
              # @return [ReservationInstance] Fetched ReservationInstance
              def fetch
                params = Twilio::Values.of({})

                payload = @version.fetch(
                    'GET',
                    @uri,
                    params,
                )

                return ReservationInstance.new(
                    @version,
                    payload,
                    workspace_sid: @solution[:workspace_sid],
                    worker_sid: @solution[:worker_sid],
                    sid: @solution[:sid],
                )
              end

              ##
              # Update the ReservationInstance
              # @param [reservation.Status] reservation_status The reservation_status
              # @param [String] worker_activity_sid The worker_activity_sid
              # @param [String] instruction The instruction
              # @param [String] dequeue_post_work_activity_sid The
              #   dequeue_post_work_activity_sid
              # @param [String] dequeue_from The dequeue_from
              # @param [String] dequeue_record The dequeue_record
              # @param [String] dequeue_timeout The dequeue_timeout
              # @param [String] dequeue_to The dequeue_to
              # @param [String] dequeue_status_callback_url The dequeue_status_callback_url
              # @param [String] call_from The call_from
              # @param [String] call_record The call_record
              # @param [String] call_timeout The call_timeout
              # @param [String] call_to The call_to
              # @param [String] call_url The call_url
              # @param [String] call_status_callback_url The call_status_callback_url
              # @param [Boolean] call_accept The call_accept
              # @param [String] redirect_call_sid The redirect_call_sid
              # @param [Boolean] redirect_accept The redirect_accept
              # @param [String] redirect_url The redirect_url
              # @return [ReservationInstance] Updated ReservationInstance
              def update(reservation_status: Twilio::Values::Unset, worker_activity_sid: Twilio::Values::Unset, instruction: Twilio::Values::Unset, dequeue_post_work_activity_sid: Twilio::Values::Unset, dequeue_from: Twilio::Values::Unset, dequeue_record: Twilio::Values::Unset, dequeue_timeout: Twilio::Values::Unset, dequeue_to: Twilio::Values::Unset, dequeue_status_callback_url: Twilio::Values::Unset, call_from: Twilio::Values::Unset, call_record: Twilio::Values::Unset, call_timeout: Twilio::Values::Unset, call_to: Twilio::Values::Unset, call_url: Twilio::Values::Unset, call_status_callback_url: Twilio::Values::Unset, call_accept: Twilio::Values::Unset, redirect_call_sid: Twilio::Values::Unset, redirect_accept: Twilio::Values::Unset, redirect_url: Twilio::Values::Unset)
                data = Twilio::Values.of({
                    'ReservationStatus' => reservation_status,
                    'WorkerActivitySid' => worker_activity_sid,
                    'Instruction' => instruction,
                    'DequeuePostWorkActivitySid' => dequeue_post_work_activity_sid,
                    'DequeueFrom' => dequeue_from,
                    'DequeueRecord' => dequeue_record,
                    'DequeueTimeout' => dequeue_timeout,
                    'DequeueTo' => dequeue_to,
                    'DequeueStatusCallbackUrl' => dequeue_status_callback_url,
                    'CallFrom' => call_from,
                    'CallRecord' => call_record,
                    'CallTimeout' => call_timeout,
                    'CallTo' => call_to,
                    'CallUrl' => call_url,
                    'CallStatusCallbackUrl' => call_status_callback_url,
                    'CallAccept' => call_accept,
                    'RedirectCallSid' => redirect_call_sid,
                    'RedirectAccept' => redirect_accept,
                    'RedirectUrl' => redirect_url,
                })

                payload = @version.update(
                    'POST',
                    @uri,
                    data: data,
                )

                return ReservationInstance.new(
                    @version,
                    payload,
                    workspace_sid: @solution[:workspace_sid],
                    worker_sid: @solution[:worker_sid],
                    sid: @solution[:sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Taskrouter.V1.ReservationContext #{context}>"
              end
            end

            class ReservationInstance < InstanceResource
              ##
              # Initialize the ReservationInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] workspace_sid The workspace_sid
              # @param [String] worker_sid The worker_sid
              # @param [String] sid The sid
              # @return [ReservationInstance] ReservationInstance
              def initialize(version, payload, workspace_sid: nil, worker_sid: nil, sid: nil)
                super(version)

                # Marshaled Properties
                @properties = {
                    'account_sid' => payload['account_sid'],
                    'date_created' => Twilio.deserialize_iso8601(payload['date_created']),
                    'date_updated' => Twilio.deserialize_iso8601(payload['date_updated']),
                    'reservation_status' => payload['reservation_status'],
                    'sid' => payload['sid'],
                    'task_sid' => payload['task_sid'],
                    'worker_name' => payload['worker_name'],
                    'worker_sid' => payload['worker_sid'],
                    'workspace_sid' => payload['workspace_sid'],
                    'url' => payload['url'],
                    'links' => payload['links'],
                }

                # Context
                @instance_context = nil
                @params = {
                    'workspace_sid' => workspace_sid,
                    'worker_sid' => worker_sid,
                    'sid' => sid || @properties['sid'],
                }
              end

              ##
              # Generate an instance context for the instance, the context is capable of
              # performing various actions.  All instance actions are proxied to the context
              # @param [Version] version Version that contains the resource
              # @return [ReservationContext] ReservationContext for this ReservationInstance
              def context
                unless @instance_context
                  @instance_context = ReservationContext.new(
                      @version,
                      @params['workspace_sid'],
                      @params['worker_sid'],
                      @params['sid'],
                  )
                end
                @instance_context
              end

              def account_sid
                @properties['account_sid']
              end

              def date_created
                @properties['date_created']
              end

              def date_updated
                @properties['date_updated']
              end

              def reservation_status
                @properties['reservation_status']
              end

              def sid
                @properties['sid']
              end

              def task_sid
                @properties['task_sid']
              end

              def worker_name
                @properties['worker_name']
              end

              def worker_sid
                @properties['worker_sid']
              end

              def workspace_sid
                @properties['workspace_sid']
              end

              def url
                @properties['url']
              end

              def links
                @properties['links']
              end

              ##
              # Fetch a ReservationInstance
              # @return [ReservationInstance] Fetched ReservationInstance
              def fetch
                context.fetch
              end

              ##
              # Update the ReservationInstance
              # @param [reservation.Status] reservation_status The reservation_status
              # @param [String] worker_activity_sid The worker_activity_sid
              # @param [String] instruction The instruction
              # @param [String] dequeue_post_work_activity_sid The
              #   dequeue_post_work_activity_sid
              # @param [String] dequeue_from The dequeue_from
              # @param [String] dequeue_record The dequeue_record
              # @param [String] dequeue_timeout The dequeue_timeout
              # @param [String] dequeue_to The dequeue_to
              # @param [String] dequeue_status_callback_url The dequeue_status_callback_url
              # @param [String] call_from The call_from
              # @param [String] call_record The call_record
              # @param [String] call_timeout The call_timeout
              # @param [String] call_to The call_to
              # @param [String] call_url The call_url
              # @param [String] call_status_callback_url The call_status_callback_url
              # @param [Boolean] call_accept The call_accept
              # @param [String] redirect_call_sid The redirect_call_sid
              # @param [Boolean] redirect_accept The redirect_accept
              # @param [String] redirect_url The redirect_url
              # @return [ReservationInstance] Updated ReservationInstance
              def update(reservation_status: Twilio::Values::Unset, worker_activity_sid: Twilio::Values::Unset, instruction: Twilio::Values::Unset, dequeue_post_work_activity_sid: Twilio::Values::Unset, dequeue_from: Twilio::Values::Unset, dequeue_record: Twilio::Values::Unset, dequeue_timeout: Twilio::Values::Unset, dequeue_to: Twilio::Values::Unset, dequeue_status_callback_url: Twilio::Values::Unset, call_from: Twilio::Values::Unset, call_record: Twilio::Values::Unset, call_timeout: Twilio::Values::Unset, call_to: Twilio::Values::Unset, call_url: Twilio::Values::Unset, call_status_callback_url: Twilio::Values::Unset, call_accept: Twilio::Values::Unset, redirect_call_sid: Twilio::Values::Unset, redirect_accept: Twilio::Values::Unset, redirect_url: Twilio::Values::Unset)
                context.update(
                    reservation_status: reservation_status,
                    worker_activity_sid: worker_activity_sid,
                    instruction: instruction,
                    dequeue_post_work_activity_sid: dequeue_post_work_activity_sid,
                    dequeue_from: dequeue_from,
                    dequeue_record: dequeue_record,
                    dequeue_timeout: dequeue_timeout,
                    dequeue_to: dequeue_to,
                    dequeue_status_callback_url: dequeue_status_callback_url,
                    call_from: call_from,
                    call_record: call_record,
                    call_timeout: call_timeout,
                    call_to: call_to,
                    call_url: call_url,
                    call_status_callback_url: call_status_callback_url,
                    call_accept: call_accept,
                    redirect_call_sid: redirect_call_sid,
                    redirect_accept: redirect_accept,
                    redirect_url: redirect_url,
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Taskrouter.V1.ReservationInstance #{values}>"
              end
            end
          end
        end
      end
    end
  end
end