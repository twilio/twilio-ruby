require 'rubygems'
require 'twilio-ruby'
require 'json'

# taskrouter examples version 1
@account_sid = 'AC9242e2195ab0681fd413fc3c03b7d7f8'
@auth_token  = '3706b85b34b688189f9a47bf393752cc'
@workspace_sid = 'WS0b37cb82ee097132c15cc5295dbe42a1'

# set up a client
@client = Twilio::REST::TaskRouterClient.new @account_sid, @auth_token, @workspace_sid
puts @client.workspace.sid + ' with ' + @client.workspace.friendly_name

# fetch the list of workers and their status
@client.workspace.workers.list.each do |worker|
  puts worker.friendly_name + ' is available ' + worker.available.to_s
end

# create a task
@workflow_sid = 'WW71cfb6c66ac8be88a5f78b527f66c9aa'
@task_attributes = '{"foo":"bar"}'
@client.workspace.tasks.create(attributes: @task_attributes, workflow_sid: @workflow_sid)

# list all the tasks created
@client.workspace.tasks.list.each do |task|
  attributes = JSON.parse(task.attributes)
  puts attributes['foo'] + ' with age ' + task.age.to_s
end

# get all the statistics for a workspace
@workspaceStats = @client.workspace.statistics
@cumulative = @workspaceStats.cumulative
puts 'Avg Task Acceptance Time: ' + @cumulative['avg_task_acceptance_time'].to_s + ' with ' + @cumulative['tasks_created'].to_s + ' tasks created'
