module Twilio
  module Resources
    module V2010
      class AccountInstance
        class QueueInstance
          class MemberList < ListResource
            can :list, :get
            command_alias :members
            
            def initialize(client, inheritance={})
              super
              path "/Accounts/#{@account_sid}/Queues/#{@parent_sid}/Members.json"
              instance_id_key 'call_sid'
              instance_class MemberInstance
            end
          end
        
          class MemberInstance < InstanceResource
            can :update
            
            def initialize(client, inheritance={}, params={})
              super
              path "/Accounts/#{@account_sid}/Queues/#{@parent_sid}/Members/#{@sid}.json"
              instance_id_key 'call_sid'
            end
            
            def dequeue(url, method='POST')
              update url: url, method: method
            end
          end
        end
      end
    end
  end
end