require 'spec_helper'

describe Twilio::TaskRouter::WorkflowConfiguration do
  describe 'with a workflow builder' do

    it 'should construct a default rule target' do
      everyoneQueue = 'WQf6724bd5005b30eeb6ea990c3e59e536'
      defaultTarget = Twilio::TaskRouter::WorkflowRuleTarget.new everyoneQueue
      expect(defaultTarget.queue).to eq(everyoneQueue)
      expect(defaultTarget.priority).to be_nil
      expect(defaultTarget.timeout).to be_nil
      expect(defaultTarget.expression).to be_nil
    end

    it 'should construct a simple rule target' do
      everyoneQueue = 'WQf6724bd5005b30eeb6ea990c3e59e536'
      priority = 10
      timeout = 60
      defaultTarget = Twilio::TaskRouter::WorkflowRuleTarget.new everyoneQueue, priority, timeout
      expect(defaultTarget.queue).to eq(everyoneQueue)
      expect(defaultTarget.priority).to eq(priority)
      expect(defaultTarget.timeout).to eq(timeout)
      expect(defaultTarget.expression).to be_nil
    end

    it 'should construct a worker filter rule target' do
      everyoneQueue = 'WQf6724bd5005b30eeb6ea990c3e59e536'
      priority = 10
      timeout = 60
      filterWorkerExpression = "task.language IN worker.languages";
      defaultTarget = Twilio::TaskRouter::WorkflowRuleTarget.new everyoneQueue, priority, timeout, filterWorkerExpression
      expect(defaultTarget.queue).to eq(everyoneQueue)
      expect(defaultTarget.priority).to eq(priority)
      expect(defaultTarget.timeout).to eq(timeout)
      expect(defaultTarget.expression).to eq(filterWorkerExpression)
    end

    it 'should construct simple rule' do
      salesQueue = "WQf6724bd5005b30eeb6ea990c3e59e536"
      salesTarget = Twilio::TaskRouter::WorkflowRuleTarget.new salesQueue
      expression = "type=='sales'"
      friendlyName = "Sales"
      salesTargets = [salesTarget]
      salesRule = Twilio::TaskRouter::WorkflowRule.new expression, salesTargets, friendlyName
      expect(salesRule.expression).to eq(expression)
      expect(salesRule.friendly_name).to eq(friendlyName)
      expect(salesRule.targets[0]).to eq(salesTarget)
    end

    it 'should construct a full workflow' do
      salesQueue = "WQf6724bd5005b30eeb6ea990c3e59e536"
      marketingQueue = "WQ8c62f84b61ccfa6a333757cd508f0aae"
      supportQueue = "WQ5940dc0da87eaf6e3321d62041d4403b"
      everyoneQueue = "WQ6d29383312b24bd898a8df32779fc043"

      defaultTarget = Twilio::TaskRouter::WorkflowRuleTarget.new everyoneQueue

      salesTarget = Twilio::TaskRouter::WorkflowRuleTarget.new salesQueue
      salesRule = Twilio::TaskRouter::WorkflowRule.new "type=='sales'", [salesTarget], 'Sales'

      marketingTarget = Twilio::TaskRouter::WorkflowRuleTarget.new marketingQueue
      marketingRule = Twilio::TaskRouter::WorkflowRule.new "type=='marketing'", [marketingTarget], 'Marketing'

      supportTarget = Twilio::TaskRouter::WorkflowRuleTarget.new supportQueue
      supportRule = Twilio::TaskRouter::WorkflowRule.new "type=='support'", [supportTarget], 'Support'

      rules = [salesRule, marketingRule, supportRule]

      config = Twilio::TaskRouter::WorkflowConfiguration.new rules, defaultTarget
      json = config.to_json

      expected = "{
        \"task_routing\":{
          \"filters\":[
           {
            \"expression\":\"type=='sales'\",
            \"targets\":[
               {
                \"queue\":\"WQf6724bd5005b30eeb6ea990c3e59e536\"
               }
            ],
            \"friendly_name\":\"Sales\"
           },
           {
            \"expression\":\"type=='marketing'\",
            \"targets\":[
               {
                \"queue\":\"WQ8c62f84b61ccfa6a333757cd508f0aae\"
               }
            ],
            \"friendly_name\":\"Marketing\"
           },
           {
            \"expression\":\"type=='support'\",
            \"targets\":[
               {
                \"queue\":\"WQ5940dc0da87eaf6e3321d62041d4403b\"
               }
            ],
            \"friendly_name\":\"Support\"
           }
          ],
          \"default_filter\":{
           \"queue\":\"WQ6d29383312b24bd898a8df32779fc043\"
          }
        }
      }"

      expected = JSON.parse(expected).to_json

      expect(expected).to eq(json)
    end

    it 'should construct a full workflow with timeouts' do
      salesQueue = "WQf6724bd5005b30eeb6ea990c3e59e536"
      marketingQueue = "WQ8c62f84b61ccfa6a333757cd508f0aae"
      supportQueue = "WQ5940dc0da87eaf6e3321d62041d4403b"
      everyoneQueue = "WQ6d29383312b24bd898a8df32779fc043"

      defaultTarget = Twilio::TaskRouter::WorkflowRuleTarget.new everyoneQueue

      salesTarget1 = Twilio::TaskRouter::WorkflowRuleTarget.new salesQueue, 5, 30
      salesTarget2 = Twilio::TaskRouter::WorkflowRuleTarget.new salesQueue, 10
      salesRule = Twilio::TaskRouter::WorkflowRule.new "type=='sales'", [salesTarget1, salesTarget2], 'Sales'

      marketingTarget1 = Twilio::TaskRouter::WorkflowRuleTarget.new marketingQueue, 1, 120
      marketingTarget2 = Twilio::TaskRouter::WorkflowRuleTarget.new marketingQueue, 3
      marketingRule = Twilio::TaskRouter::WorkflowRule.new "type=='marketing'", [marketingTarget1, marketingTarget2], 'Marketing'

      supportTarget1 = Twilio::TaskRouter::WorkflowRuleTarget.new supportQueue, 10, 30
      supportTarget2 = Twilio::TaskRouter::WorkflowRuleTarget.new supportQueue, 15
      supportRule = Twilio::TaskRouter::WorkflowRule.new "type=='support'", [supportTarget1, supportTarget2], 'Support'

      rules = [salesRule, marketingRule, supportRule]

      config = Twilio::TaskRouter::WorkflowConfiguration.new rules, defaultTarget
      json = config.to_json

      expected = "{
        \"task_routing\":{
          \"filters\":[
           {
            \"expression\":\"type=='sales'\",
            \"targets\":[
               {
                \"queue\":\"WQf6724bd5005b30eeb6ea990c3e59e536\",
                \"priority\": 5,
                \"timeout\": 30
               },
               {
                \"queue\":\"WQf6724bd5005b30eeb6ea990c3e59e536\",
                \"priority\": 10
               }
            ],
            \"friendly_name\":\"Sales\"
           },
           {
            \"expression\":\"type=='marketing'\",
            \"targets\":[
               {
                \"queue\":\"WQ8c62f84b61ccfa6a333757cd508f0aae\",
                \"priority\": 1,
                \"timeout\": 120
               },
               {
                \"queue\":\"WQ8c62f84b61ccfa6a333757cd508f0aae\",
                \"priority\": 3
               }
            ],
            \"friendly_name\":\"Marketing\"
           },
           {
            \"expression\":\"type=='support'\",
            \"targets\":[
               {
                \"queue\":\"WQ5940dc0da87eaf6e3321d62041d4403b\",
                \"priority\": 10,
                \"timeout\": 30
               },
               {
                \"queue\":\"WQ5940dc0da87eaf6e3321d62041d4403b\",
                \"priority\": 15
               }
            ],
            \"friendly_name\":\"Support\"
           }
          ],
          \"default_filter\":{
           \"queue\":\"WQ6d29383312b24bd898a8df32779fc043\"
          }
        }
      }";

      expected = JSON.parse(expected).to_json

      expect(expected).to eq(json)
    end

    it 'should be able to parse the workflow' do
      json = "{
        \"task_routing\":{
          \"filters\":[
           {
            \"expression\":\"type=='sales'\",
            \"targets\":[
               {
                \"queue\":\"WQf6724bd5005b30eeb6ea990c3e59e536\",
                \"priority\": 5,
                \"timeout\": 30
               },
               {
                \"queue\":\"WQf6724bd5005b30eeb6ea990c3e59e536\",
                \"priority\": 10
               }
            ],
            \"friendly_name\":\"Sales\"
           },
           {
            \"expression\":\"type=='marketing'\",
            \"targets\":[
               {
                \"queue\":\"WQ8c62f84b61ccfa6a333757cd508f0aae\",
                \"priority\": 1,
                \"timeout\": 120
               },
               {
                \"queue\":\"WQ8c62f84b61ccfa6a333757cd508f0aae\",
                \"priority\": 3
               }
            ],
            \"friendly_name\":\"Marketing\"
           },
           {
            \"expression\":\"type=='support'\",
            \"targets\":[
               {
                \"queue\":\"WQ5940dc0da87eaf6e3321d62041d4403b\",
                \"priority\": 10,
                \"timeout\": 30
               },
               {
                \"queue\":\"WQ5940dc0da87eaf6e3321d62041d4403b\",
                \"priority\": 15
               }
            ],
            \"friendly_name\":\"Support\"
           }
          ],
          \"default_filter\":{
           \"queue\":\"WQ6d29383312b24bd898a8df32779fc043\"
          }
        }
      }"

      config = Twilio::TaskRouter::WorkflowConfiguration.parse_json(json)

      expect(config.rules.length).to eq(3)
      expect(config.default_target).to_not be_nil
      # sales assertions
      expect(config.rules[0].expression).to eq("type=='sales'")
      expect(config.rules[0].friendly_name).to eq("Sales")
      expect(config.rules[0].targets.length).to eq(2)
      expect(config.rules[0].targets[0].queue).to eq("WQf6724bd5005b30eeb6ea990c3e59e536")
      expect(config.rules[0].targets[0].priority).to eq(5)
      expect(config.rules[0].targets[0].timeout).to eq(30)
      expect(config.rules[0].targets[1].queue).to eq("WQf6724bd5005b30eeb6ea990c3e59e536")
      expect(config.rules[0].targets[1].priority).to eq(10)
      # marketing assertions
      expect(config.rules[1].expression).to eq("type=='marketing'")
      expect(config.rules[1].friendly_name).to eq("Marketing")
      expect(config.rules[1].targets.length).to eq(2)
      expect(config.rules[1].targets[0].queue).to eq("WQ8c62f84b61ccfa6a333757cd508f0aae")
      expect(config.rules[1].targets[0].priority).to eq(1)
      expect(config.rules[1].targets[0].timeout).to eq(120)
      expect(config.rules[1].targets[1].queue).to eq("WQ8c62f84b61ccfa6a333757cd508f0aae")
      expect(config.rules[1].targets[1].priority).to eq(3)
      # support assertions
      expect(config.rules[2].expression).to eq("type=='support'")
      expect(config.rules[2].friendly_name).to eq("Support")
      expect(config.rules[2].targets.length).to eq(2)
      expect(config.rules[2].targets[0].queue).to eq("WQ5940dc0da87eaf6e3321d62041d4403b")
      expect(config.rules[2].targets[0].priority).to eq(10)
      expect(config.rules[2].targets[0].timeout).to eq(30)
      expect(config.rules[2].targets[1].queue).to eq("WQ5940dc0da87eaf6e3321d62041d4403b")
      expect(config.rules[2].targets[1].priority).to eq(15)
      # default filter
      expect(config.default_target.queue).to eq("WQ6d29383312b24bd898a8df32779fc043")
    end

    it 'should be able to parse the workflow with filter friendly name' do
      json = "{
        \"task_routing\":{
          \"filters\":[
           {
            \"expression\":\"type=='sales'\",
            \"targets\":[
               {
                \"queue\":\"WQf6724bd5005b30eeb6ea990c3e59e536\",
                \"priority\": 5,
                \"timeout\": 30
               },
               {
                \"queue\":\"WQf6724bd5005b30eeb6ea990c3e59e536\",
                \"priority\": 10
               }
            ],
            \"filter_friendly_name\":\"Sales\"
           },
           {
            \"expression\":\"type=='marketing'\",
            \"targets\":[
               {
                \"queue\":\"WQ8c62f84b61ccfa6a333757cd508f0aae\",
                \"priority\": 1,
                \"timeout\": 120
               },
               {
                \"queue\":\"WQ8c62f84b61ccfa6a333757cd508f0aae\",
                \"priority\": 3
               }
            ],
            \"filter_friendly_name\":\"Marketing\"
           },
           {
            \"expression\":\"type=='support'\",
            \"targets\":[
               {
                \"queue\":\"WQ5940dc0da87eaf6e3321d62041d4403b\",
                \"priority\": 10,
                \"timeout\": 30
               },
               {
                \"queue\":\"WQ5940dc0da87eaf6e3321d62041d4403b\",
                \"priority\": 15
               }
            ],
            \"filter_friendly_name\":\"Support\"
           }
          ],
          \"default_filter\":{
           \"queue\":\"WQ6d29383312b24bd898a8df32779fc043\"
          }
        }
      }"

      config = Twilio::TaskRouter::WorkflowConfiguration.parse_json(json)

      expect(config.rules.length).to eq(3)
      expect(config.default_target).to_not be_nil
      # sales assertions
      expect(config.rules[0].expression).to eq("type=='sales'")
      expect(config.rules[0].friendly_name).to eq("Sales")
      expect(config.rules[0].targets.length).to eq(2)
      expect(config.rules[0].targets[0].queue).to eq("WQf6724bd5005b30eeb6ea990c3e59e536")
      expect(config.rules[0].targets[0].priority).to eq(5)
      expect(config.rules[0].targets[0].timeout).to eq(30)
      expect(config.rules[0].targets[1].queue).to eq("WQf6724bd5005b30eeb6ea990c3e59e536")
      expect(config.rules[0].targets[1].priority).to eq(10)
      # marketing assertions
      expect(config.rules[1].expression).to eq("type=='marketing'")
      expect(config.rules[1].friendly_name).to eq("Marketing")
      expect(config.rules[1].targets.length).to eq(2)
      expect(config.rules[1].targets[0].queue).to eq("WQ8c62f84b61ccfa6a333757cd508f0aae")
      expect(config.rules[1].targets[0].priority).to eq(1)
      expect(config.rules[1].targets[0].timeout).to eq(120)
      expect(config.rules[1].targets[1].queue).to eq("WQ8c62f84b61ccfa6a333757cd508f0aae")
      expect(config.rules[1].targets[1].priority).to eq(3)
      # support assertions
      expect(config.rules[2].expression).to eq("type=='support'")
      expect(config.rules[2].friendly_name).to eq("Support")
      expect(config.rules[2].targets.length).to eq(2)
      expect(config.rules[2].targets[0].queue).to eq("WQ5940dc0da87eaf6e3321d62041d4403b")
      expect(config.rules[2].targets[0].priority).to eq(10)
      expect(config.rules[2].targets[0].timeout).to eq(30)
      expect(config.rules[2].targets[1].queue).to eq("WQ5940dc0da87eaf6e3321d62041d4403b")
      expect(config.rules[2].targets[1].priority).to eq(15)
      # default filter
      expect(config.default_target.queue).to eq("WQ6d29383312b24bd898a8df32779fc043")
    end

    it 'should be able to parse the workflow with filter friendly name and marshall as friendly name' do
      json = "{
        \"task_routing\":{
          \"filters\":[
           {
            \"expression\":\"type=='sales'\",
            \"targets\":[
               {
                \"queue\":\"WQf6724bd5005b30eeb6ea990c3e59e536\",
                \"priority\": 5,
                \"timeout\": 30
               },
               {
                \"queue\":\"WQf6724bd5005b30eeb6ea990c3e59e536\",
                \"priority\": 10
               }
            ],
            \"filter_friendly_name\":\"Sales\"
           },
           {
            \"expression\":\"type=='marketing'\",
            \"targets\":[
               {
                \"queue\":\"WQ8c62f84b61ccfa6a333757cd508f0aae\",
                \"priority\": 1,
                \"timeout\": 120
               },
               {
                \"queue\":\"WQ8c62f84b61ccfa6a333757cd508f0aae\",
                \"priority\": 3
               }
            ],
            \"filter_friendly_name\":\"Marketing\"
           },
           {
            \"expression\":\"type=='support'\",
            \"targets\":[
               {
                \"queue\":\"WQ5940dc0da87eaf6e3321d62041d4403b\",
                \"priority\": 10,
                \"timeout\": 30
               },
               {
                \"queue\":\"WQ5940dc0da87eaf6e3321d62041d4403b\",
                \"priority\": 15
               }
            ],
            \"filter_friendly_name\":\"Support\"
           }
          ],
          \"default_filter\":{
           \"queue\":\"WQ6d29383312b24bd898a8df32779fc043\"
          }
        }
      }"

      config = Twilio::TaskRouter::WorkflowConfiguration.parse_json(json)

      newJSON = config.to_json

      expected = "{
        \"task_routing\":{
          \"filters\":[
           {
            \"expression\":\"type=='sales'\",
            \"targets\":[
               {
                \"queue\":\"WQf6724bd5005b30eeb6ea990c3e59e536\",
                \"priority\": 5,
                \"timeout\": 30
               },
               {
                \"queue\":\"WQf6724bd5005b30eeb6ea990c3e59e536\",
                \"priority\": 10
               }
            ],
            \"friendly_name\":\"Sales\"
           },
           {
            \"expression\":\"type=='marketing'\",
            \"targets\":[
               {
                \"queue\":\"WQ8c62f84b61ccfa6a333757cd508f0aae\",
                \"priority\": 1,
                \"timeout\": 120
               },
               {
                \"queue\":\"WQ8c62f84b61ccfa6a333757cd508f0aae\",
                \"priority\": 3
               }
            ],
            \"friendly_name\":\"Marketing\"
           },
           {
            \"expression\":\"type=='support'\",
            \"targets\":[
               {
                \"queue\":\"WQ5940dc0da87eaf6e3321d62041d4403b\",
                \"priority\": 10,
                \"timeout\": 30
               },
               {
                \"queue\":\"WQ5940dc0da87eaf6e3321d62041d4403b\",
                \"priority\": 15
               }
            ],
            \"friendly_name\":\"Support\"
           }
          ],
          \"default_filter\":{
           \"queue\":\"WQ6d29383312b24bd898a8df32779fc043\"
          }
        }
      }"

      expected = JSON.parse(expected).to_json

      expect(expected).to eq(newJSON)
    end
  end
end
