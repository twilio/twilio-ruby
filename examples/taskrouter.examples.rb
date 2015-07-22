require 'rubygems'
require 'twilio-ruby'
require 'json'

# taskrouter examples version 1
@account_sid = 'YourAccountSid'
@auth_token  = 'YourAuthToken'
@workspace_sid = 'YourWorkspaceSid'

# set up a client
@client = Twilio::REST::TaskRouterClient.new @account_sid, @auth_token, @workspace_sid
puts @client.workspace.sid + ' with ' + @client.workspace.friendly_name

# fetch the list of workers and their status
@client.workspace.workers.list.each do |worker|
  puts worker.friendly_name + ' is available ' + worker.available.to_s
end

# create a task
@workflow_sid = 'YourWorkflowSid'
@task_attributes = '{"foo":"bar"}'
@client.workspace.tasks.create(attributes: @task_attributes, workflow_sid: @workflow_sid)

# list all the tasks created
@client.workspace.tasks.list.each do |task|
  attributes = JSON.parse(task.attributes)
  puts attributes['foo'] + ' with age ' + task.age.to_s
end

# get all the statistics for a workspace
@workspace_stats = @client.workspace.statistics
@cumulative = @workspace_stats.cumulative
puts 'Avg Task Acceptance Time: ' + @cumulative['avg_task_acceptance_time'].to_s + ' with ' + @cumulative['tasks_created'].to_s + ' tasks created'

# build a workflow
@support_queue_sid = 'YourSupportQueueSid'
@marketing_queue_sid = 'YourMarketingQueueSid'
@default_queue_sid = 'YourDefaultQueue'

@support_target = Twilio::TaskRouter::WorkflowRuleTarget.new @support_queue_sid
@support_targets = [@support_target]
@support_rule = Twilio::TaskRouter::WorkflowRule.new 'type == support', @support_targets

@marketing_target = Twilio::TaskRouter::WorkflowRuleTarget.new @marketing_queue_sid
@marketing_targets = [@marketing_target]
@marketing_rule = Twilio::TaskRouter::WorkflowRule.new 'type == support', @marketing_targets

@rules = [@support_rule, @marketing_rule]
@default_target = Twilio::TaskRouter::WorkflowRuleTarget.new @default_queue_sid

@config = Twilio::TaskRouter::WorkflowConfiguration.new @rules, @default_target
puts @config.to_json

@workflowCreated = @client.workspace.workflows.create(configuration: @config.to_json, friendly_name: 'MyWorkflow2', assignment_callback_url: 'http://example.com')
@workflowFetched = @client.workspace.workflows.get(@workflowCreated.sid)

@config_string = @workflowFetched.configuration
@config_obj = Twilio::TaskRouter::WorkflowConfiguration.parse_json(@config_string)

puts @config_string
puts @config_obj.rules[0].expression
puts @config_obj.default_target.queue
