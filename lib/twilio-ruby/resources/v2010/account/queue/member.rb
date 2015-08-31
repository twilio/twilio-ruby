module Twilio
  module Resources
    module V2010
      class AccountInstance < Twilio::REST::InstanceResource
        class QueueInstance < Twilio::REST::InstanceResource
          class MemberList < Twilio::REST::ListResource
            can :list, :get
            command_alias :members
            
            def initialize(client, inheritance={})
              super
              path "/Accounts/#{@account_sid}/Queues/#{@parent_sid}/Members.json"
              instance_id_key 'call_sid'
              instance_class MemberInstance
              list_key 'queue_members'
            end
          end
        
          class MemberInstance < Twilio::REST::InstanceResource
            can :update
            
            def initialize(client, inheritance={}, params={}, query_params={})
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