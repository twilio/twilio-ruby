.. module:: twilio.rest.taskrouter

==========
TaskRouter
==========

Twilio TaskRouter is a system for distributing tasks such as phone calls,
leads, support tickets, and other work items to the people and processes that
can best handle them.

For more information, see the `TaskRouter documentation
<https://www.twilio.com/docs/taskrouter>_`.

Note: Passed in Form/Query Parameters are based on their json equivalent attribute.

Workspaces
--------------------

A Workspace is a container for your Tasks, Workers, TaskQueues, Workflows and
Activities. Each of these items exists within a single Workspace and will not
be shared across Workspaces.

.. code-block:: ruby

    require 'twilio-ruby'

    # To find these visit https://www.twilio.com/user/account
    ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXX"
    AUTH_TOKEN = "YYYYYYYYYYYYYYYYYY"

    @client = Twilio::REST::Client.new.new ACCOUNT_SID, AUTH_TOKEN

    # creating a workspace
    @workspace = @client.taskrouter.workspaces.create(
        friendly_name: "Customer Support",
        template: "FIFO",  # Sets up default activities and a FIFO TaskQueue
    )

    workspace_sid = @workspace.sid

    # fetching a workspace
    @workspace = @client.taskrouter.workspace(workspace_sid)
    puts @workspace.sid
    puts @workspace.friendly_name

    # fetching a list of workspaces
    @client.taskrouter.workspaces.list().each do |workspace|
      puts workspace.friendly_name
    end

    # updating a workspace
    @client.taskrouter.workspace(workspace_sid).update(friendly_name: 'MyWorkspace2')

    # deleting a workspace
    @client.taskrouter.workspace(workspace_sid).delete()


Workflows
---------

Workflows control how tasks will be prioritized and routed into TaskQueues, and
how Tasks should escalate in priority or move across queues over time.
Workflows are described in a simple JSON format and can be modified through the
REST API or through the account portal.

Creating a Workflow
--------------------

The following code will create a new :class:`Workflow` resource and print its
unique ID:

.. code-block:: ruby

    require 'twilio-ruby'

    # To find these visit https://www.twilio.com/user/account
    ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXX"
    AUTH_TOKEN = "YYYYYYYYYYYYYYYYYY"

    # See previous examples to create a Workspace
    WORKSPACE_SID = "WSZZZZZZZZZZZZZZ"

    # Some JSON to configure the Workflow. See the documentation at
    # http://www.twilio.com/docs/taskrouter for more details.
    CONFIG = <<-EOS
    {
       "task_routing":{
          "filters":[
             {
                "friendly_name":"Gold Tickets",
                "expression":"customer_value == 'Gold' AND type == 'ticket'",
                "targets":[
                   {
                      "queue":"YourGoldTicketQueueSid",
                      "priority":"2"
                   }
                ]
             }
          ],
          "default_filter":{
             "queue":"YourDefaultQueueSid"
          }
       }
    }
    EOS

    @client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN

    @workflow = @client.taskrouter.workspace(WORKSPACE_SID).workflows.create(
        friendly_name: "Incoming Call Flow",
        assignment_callback_url: "https://example.com/callback",
        fallback_assignment_callback_url: "https://example.com/callback2",
        configuration: CONFIG
    )
    puts @workflow.sid

You can also utilize our Workflow Builder to make this process a bit easier utilizing objects:

.. code-block:: ruby

    require twilio-ruby

    # To find these visit https://www.twilio.com/user/account
    ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXX"
    AUTH_TOKEN = "YYYYYYYYYYYYYYYYYY"

    # See previous examples to create a Workspace
    WORKSPACE_SID = "WSZZZZZZZZZZZZZZ"

    @client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN

    gold_ticket_queue_sid = 'YourGoldTicketQueueSid'
    default_queue_sid = 'YourDefaultQueueSid'

    def rule_target(sid)
      { queue: sid, priority: 5, timeout: QUEUE_TIMEOUT }
    end

    def default_rule_target(sid)
        {
          queue: sid,
          priority: 1,
          timeout: QUEUE_TIMEOUT,
          expression: '1==1'
        }
    end

    default_target = default_rule_target(default_queue_sid)

    config = {
      task_routing: {
        filters: [
          {
            expression: 'customer_value == "Gold" AND type == "ticket"', gold_ticket_targets, 'Gold Tickets',
            targets: [
              rule_target(gold_ticket_queue_sid),
              default_target
            ]
          },
          {
            expression: 'selected_product=="ProgrammableSMS"',
            targets: [
              rule_target(queues[:sms].sid),
              default_target
            ]
          }
        ],
        default_filter: default_target
      }
    }

    puts @config.to_json


    @workflow = @client.workspace.workflows.create(
      configuration: @config.to_json,
      friendly_name: 'Incoming Call Flow',
      assignment_callback_url: 'https://example.com/callback',
      fallback_assignment_callback_url: 'https://example.com/callback2'
    )

    puts @workflow.sid

