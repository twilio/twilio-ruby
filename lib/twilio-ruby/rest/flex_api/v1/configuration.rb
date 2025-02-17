##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Flex
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class FlexApi < FlexApiBase
            class V1 < Version
                class ConfigurationList < ListResource
                
                    ##
                    # Initialize the ConfigurationList
                    # @param [Version] version Version that contains the resource
                    # @return [ConfigurationList] ConfigurationList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        
                        
                    end
                


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.FlexApi.V1.ConfigurationList>'
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
                        @solution = {  }
                        @uri = "/Configuration"

                        
                    end
                    ##
                    # Fetch the ConfigurationInstance
                    # @param [String] ui_version The Pinned UI version of the Configuration resource to fetch.
                    # @return [ConfigurationInstance] Fetched ConfigurationInstance
                    def fetch(
                        ui_version: :unset
                    )

                        params = Twilio::Values.of({
                            'UiVersion' => ui_version,
                        })
                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.fetch('GET', @uri, params: params, headers: headers)
                        ConfigurationInstance.new(
                            @version,
                            payload,
                        )
                    end

                    ##
                    # Update the ConfigurationInstance
                    # @param [Object] body 
                    # @return [ConfigurationInstance] Updated ConfigurationInstance
                    def update(body: :unset
                    )

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        headers['Content-Type'] = 'application/json'
                        
                        
                        
                        
                        payload = @version.update('POST', @uri, headers: headers, data: body.to_json)
                        ConfigurationInstance.new(
                            @version,
                            payload,
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.FlexApi.V1.ConfigurationContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.FlexApi.V1.ConfigurationContext #{context}>"
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
                        ConfigurationInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.FlexApi.V1.ConfigurationPage>'
                    end
                end
                class ConfigurationInstance < InstanceResource
                    ##
                    # Initialize the ConfigurationInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this Configuration
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [ConfigurationInstance] ConfigurationInstance
                    def initialize(version, payload )
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
                            'flex_service_instance_sid' => payload['flex_service_instance_sid'],
                            'flex_instance_sid' => payload['flex_instance_sid'],
                            'ui_language' => payload['ui_language'],
                            'ui_attributes' => payload['ui_attributes'],
                            'ui_dependencies' => payload['ui_dependencies'],
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
                            'serverless_service_sids' => payload['serverless_service_sids'],
                            'queue_stats_configuration' => payload['queue_stats_configuration'],
                            'notifications' => payload['notifications'],
                            'markdown' => payload['markdown'],
                            'url' => payload['url'],
                            'flex_insights_hr' => payload['flex_insights_hr'],
                            'flex_insights_drilldown' => payload['flex_insights_drilldown'],
                            'flex_url' => payload['flex_url'],
                            'channel_configs' => payload['channel_configs'],
                            'debugger_integration' => payload['debugger_integration'],
                            'flex_ui_status_report' => payload['flex_ui_status_report'],
                            'agent_conv_end_methods' => payload['agent_conv_end_methods'],
                            'citrix_voice_vdi' => payload['citrix_voice_vdi'],
                            'offline_config' => payload['offline_config'],
                        }

                        # Context
                        @instance_context = nil
                        @params = {  }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [ConfigurationContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = ConfigurationContext.new(@version )
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Configuration resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the Configuration resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the Configuration resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    def date_updated
                        @properties['date_updated']
                    end
                    
                    ##
                    # @return [Hash] An object that contains application-specific data.
                    def attributes
                        @properties['attributes']
                    end
                    
                    ##
                    # @return [Status] 
                    def status
                        @properties['status']
                    end
                    
                    ##
                    # @return [String] The SID of the TaskRouter Workspace.
                    def taskrouter_workspace_sid
                        @properties['taskrouter_workspace_sid']
                    end
                    
                    ##
                    # @return [String] The SID of the TaskRouter target Workflow.
                    def taskrouter_target_workflow_sid
                        @properties['taskrouter_target_workflow_sid']
                    end
                    
                    ##
                    # @return [String] The SID of the TaskRouter Target TaskQueue.
                    def taskrouter_target_taskqueue_sid
                        @properties['taskrouter_target_taskqueue_sid']
                    end
                    
                    ##
                    # @return [Array<Hash>] The list of TaskRouter TaskQueues.
                    def taskrouter_taskqueues
                        @properties['taskrouter_taskqueues']
                    end
                    
                    ##
                    # @return [Array<Hash>] The Skill description for TaskRouter workers.
                    def taskrouter_skills
                        @properties['taskrouter_skills']
                    end
                    
                    ##
                    # @return [Hash] The TaskRouter default channel capacities and availability for workers.
                    def taskrouter_worker_channels
                        @properties['taskrouter_worker_channels']
                    end
                    
                    ##
                    # @return [Hash] The TaskRouter Worker attributes.
                    def taskrouter_worker_attributes
                        @properties['taskrouter_worker_attributes']
                    end
                    
                    ##
                    # @return [String] The TaskRouter SID of the offline activity.
                    def taskrouter_offline_activity_sid
                        @properties['taskrouter_offline_activity_sid']
                    end
                    
                    ##
                    # @return [String] The URL where the Flex instance is hosted.
                    def runtime_domain
                        @properties['runtime_domain']
                    end
                    
                    ##
                    # @return [String] The SID of the Messaging service instance.
                    def messaging_service_instance_sid
                        @properties['messaging_service_instance_sid']
                    end
                    
                    ##
                    # @return [String] The SID of the chat service this user belongs to.
                    def chat_service_instance_sid
                        @properties['chat_service_instance_sid']
                    end
                    
                    ##
                    # @return [String] The SID of the Flex service instance.
                    def flex_service_instance_sid
                        @properties['flex_service_instance_sid']
                    end
                    
                    ##
                    # @return [String] The SID of the Flex instance.
                    def flex_instance_sid
                        @properties['flex_instance_sid']
                    end
                    
                    ##
                    # @return [String] The primary language of the Flex UI.
                    def ui_language
                        @properties['ui_language']
                    end
                    
                    ##
                    # @return [Hash] The object that describes Flex UI characteristics and settings.
                    def ui_attributes
                        @properties['ui_attributes']
                    end
                    
                    ##
                    # @return [Hash] The object that defines the NPM packages and versions to be used in Hosted Flex.
                    def ui_dependencies
                        @properties['ui_dependencies']
                    end
                    
                    ##
                    # @return [String] The Pinned UI version.
                    def ui_version
                        @properties['ui_version']
                    end
                    
                    ##
                    # @return [String] The Flex Service version.
                    def service_version
                        @properties['service_version']
                    end
                    
                    ##
                    # @return [Boolean] Whether call recording is enabled.
                    def call_recording_enabled
                        @properties['call_recording_enabled']
                    end
                    
                    ##
                    # @return [String] The call recording webhook URL.
                    def call_recording_webhook_url
                        @properties['call_recording_webhook_url']
                    end
                    
                    ##
                    # @return [Boolean] Whether CRM is present for Flex.
                    def crm_enabled
                        @properties['crm_enabled']
                    end
                    
                    ##
                    # @return [String] The CRM type.
                    def crm_type
                        @properties['crm_type']
                    end
                    
                    ##
                    # @return [String] The CRM Callback URL.
                    def crm_callback_url
                        @properties['crm_callback_url']
                    end
                    
                    ##
                    # @return [String] The CRM Fallback URL.
                    def crm_fallback_url
                        @properties['crm_fallback_url']
                    end
                    
                    ##
                    # @return [Hash] An object that contains the CRM attributes.
                    def crm_attributes
                        @properties['crm_attributes']
                    end
                    
                    ##
                    # @return [Hash] The list of public attributes, which are visible to unauthenticated clients.
                    def public_attributes
                        @properties['public_attributes']
                    end
                    
                    ##
                    # @return [Boolean] Whether the plugin service enabled.
                    def plugin_service_enabled
                        @properties['plugin_service_enabled']
                    end
                    
                    ##
                    # @return [Hash] The plugin service attributes.
                    def plugin_service_attributes
                        @properties['plugin_service_attributes']
                    end
                    
                    ##
                    # @return [Array<Hash>] A list of objects that contain the configurations for the Integrations supported in this configuration.
                    def integrations
                        @properties['integrations']
                    end
                    
                    ##
                    # @return [Hash] The list of outbound call flows.
                    def outbound_call_flows
                        @properties['outbound_call_flows']
                    end
                    
                    ##
                    # @return [Array<String>] The list of serverless service SIDs.
                    def serverless_service_sids
                        @properties['serverless_service_sids']
                    end
                    
                    ##
                    # @return [Hash] Configurable parameters for Queues Statistics.
                    def queue_stats_configuration
                        @properties['queue_stats_configuration']
                    end
                    
                    ##
                    # @return [Hash] Configurable parameters for Notifications.
                    def notifications
                        @properties['notifications']
                    end
                    
                    ##
                    # @return [Hash] Configurable parameters for Markdown.
                    def markdown
                        @properties['markdown']
                    end
                    
                    ##
                    # @return [String] The absolute URL of the Configuration resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # @return [Hash] Object with enabled/disabled flag with list of workspaces.
                    def flex_insights_hr
                        @properties['flex_insights_hr']
                    end
                    
                    ##
                    # @return [Boolean] Setting this to true will redirect Flex UI to the URL set in flex_url
                    def flex_insights_drilldown
                        @properties['flex_insights_drilldown']
                    end
                    
                    ##
                    # @return [String] URL to redirect to in case drilldown is enabled.
                    def flex_url
                        @properties['flex_url']
                    end
                    
                    ##
                    # @return [Array<Hash>] Settings for different limits for Flex Conversations channels attachments.
                    def channel_configs
                        @properties['channel_configs']
                    end
                    
                    ##
                    # @return [Hash] Configurable parameters for Debugger Integration.
                    def debugger_integration
                        @properties['debugger_integration']
                    end
                    
                    ##
                    # @return [Hash] Configurable parameters for Flex UI Status report.
                    def flex_ui_status_report
                        @properties['flex_ui_status_report']
                    end
                    
                    ##
                    # @return [Hash] Agent conversation end methods.
                    def agent_conv_end_methods
                        @properties['agent_conv_end_methods']
                    end
                    
                    ##
                    # @return [Hash] Citrix voice vdi configuration and settings.
                    def citrix_voice_vdi
                        @properties['citrix_voice_vdi']
                    end
                    
                    ##
                    # @return [Hash] Presence and presence ttl configuration
                    def offline_config
                        @properties['offline_config']
                    end
                    
                    ##
                    # Fetch the ConfigurationInstance
                    # @param [String] ui_version The Pinned UI version of the Configuration resource to fetch.
                    # @return [ConfigurationInstance] Fetched ConfigurationInstance
                    def fetch(
                        ui_version: :unset
                    )

                        context.fetch(
                            ui_version: ui_version, 
                        )
                    end

                    ##
                    # Update the ConfigurationInstance
                    # @param [Object] body 
                    # @return [ConfigurationInstance] Updated ConfigurationInstance
                    def update(body: :unset
                    )

                        context.update(
                        )
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
