##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class FlexApi < Domain
      class V1 < Version
        class ConfigurationList < ListResource
          ##
          # Initialize the ConfigurationList
          # @param [Version] version Version that contains the resource
          # @return [ConfigurationList] ConfigurationList
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}
          end

          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.FlexApi.V1.ConfigurationList>'
          end
        end

        class ConfigurationPage < Page
          ##
          # Initialize the ConfigurationPage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [ConfigurationPage] ConfigurationPage
          def initialize(version, response, solution)
            super(version, response)

            # Path Solution
            @solution = solution
          end

          ##
          # Build an instance of ConfigurationInstance
          # @param [Hash] payload Payload response from the API
          # @return [ConfigurationInstance] ConfigurationInstance
          def get_instance(payload)
            ConfigurationInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.FlexApi.V1.ConfigurationPage>'
          end
        end

        class ConfigurationContext < InstanceContext
          ##
          # Initialize the ConfigurationContext
          # @param [Version] version Version that contains the resource
          # @return [ConfigurationContext] ConfigurationContext
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}
            @uri = "/Configuration"
          end

          ##
          # Fetch a ConfigurationInstance
          # @param [String] ui_version Pinned UI version
          # @return [ConfigurationInstance] Fetched ConfigurationInstance
          def fetch(ui_version: :unset)
            params = Twilio::Values.of({'UiVersion' => ui_version, })

            payload = @version.fetch(
                'GET',
                @uri,
                params,
            )

            ConfigurationInstance.new(@version, payload, )
          end

          ##
          # Retrieve a single page of ConfigurationInstance records from the API.
          # Request is executed immediately.
          # @return [ConfigurationInstance] Newly created ConfigurationInstance
          def create
            data = Twilio::Values.of({})

            payload = @version.create(
                'POST',
                @uri,
                data: data
            )

            ConfigurationInstance.new(@version, payload, )
          end

          ##
          # Update the ConfigurationInstance
          # @return [ConfigurationInstance] Updated ConfigurationInstance
          def update
            data = Twilio::Values.of({})

            payload = @version.update(
                'POST',
                @uri,
                data: data,
            )

            ConfigurationInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.FlexApi.V1.ConfigurationContext #{context}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.FlexApi.V1.ConfigurationContext #{context}>"
          end
        end

        class ConfigurationInstance < InstanceResource
          ##
          # Initialize the ConfigurationInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @return [ConfigurationInstance] ConfigurationInstance
          def initialize(version, payload)
            super(version)

            # Marshaled Properties
            @properties = {
                'account_sid' => payload['account_sid'],
                'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                'attributes' => payload['attributes'],
                'status' => payload['status'],
                'taskrouter_workspace_sid' => payload['taskrouter_workspace_sid'],
                'taskrouter_target_workflow_sid' => payload['taskrouter_target_workflow_sid'],
                'taskrouter_target_taskqueue_sid' => payload['taskrouter_target_taskqueue_sid'],
                'taskrouter_taskqueues' => payload['taskrouter_taskqueues'],
                'taskrouter_skills' => payload['taskrouter_skills'],
                'taskrouter_worker_channels' => payload['taskrouter_worker_channels'],
                'taskrouter_worker_attributes' => payload['taskrouter_worker_attributes'],
                'taskrouter_offline_activity_sid' => payload['taskrouter_offline_activity_sid'],
                'runtime_domain' => payload['runtime_domain'],
                'messaging_service_instance_sid' => payload['messaging_service_instance_sid'],
                'chat_service_instance_sid' => payload['chat_service_instance_sid'],
                'ui_language' => payload['ui_language'],
                'ui_attributes' => payload['ui_attributes'],
                'ui_version' => payload['ui_version'],
                'service_version' => payload['service_version'],
                'call_recording_enabled' => payload['call_recording_enabled'],
                'call_recording_webhook_url' => payload['call_recording_webhook_url'],
                'crm_enabled' => payload['crm_enabled'],
                'crm_type' => payload['crm_type'],
                'crm_callback_url' => payload['crm_callback_url'],
                'crm_fallback_url' => payload['crm_fallback_url'],
                'crm_attributes' => payload['crm_attributes'],
                'public_attributes' => payload['public_attributes'],
                'plugin_service_enabled' => payload['plugin_service_enabled'],
                'plugin_service_attributes' => payload['plugin_service_attributes'],
                'integrations' => payload['integrations'],
                'outbound_call_flows' => payload['outbound_call_flows'],
                'url' => payload['url'],
            }

            # Context
            @instance_context = nil
            @params = {}
          end

          ##
          # Generate an instance context for the instance, the context is capable of
          # performing various actions.  All instance actions are proxied to the context
          # @return [ConfigurationContext] ConfigurationContext for this ConfigurationInstance
          def context
            unless @instance_context
              @instance_context = ConfigurationContext.new(@version, )
            end
            @instance_context
          end

          ##
          # @return [String] The unique id of the Account responsible for this configuration
          def account_sid
            @properties['account_sid']
          end

          ##
          # @return [Time] The time the Configuration was created, given as GMT in ISO 8601 format
          def date_created
            @properties['date_created']
          end

          ##
          # @return [Time] The time the Configuration was last updated, given as GMT in ISO 8601 format
          def date_updated
            @properties['date_updated']
          end

          ##
          # @return [Hash] Attiributes
          def attributes
            @properties['attributes']
          end

          ##
          # @return [configuration.Status] Status of the Flex onboarding
          def status
            @properties['status']
          end

          ##
          # @return [String] The unique ID of the TaskRouter Workspace
          def taskrouter_workspace_sid
            @properties['taskrouter_workspace_sid']
          end

          ##
          # @return [String] The unique ID of the TaskRouter Target Workflow
          def taskrouter_target_workflow_sid
            @properties['taskrouter_target_workflow_sid']
          end

          ##
          # @return [String] The unique ID of the TaskRouter Target TaskQueue
          def taskrouter_target_taskqueue_sid
            @properties['taskrouter_target_taskqueue_sid']
          end

          ##
          # @return [Hash] Array of TaskRouter TaskQueues
          def taskrouter_taskqueues
            @properties['taskrouter_taskqueues']
          end

          ##
          # @return [Hash] Skill description for TaskRouter workers
          def taskrouter_skills
            @properties['taskrouter_skills']
          end

          ##
          # @return [Hash] TaskRouter default channel capacities and availability for workers
          def taskrouter_worker_channels
            @properties['taskrouter_worker_channels']
          end

          ##
          # @return [Hash] The taskrouter_worker_attributes
          def taskrouter_worker_attributes
            @properties['taskrouter_worker_attributes']
          end

          ##
          # @return [String] The unique ID of the offline activity
          def taskrouter_offline_activity_sid
            @properties['taskrouter_offline_activity_sid']
          end

          ##
          # @return [String] Flex resources hosting URL for the main UI
          def runtime_domain
            @properties['runtime_domain']
          end

          ##
          # @return [String] Unique 34 character ID of the Messaging Service
          def messaging_service_instance_sid
            @properties['messaging_service_instance_sid']
          end

          ##
          # @return [String] The unique id of the Chat Service this user belongs to
          def chat_service_instance_sid
            @properties['chat_service_instance_sid']
          end

          ##
          # @return [String] Main language of the Flex UI
          def ui_language
            @properties['ui_language']
          end

          ##
          # @return [Hash] UI Attributes
          def ui_attributes
            @properties['ui_attributes']
          end

          ##
          # @return [String] Pinned UI version
          def ui_version
            @properties['ui_version']
          end

          ##
          # @return [String] Flex Service version
          def service_version
            @properties['service_version']
          end

          ##
          # @return [Boolean] Call recording enabled
          def call_recording_enabled
            @properties['call_recording_enabled']
          end

          ##
          # @return [String] Call recording webhook url
          def call_recording_webhook_url
            @properties['call_recording_webhook_url']
          end

          ##
          # @return [Boolean] Flag indicating whether CRM is present for Flex
          def crm_enabled
            @properties['crm_enabled']
          end

          ##
          # @return [String] CRM Type
          def crm_type
            @properties['crm_type']
          end

          ##
          # @return [String] CRM Callback URL
          def crm_callback_url
            @properties['crm_callback_url']
          end

          ##
          # @return [String] CRM Fallback URL
          def crm_fallback_url
            @properties['crm_fallback_url']
          end

          ##
          # @return [Hash] CRM Attributes
          def crm_attributes
            @properties['crm_attributes']
          end

          ##
          # @return [Hash] Public Attributes
          def public_attributes
            @properties['public_attributes']
          end

          ##
          # @return [Boolean] Is plugin service Enabled
          def plugin_service_enabled
            @properties['plugin_service_enabled']
          end

          ##
          # @return [Hash] Plugin service Attributes
          def plugin_service_attributes
            @properties['plugin_service_attributes']
          end

          ##
          # @return [Hash] Integration parameters
          def integrations
            @properties['integrations']
          end

          ##
          # @return [Hash] Outbound call flows Attributes
          def outbound_call_flows
            @properties['outbound_call_flows']
          end

          ##
          # @return [String] The URL for this resource
          def url
            @properties['url']
          end

          ##
          # Fetch a ConfigurationInstance
          # @param [String] ui_version Pinned UI version
          # @return [ConfigurationInstance] Fetched ConfigurationInstance
          def fetch(ui_version: :unset)
            context.fetch(ui_version: ui_version, )
          end

          ##
          # Retrieve a single page of ConfigurationInstance records from the API.
          # Request is executed immediately.
          # @return [ConfigurationInstance] Newly created ConfigurationInstance
          def create
            context.create
          end

          ##
          # Update the ConfigurationInstance
          # @return [ConfigurationInstance] Updated ConfigurationInstance
          def update
            context.update
          end

          ##
          # Provide a user friendly representation
          def to_s
            values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.FlexApi.V1.ConfigurationInstance #{values}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.FlexApi.V1.ConfigurationInstance #{values}>"
          end
        end
      end
    end
  end
end