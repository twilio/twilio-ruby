require 'rubygems'
require 'twilio-ruby'

# taskrouter examples version 1
account_sid = 'YourAccountSid'
auth_token  = 'YourAuthToken'
workspace_sid = 'YourWorkspaceSid'

# set up a client
client = Twilio::REST::TaskRouterClient.new account_sid, auth_token, workspace_sid
puts client.workspace.sid + ' with ' + client.workspace.friendly_name

client.workspace.update(friendly_name: 'MyWorkspace2')

# fetch the list of workers and their status
client.workspace.workers.list.each do |worker|
  puts worker.friendly_name + ' is available ' + worker.available.to_s
end

# fetch the list of workers and their status
client.workspace.workers.list(activity_name: 'Offline').each do |worker|
  puts worker.friendly_name + ' is available ' + worker.available.to_s
end

# create a task
workflow_sid = 'YourWorkflowSid'
task = client.workspace.tasks.create(attributes: '{"foo":"bar"}', workflow_sid: workflow_sid)

# list all the tasks created
client.workspace.tasks.list.each do |task|
  attributes = JSON.parse(task.attributes)
  puts attributes['foo'] + ' with age ' + task.age.to_s
  task.reservations.list.each do |reservation|
    puts reservation.sid
  end
end

# fetching a list of tasks that are pending
client.workspace.tasks.list(assignment_status: 'pending').each do |task|
  puts 'pending task ' + task.sid
end

# delete all tasks
client.workspace.tasks.list.each do |task|
  puts 'deleting task ' + task.sid
  task.delete
end

# get all the statistics for a workspace
workspace_stats = client.workspace.statistics(minutes: '240')
cumulative = workspace_stats.cumulative
puts 'Avg Task Acceptance Time: ' + cumulative['avg_task_acceptance_time'].to_s \
      + ' with ' + cumulative['tasks_created'].to_s + ' tasks created'

# get events for a workspace
events = client.workspace.events.list(minutes: '15')
events.each do |event|
  puts event.event_type + ' at ' + event.event_date
end

# build a workflow
support_queue_sid = 'YourSupportQueueSid'
marketing_queue_sid = 'YourMarketingQueueSid'
default_queue_sid = 'YourDefaultQueue'

support_targets = [Twilio::TaskRouter::WorkflowRuleTarget.new support_queue_sid]
support_rule = Twilio::TaskRouter::WorkflowRule.new 'type == "support"', support_targets

marketing_targets = [Twilio::TaskRouter::WorkflowRuleTarget.new marketing_queue_sid]
marketing_rule = Twilio::TaskRouter::WorkflowRule.new 'type == "marketing"', marketing_targets

rules = [support_rule, marketing_rule]
default_target = Twilio::TaskRouter::WorkflowRuleTarget.new default_queue_sid

config = Twilio::TaskRouter::WorkflowConfiguration.new rules, default_target
puts config.to_json

workflowCreated = client.workspace.workflows.create(configuration: config.to_json, friendly_name: 'MyWorkflow2', assignment_callback_url: 'http://example.com')
workflowFetched = client.workspace.workflows.get(workflowCreated.sid)

config_string = workflowFetched.configuration
config_obj = Twilio::TaskRouter::WorkflowConfiguration.parse_json(config_string)

puts config_string
puts config_obj.rules[0].expression
puts config_obj.default_target.queue
