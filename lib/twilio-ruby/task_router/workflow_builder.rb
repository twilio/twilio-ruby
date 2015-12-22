require 'json'

module Twilio
  module TaskRouter
    class WorkflowConfiguration

      def initialize(rules, default_target)
        @rules = rules
        @default_target = default_target
      end

      def rules
        @rules
      end

      def default_target
        @default_target
      end

      def to_json
        filters = Array.new
        @rules.each do |rule|
          filters.push(rule.to_json)
        end
        
        task_routing = {filters: filters, default_filter: @default_target.to_json}
        config = {task_routing: task_routing}
        config.to_json
      end

      def self.parse_json(json_data)
        task_routing = JSON.parse(json_data)['task_routing']

        filters = task_routing['filters']
        rules = Array.new
        filters.each do |rule|
          rules.push(Twilio::TaskRouter::WorkflowRule.parse_json(rule))
        end

        default_filter = Twilio::TaskRouter::WorkflowRuleTarget.parse_json(task_routing['default_filter'])
        Twilio::TaskRouter::WorkflowConfiguration.new rules, default_filter
      end
    end
    class WorkflowRule

      def initialize(expression, targets, friendly_name=nil)
        @expression = expression
        @targets = targets
        @friendly_name = friendly_name
      end

      def expression
        @expression
      end

      def targets
        @targets
      end

      def friendly_name
        @friendly_name
      end

      def to_json
        rule = {expression: @expression}
        ruleTargets = Array.new
        @targets.each do |target|
          ruleTargets.push(target.to_json)
        end
        rule['targets'] = ruleTargets
        unless @friendly_name.nil?
          rule['friendly_name'] = @friendly_name
        end
        rule
      end

      def self.parse_json(rule)
        targets = Array.new
        rule['targets'].each do |target|
          targets.push(Twilio::TaskRouter::WorkflowRuleTarget.parse_json(target))
        end
        unless rule['filter_friendly_name'].nil?
          friendly_name = rule['filter_friendly_name']
        end
        unless rule['friendly_name'].nil?
          friendly_name = rule['friendly_name']
        end
        Twilio::TaskRouter::WorkflowRule.new rule['expression'], targets, friendly_name
      end
    end
    class WorkflowRuleTarget

      def initialize(queue, priority=nil, timeout=nil, expression=nil)
        @queue = queue
        @priority = priority
        @timeout = timeout
        @expression = expression
      end

      def queue
        @queue
      end

      def priority
        @priority
      end

      def timeout
        @timeout
      end

      def expression
        @expression
      end

      def to_json
        target = {queue: @queue}
        unless @priority.nil?
          target['priority'] = @priority
        end
        unless @timeout.nil?
          target['timeout'] = @timeout
        end
        unless @expression.nil?
          target['expression'] = @expression
        end
        target
      end

      def self.parse_json(target)
        Twilio::TaskRouter::WorkflowRuleTarget.new target['queue'], target['priority'], target['timeout'], target['expression']
      end
    end
  end
end