Fetching, Updating, Deleting Workflows
--------------------

.. code-block:: ruby

    require twilio-ruby

    # To find these visit https://www.twilio.com/user/account
    ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXX"
    AUTH_TOKEN = "YYYYYYYYYYYYYYYYYY"

    # See previous examples to create a Workspace
    WORKSPACE_SID = "WSZZZZZZZZZZZZZZ"
    WORKFLOW_SID = "WFZZZZZZZZZZZZZZZ"

    # fetching a workflow
    @client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN
    @workflow = @client.taskrouter.workspace(WORKSPACE_SID).workflows(WORKFLOW_SID).fetch()

    puts @workflow.sid
    puts @workflow.friendly_name

    # fetching a list of workflows
    @client.taskrouter.workspace(WORKSPACE_SID).workflows.list().each do |workflow|
      puts workflow.friendly_name
    end

    # updating a workflow
    @workflow.update(friendly_name: 'NewWorkflowName')

    # deleting a workflow
    @workflow.delete

Activities
----------

Activities describe the current status of your Workers, which determines
whether they are eligible to receive task assignments. Workers are always set
to a single Activity.

.. code-block:: ruby

    require 'twilio-ruby'

    # To find these visit https://www.twilio.com/user/account
    ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXX"
    AUTH_TOKEN = "YYYYYYYYYYYYYYYYYY"

    # See previous examples to create a Workspace
    WORKSPACE_SID = "WSZZZZZZZZZZZZZZ"

    @client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN

    # creating an activity
    @activity = @client.taskrouter.workspaces(WORKSPACE_SID).activities.create(
        friendly_name: "Coffee Break",
        available: false  # Whether workers are available to handle tasks during this activity
    )
    puts @activity.sid

    # fetching a list of activities
    @client.taskrouter.workspaces(WORKSPACE_SID).activities.list().each do |activity|
      puts activity.friendly_name
    end

    # fetching an activity
    ACTIVITY_SID = "WAZZZZZZZZZZZZZZZZZ"
    @activity = @client.taskrouter.workspaces(WORKSPACE_SID).activities(ACTIVITY_SID).fetch()

    # updating an activity
    @activity.update(friendly_name: 'NewFriendlyName')

    # deleting an activity
    @activity.delete

Workers
-------

Workers represent an entity that is able to perform tasks, such as an agent
working in a call center, or a salesperson handling leads.

.. code-block:: ruby

    require 'twilio-ruby'

    # To find these visit https://www.twilio.com/user/account
    ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXX"
    AUTH_TOKEN = "YYYYYYYYYYYYYYYYYY"

    # See previous examples to create a Workspace
    WORKSPACE_SID = "WSZZZZZZZZZZZZZZ"

    @client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN

    # creating a worker
    @worker = @client.taskrouter.workspace(WORKSPACE_SID).workers.create(
        friendly_name:"Jamie",
        attributes:'{"phone": "+14155551234", "languages": ["EN", "ES"]}'
    )
    puts @worker.sid

    # fetching a list of workers
    @client.taskrouter.workspace(WORKSPACE_SID).workers.list().each do |worker|
      puts worker.friendly_name
    end

    # fetching a list of workers based on activity
    @client.taskrouter.workspace(WORKSPACE_SID).workers.list(activity_name: 'Offline').each do |worker|
      puts worker.friendly_name + ' is offline'
    end

    # fetching an worker
    WORKER_SID = "WKZZZZZZZZZZZZZZZZZ"
    @worker = @client.taskrouter.workspace.workers(WORKER_SID).fetch()

    # updating an worker
    @worker.update(friendly_name: 'NewFriendlyName')

    # deleting an worker
    @worker.delete


TaskQueues
----------

TaskQueues are the resource you use to categorize Tasks and describe which
Workers are eligible to handle those Tasks. As your Workflows process Tasks,
those Tasks will pass through one or more TaskQueues until the Task is assigned
and accepted by an eligible Worker.

