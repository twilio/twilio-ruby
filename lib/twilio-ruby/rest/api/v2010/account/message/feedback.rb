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
          class MessageContext < InstanceContext
            class FeedbackList < ListResource
              ##
              # Initialize the FeedbackList
              # @param [Version] version Version that contains the resource
              # @param [String] account_sid The account_sid
              # @param [String] message_sid The message_sid
              # @return [FeedbackList] FeedbackList
              def initialize(version, account_sid: nil, message_sid: nil)
                super(version)

                # Path Solution
                @solution = {
                    account_sid: account_sid,
                    message_sid: message_sid
                }
                @uri = "/Accounts/#{@solution[:account_sid]}/Messages/#{@solution[:message_sid]}/Feedback.json"
              end

              ##
              # Retrieve a single page of FeedbackInstance records from the API.
              # Request is executed immediately.
              # @param [feedback.Outcome] outcome The outcome
              # @return [FeedbackInstance] Newly created FeedbackInstance
              def create(outcome: Twilio::Values::Unset)
                data = Twilio::Values.of({
                    'Outcome' => outcome,
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
                    message_sid: @solution[:message_sid],
                )
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
              # @param [String] message_sid The message_sid
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
                    message_sid: @solution[:message_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Api.V2010.FeedbackPage>'
              end
            end

            class FeedbackInstance < InstanceResource
              ##
              # Initialize the FeedbackInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] account_sid The account_sid
              # @param [String] message_sid The message_sid
              # @return [FeedbackInstance] FeedbackInstance
              def initialize(version, payload, account_sid: nil, message_sid: nil)
                super(version)

                # Marshaled Properties
                @properties = {
                    'account_sid' => payload['account_sid'],
                    'message_sid' => payload['message_sid'],
                    'outcome' => payload['outcome'],
                    'date_created' => Twilio.deserialize_rfc2822(payload['date_created']),
                    'date_updated' => Twilio.deserialize_rfc2822(payload['date_updated']),
                    'uri' => payload['uri'],
                }
              end

              def account_sid
                @properties['account_sid']
              end

              def message_sid
                @properties['message_sid']
              end

              def outcome
                @properties['outcome']
              end

              def date_created
                @properties['date_created']
              end

              def date_updated
                @properties['date_updated']
              end

              def uri
                @properties['uri']
              end

              ##
              # Provide a user friendly representation
              def to_s
                "<Twilio.Api.V2010.FeedbackInstance>"
              end
            end
          end
        end
      end
    end
  end
end