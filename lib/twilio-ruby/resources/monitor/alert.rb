module Twilio
  module Resources
    module Monitor
      class AlertList < Twilio::REST::ListResource
        can :list, :get
        command_alias :alerts
        
        def initialize(client, inheritance={})
          super
          path "/Alerts.json"
          instance_id_key 'sid'
          instance_class AlertInstance
          list_key 'alerts'
        end
      end
    
      class AlertInstance < Twilio::REST::InstanceResource
        can :delete
        
        def initialize(client, inheritance={}, params={}, query_params={})
          super
          path "/Alerts/#{@sid}.json"
          instance_id_key 'sid'
        end
      end
    end
  end
end