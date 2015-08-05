module Twilio
  module Resources
    module Monitor
      class AlertList < ListResource
        can :list, :get
        command_alias :alerts
        
        def initialize(client, inheritance={})
          super
          path "/Alerts"
          instance_id_key 'sid'
          instance_class AlertInstance
        end
      end
    
      class AlertInstance < InstanceResource
        can :delete
        
        def initialize(client, inheritance={}, params={})
          super
          path "/Alerts/#{@sid}"
          instance_id_key 'sid'
        end
      end
    end
  end
end