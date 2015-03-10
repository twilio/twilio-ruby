.. module:: twilio.rest.resources.task_router

==========
TaskRouter
==========

Twilio TaskRouter is a system for distributing tasks such as phone calls,
leads, support tickets, and other work items to the people and processes that
can best handle them.

For more information, see the `TaskRouter documentation
<https://www.twilio.com/docs/taskrouter>_`.


Creating a Workspace
--------------------

A Workspace is a container for your Tasks, Workers, TaskQueues, Workflows and
Activities. Each of these items exists within a single Workspace and will not
be shared across Workspaces.

The following code will create a new :class:`Workspace` resource and print
its unique ID.

.. code-block:: ruby

    require 'twilio-ruby'

    # To find these visit https://www.twilio.com/user/account
    ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXX"
    AUTH_TOKEN = "YYYYYYYYYYYYYYYYYY"
    # You can create a workspace through the portal, or put a fake value
    # here to create your first workspace with the Ruby library
    WORKSPACE_SID = "WSZZZZZZZZZ"

    @client = Twilio::REST::TaskRouterClient.new ACCOUNT_SID, AUTH_TOKEN, WORKSPACE_SID

    @workspace = @client.workspaces.create(
        friendly_name: "Customer Support",
        template: "FIFO",  # Sets up default activities and a FIFO TaskQueue
    )
    puts @workspace.sid


Workflows
---------

Workflows control how tasks will be prioritized and routed into TaskQueues, and
how Tasks should escalate in priority or move across queues over time.
Workflows are described in a simple JSON format and can be modified through the
REST API or through the account portal.

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
                      "task_queue_sid":"WQ0123456789abcdef0123456789abcdef",
                      "priority":"2"
                   }
                ]
             }
          ],
          "default_filter":{
             "task_queue_sid":"WQabcdef01234567890123456789abcdef"
          }
       }
    }
    EOS

    @client = Twilio::REST::TaskRouterClient.new ACCOUNT_SID, AUTH_TOKEN, WORKSPACE_SID

    @workspace = @client.workflows.create(
        friendly_name: "Incoming Call Flow",
        assignment_callback_url: "https://example.com/callback",
        fallback_assignment_callback_url: "https://example.com/callback2",
        configuration: CONFIG
    )
    puts @workspace.sid


Activities
----------

Activities describe the current status of your Workers, which determines
whether they are eligible to receive task assignments. Workers are always set
to a single Activity.

To create a new :class:`Activity`:

.. code-block:: ruby

    require 'twilio-ruby'

    # To find these visit https://www.twilio.com/user/account
    ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXX"
    AUTH_TOKEN = "YYYYYYYYYYYYYYYYYY"

    # See previous examples to create a Workspace
    WORKSPACE_SID = "WSZZZZZZZZZZZZZZ"

    @client = Twilio::REST::TaskRouterClient.new ACCOUNT_SID, AUTH_TOKEN, WORKSPACE_SID

    @activity = @client.activities.create(
        friendly_name: "Coffee Break",
        available: false  # Whether workers are available to handle tasks during this activity
    )
    puts @activity.sid


Workers
-------

Workers represent an entity that is able to perform tasks, such as an agent
working in a call center, or a salesperson handling leads.

To create a new :class:`Worker`:

.. code-block:: ruby

    require 'twilio-ruby'

    # To find these visit https://www.twilio.com/user/account
    ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXX"
    AUTH_TOKEN = "YYYYYYYYYYYYYYYYYY"

    # See previous examples to create a Workspace
    WORKSPACE_SID = "WSZZZZZZZZZZZZZZ"

    @client = Twilio::REST::TaskRouterClient.new ACCOUNT_SID, AUTH_TOKEN, WORKSPACE_SID

    @worker = @client.workers.create(
        friendly_name:"Jamie",
        attributes:'{"phone": "+14155551234", "languages": ["EN", "ES"]}'
    )
    puts @worker.sid


TaskQueues
----------

TaskQueues are the resource you use to categorize Tasks and describe which
Workers are eligible to handle those Tasks. As your Workflows process Tasks,
those Tasks will pass through one or more TaskQueues until the Task is assigned
and accepted by an eligible Worker.

To create a new :class:`TaskQueue`:

.. code-block:: ruby

    require 'twilio-ruby'

    # To find these visit https://www.twilio.com/user/account
    ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXX"
    AUTH_TOKEN = "YYYYYYYYYYYYYYYYYY"

    # See previous examples to create a Workspace
    WORKSPACE_SID = "WSZZZZZZZZZZZZZZ"

    @client = Twilio::REST::TaskRouterClient.new ACCOUNT_SID, AUTH_TOKEN, WORKSPACE_SID

    @queue = @client.task_queues.create(
        friendly_name: "Sales",
        # The Activity to assign workers when a task is reserved for them
        reservation_activity_sid: "WA11111111111",
        # The Activity to assign workers when a task is assigned to them
        assignment_activity_sid: "WA222222222222",
    )
    puts @queue.sid


Tasks
-----

A Task instance resource represents a single item of work waiting to be
processed.

To create a new :class:`Task` via the REST API:

.. code-block:: ruby

    # To find these visit https://www.twilio.com/user/account
    ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXX"
    AUTH_TOKEN = "YYYYYYYYYYYYYYYYYY"

    # See previous examples to create a Workspace
    WORKSPACE_SID = "WSZZZZZZZZZZZZZZ"

    @client = Twilio::REST::TaskRouterClient.new ACCOUNT_SID, AUTH_TOKEN, WORKSPACE_SID

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

    @task = @client.create(
        attributes: TASK_ATTRIBUTES,
        assignment_status: 'pending',
    )
    puts @task.sid