.. code-block:: ruby

    require 'twilio-ruby'

    # To find these visit https://www.twilio.com/user/account
    ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXX"
    AUTH_TOKEN = "YYYYYYYYYYYYYYYYYY"

    # See previous examples to create a Workspace
    WORKSPACE_SID = "WSZZZZZZZZZZZZZZ"

    @client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN

    # creating a task_queue
    @taskqueue = @client.taskrouter.workspace(WORKSPACE_SID).task_queues.create(
        friendly_name: "Sales",
        # The Activity to assign workers when a task is reserved for them
        reservation_activity_sid: "WA11111111111",
        # The Activity to assign workers when a task is assigned to them
        assignment_activity_sid: "WA222222222222",
    )
    puts @taskqueue.sid

     # fetching a list of task_queues
    @client.taskrouter.workspace(WORKSPACE_SID).task_queues.list().each do |task_queue|
      puts task_queue.friendly_name
    end

    # fetching an taskqueue
    TASK_QUEUE_SID = "WQZZZZZZZZZZZZZZZZZ"
    @taskqueue = @client.taskrouter.workspace(WORKSPACE_SID).task_queues(TASK_QUEUE_SID).fetch()

    # updating an taskqueue
    @taskqueue.update(friendly_name: 'NewFriendlyName')

    # deleting an taskqueue
    @taskqueue.delete


Tasks
-----

A Task instance resource represents a single item of work waiting to be
processed.

.. code-block:: ruby

    # To find these visit https://www.twilio.com/user/account
    ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXX"
    AUTH_TOKEN = "YYYYYYYYYYYYYYYYYY"

    # See previous examples to create a Workspace
    WORKSPACE_SID = "WSZZZZZZZZZZZZZZ"

    @client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN

    # Some JSON containing attributes for this task. User-defined.
    TASK_ATTRIBUTES = <<-EOS
    {
         "type": "call",
         "contact": "+15558675309",
         "customer-value": "gold",
         "task-reason": "support",
         "callSid": "CA42ed11..."
    }
    EOS

    # creating a task
    @task = @client.taskrouter.workspace(WORKSPACE_SID).tasks.create(
        attributes: TASK_ATTRIBUTES,
        assignment_status: 'pending',
    )
    puts @task.sid

    # fetching a list of tasks
    @client.taskrouter.workspace(WORKSPACE_SID).tasks.list().each do |task|
      puts task.sid
    end

    # fetching a list of tasks that are pending
    @client.taskrouter.workspace(WORKSPACE_SID).tasks.list(assignment_status: 'pending').each do |task|
      puts task.sid
    end

    # fetching an task
    TASK_SID = "WTZZZZZZZZZZZZZZZZZ"
    @task = @client.taskrouter.workspace(WORKSPACE_SID).tasks(TASK_SID).fetch()

    # updating an task
    @task.update(friendly_name: 'NewFriendlyName')

    # deleting an task
    @task.delete

Reservations
-----

A Reservation instance resource represents a single matching item of work from a task to a worker.

.. code-block:: ruby

    # To find these visit https://www.twilio.com/user/account
    ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXX"
    AUTH_TOKEN = "YYYYYYYYYYYYYYYYYY"

    # See previous examples to create a Workspace
    WORKSPACE_SID = "WSZZZZZZZZZZZZZZ"

    @client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN

    # fetching an task
    TASK_SID = "WTZZZZZZZZZZZZZZZZZ"
    @task = @client.taskrouter.workspace(WORKSPACE_SID).tasks(TASK_SID).fetch()

    # fetching reservations for said task
    @task.reservations.list().each do |reservation|
        puts reservation.sid
    end

Statistics
-----

A Statistics resource represents the statistics over a time period for a particular resource

.. code-block:: ruby

    # To find these visit https://www.twilio.com/user/account
    ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXX"
    AUTH_TOKEN = "YYYYYYYYYYYYYYYYYY"

    # See previous examples to create a Workspace
    WORKSPACE_SID = "WSZZZZZZZZZZZZZZ"

    @client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN

    # fetching statistics based on the last 4 hours
    @workspace_stats = @client.taskrouter.workspace(WORKSPACE_SID).statistics(minutes: '240')
    @cumulative = @workspace_stats.cumulative
    puts 'Avg Task Acceptance Time: ' + @cumulative['avg_task_acceptance_time'].to_s \
         + ' with ' + @cumulative['tasks_created'].to_s + ' tasks created'

Events
-----

A Event represents an internal TaskRouter event that occurred and has been logged.
You can query based on time the event occurred, a certain resource or combination.

.. code-block:: ruby

    # To find these visit https://www.twilio.com/user/account
    ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXX"
    AUTH_TOKEN = "YYYYYYYYYYYYYYYYYY"

    # See previous examples to create a Workspace
    WORKSPACE_SID = "WSZZZZZZZZZZZZZZ"

    @client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN

    # fetching events for a workspace for the last 15 minutes
    @events = @client.taskrouter.workspace.events.list(minutes: '15')
    @events.each do |event|
      puts event.event_type + ' at ' + event.event_date
    end
