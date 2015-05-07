require 'net/http'
require 'net/https'
require 'builder'
require 'multi_json'
require 'cgi'
require 'openssl'
require 'base64'
require 'forwardable'
require 'jwt'

require 'twilio-ruby/version' unless defined?(Twilio::VERSION)
require 'twilio-ruby/util'
require 'twilio-ruby/util/client_config'
require 'twilio-ruby/util/configuration'
require 'twilio-ruby/util/request_validator'
require 'twilio-ruby/util/capability'
require 'twilio-ruby/twiml/response'
require 'twilio-ruby/task_router'
require 'twilio-ruby/task_router/capability'
require 'twilio-ruby/rest/errors'
require 'twilio-ruby/rest/utils'
require 'twilio-ruby/rest/list_resource'
require 'twilio-ruby/rest/next_gen_list_resource'
require 'twilio-ruby/rest/instance_resource'
require 'twilio-ruby/rest/sandbox'
require 'twilio-ruby/rest/accounts'
require 'twilio-ruby/rest/calls'
require 'twilio-ruby/rest/call_feedback'
require 'twilio-ruby/rest/call_feedback_summary'
require 'twilio-ruby/rest/sms'
require 'twilio-ruby/rest/sms/short_codes'
require 'twilio-ruby/rest/sms/messages'
require 'twilio-ruby/rest/sip'
require 'twilio-ruby/rest/sip/domains'
require 'twilio-ruby/rest/sip/domains/ip_access_control_list_mappings'
require 'twilio-ruby/rest/sip/domains/credential_list_mappings'
require 'twilio-ruby/rest/sip/credential_lists'
require 'twilio-ruby/rest/sip/credential_lists/credentials'
require 'twilio-ruby/rest/sip/ip_access_control_lists'
require 'twilio-ruby/rest/sip/ip_access_control_lists/ip_addresses'
require 'twilio-ruby/rest/task_router/statistics'
require 'twilio-ruby/rest/task_router/activities'
require 'twilio-ruby/rest/task_router/events'
require 'twilio-ruby/rest/task_router/reservations'
require 'twilio-ruby/rest/task_router/task_queues'
require 'twilio-ruby/rest/task_router/task_queues_statistics'
require 'twilio-ruby/rest/task_router/tasks'
require 'twilio-ruby/rest/task_router/workers'
require 'twilio-ruby/rest/task_router/workers_statistics'
require 'twilio-ruby/rest/task_router/workflow_statistics'
require 'twilio-ruby/rest/task_router/workflows'
require 'twilio-ruby/rest/task_router/workspaces'
require 'twilio-ruby/rest/task_router/workspace_statistics'
require 'twilio-ruby/rest/lookups/phone_numbers'
require 'twilio-ruby/rest/monitor/events'
require 'twilio-ruby/rest/monitor/alerts'
require 'twilio-ruby/rest/media'
require 'twilio-ruby/rest/messages'
require 'twilio-ruby/rest/applications'
require 'twilio-ruby/rest/connect_apps'
require 'twilio-ruby/rest/authorized_connect_apps'
require 'twilio-ruby/rest/outgoing_caller_ids'
require 'twilio-ruby/rest/incoming_phone_numbers'
require 'twilio-ruby/rest/incoming_phone_numbers/local'
require 'twilio-ruby/rest/incoming_phone_numbers/toll_free'
require 'twilio-ruby/rest/incoming_phone_numbers/mobile'
require 'twilio-ruby/rest/available_phone_numbers'
require 'twilio-ruby/rest/available_phone_numbers/country'
require 'twilio-ruby/rest/available_phone_numbers/local'
require 'twilio-ruby/rest/available_phone_numbers/mobile'
require 'twilio-ruby/rest/available_phone_numbers/toll_free'
require 'twilio-ruby/rest/conferences'
require 'twilio-ruby/rest/conferences/participants'
require 'twilio-ruby/rest/queues'
require 'twilio-ruby/rest/queues/members'
require 'twilio-ruby/rest/usage'
require 'twilio-ruby/rest/usage/records'
require 'twilio-ruby/rest/usage/triggers'
require 'twilio-ruby/rest/recordings'
require 'twilio-ruby/rest/transcriptions'
require 'twilio-ruby/rest/tokens'
require 'twilio-ruby/rest/notifications'
require 'twilio-ruby/rest/addresses'
require 'twilio-ruby/rest/addresses/dependent_phone_numbers'
require 'twilio-ruby/rest/client'
require 'twilio-ruby/rest/task_router_client'
require 'twilio-ruby/rest/lookups_client'
require 'twilio-ruby/rest/pricing_client'
require 'twilio-ruby/rest/monitor_client'
require 'rack/twilio_webhook_authentication'

module Twilio
  extend SingleForwardable

  def_delegators :configuration, :account_sid, :auth_token

  ##
  # Pre-configure with account SID and auth token so that you don't need to
  # pass them to various initializers each time.
  def self.configure(&block)
    yield configuration
  end

  ##
  # Returns an existing or instantiates a new configuration object.
  def self.configuration
    @configuration ||= Util::Configuration.new
  end
  private_class_method :configuration
end
