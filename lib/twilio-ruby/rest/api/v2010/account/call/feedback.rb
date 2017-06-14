##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Api < Domain
      class V2010 < Version
        class AccountContext < InstanceContext
          class CallContext < InstanceContext
            class FeedbackList < ListResource
              ##
              # Initialize the FeedbackList
              # @param [Version] version Version that contains the resource
              # @param [String] account_sid The account_sid
              # @param [String] call_sid A 34 character string that uniquely identifies this
              #   resource.
              # @return [FeedbackList] FeedbackList
              def initialize(version, account_sid: nil, call_sid: nil)
                super(version)

                # Path Solution
                @solution = {
                    account_sid: account_sid,
                    call_sid: call_sid
                }
              end

              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Api.V2010.FeedbackList>'
              end
            end

            class FeedbackPage < Page
              ##
              # Initialize the FeedbackPage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @param [String] account_sid The account_sid
              # @param [String] call_sid A 34 character string that uniquely identifies this
              #   resource.
              # @return [FeedbackPage] FeedbackPage
              def initialize(version, response, solution)
                super(version, response)

                # Path Solution
                @solution = solution
              end

              ##
              # Build an instance of FeedbackInstance
              # @param [Hash] payload Payload response from the API
              # @return [FeedbackInstance] FeedbackInstance
              def get_instance(payload)
                return FeedbackInstance.new(
                    @version,
                    payload,
                    account_sid: @solution[:account_sid],
                    call_sid: @solution[:call_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Api.V2010.FeedbackPage>'
              end
            end

            class FeedbackContext < InstanceContext
              ##
              # Initialize the FeedbackContext
              # @param [Version] version Version that contains the resource
              # @param [String] account_sid The account_sid
              # @param [String] call_sid The call sid that uniquely identifies the call
              # @return [FeedbackContext] FeedbackContext
              def initialize(version, account_sid, call_sid)
                super(version)

                # Path Solution
                @solution = {
                    account_sid: account_sid,
                    call_sid: call_sid,
                }
                @uri = "/Accounts/#{@solution[:account_sid]}/Calls/#{@solution[:call_sid]}/Feedback.json"
              end

              ##
              # Retrieve a single page of FeedbackInstance records from the API.
              # Request is executed immediately.
              # @param [String] quality_score The quality_score
              # @param [feedback.Issues] issue The issue
              # @return [FeedbackInstance] Newly created FeedbackInstance
              def create(quality_score: nil, issue: Twilio::Values::Unset)
                data = Twilio::Values.of({
                    'QualityScore' => quality_score,
                    'Issue' => issue,
                })

                payload = @version.create(
                    'POST',
                    @uri,
                    data: data
                )

                return FeedbackInstance.new(
                    @version,
                    payload,
                    account_sid: @solution[:account_sid],
                    call_sid: @solution[:call_sid],
                )
              end

              ##
              # Fetch a FeedbackInstance
              # @return [FeedbackInstance] Fetched FeedbackInstance
              def fetch
                params = Twilio::Values.of({})

                payload = @version.fetch(
                    'GET',
                    @uri,
                    params,
                )

                return FeedbackInstance.new(
                    @version,
                    payload,
                    account_sid: @solution[:account_sid],
                    call_sid: @solution[:call_sid],
                )
              end

              ##
              # Update the FeedbackInstance
              # @param [String] quality_score An integer from 1 to 5 quality score
              # @param [feedback.Issues] issue One or more of the issues experienced during the
              #   call
              # @return [FeedbackInstance] Updated FeedbackInstance
              def update(quality_score: nil, issue: Twilio::Values::Unset)
                data = Twilio::Values.of({
                    'QualityScore' => quality_score,
                    'Issue' => issue,
                })

                payload = @version.update(
                    'POST',
                    @uri,
                    data: data,
                )

                return FeedbackInstance.new(
                    @version,
                    payload,
                    account_sid: @solution[:account_sid],
                    call_sid: @solution[:call_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Api.V2010.FeedbackContext #{context}>"
              end
            end

            class FeedbackInstance < InstanceResource
              ##
              # Initialize the FeedbackInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] account_sid The account_sid
              # @param [String] call_sid A 34 character string that uniquely identifies this
              #   resource.
              # @return [FeedbackInstance] FeedbackInstance
              def initialize(version, payload, account_sid: nil, call_sid: nil)
                super(version)

                # Marshaled Properties
                @properties = {
                    'account_sid' => payload['account_sid'],
                    'date_created' => Twilio.deserialize_rfc2822(payload['date_created']),
                    'date_updated' => Twilio.deserialize_rfc2822(payload['date_updated']),
                    'issues' => payload['issues'],
                    'quality_score' => payload['quality_score'].to_i,
                    'sid' => payload['sid'],
                }

                # Context
                @instance_context = nil
                @params = {
                    'account_sid' => account_sid,
                    'call_sid' => call_sid,
                }
              end

              ##
              # Generate an instance context for the instance, the context is capable of
              # performing various actions.  All instance actions are proxied to the context
              # @param [Version] version Version that contains the resource
              # @return [FeedbackContext] FeedbackContext for this FeedbackInstance
              def context
                unless @instance_context
                  @instance_context = FeedbackContext.new(
                      @version,
                      @params['account_sid'],
                      @params['call_sid'],
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

              def issues
                @properties['issues']
              end

              def quality_score
                @properties['quality_score']
              end

              def sid
                @properties['sid']
              end

              ##
              # Retrieve a single page of FeedbackInstance records from the API.
              # Request is executed immediately.
              # @param [String] quality_score The quality_score
              # @param [feedback.Issues] issue The issue
              # @return [FeedbackInstance] Newly created FeedbackInstance
              def create(quality_score: nil, issue: Twilio::Values::Unset)
                context.create(
                    quality_score: quality_score,
                    issue: issue,
                )
              end

              ##
              # Fetch a FeedbackInstance
              # @return [FeedbackInstance] Fetched FeedbackInstance
              def fetch
                context.fetch
              end

              ##
              # Update the FeedbackInstance
              # @param [String] quality_score An integer from 1 to 5 quality score
              # @param [feedback.Issues] issue One or more of the issues experienced during the
              #   call
              # @return [FeedbackInstance] Updated FeedbackInstance
              def update(quality_score: nil, issue: Twilio::Values::Unset)
                context.update(
                    quality_score: quality_score,
                    issue: issue,
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Api.V2010.FeedbackInstance #{values}>"
              end
            end
          end
        end
      end
    end
  end
end