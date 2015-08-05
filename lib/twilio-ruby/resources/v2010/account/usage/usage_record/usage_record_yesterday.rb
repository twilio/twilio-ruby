module Twilio
  module Resources
    module V2010
      class AccountInstance
        class UsageList
          class UsageRecordList
            class UsageRecordYesterdayList < ListResource
              can :list
              command_alias :usage_record_yesterdays
              
              def initialize(client, inheritance={})
                super
                path "/Accounts/#{@account_sid}/Usage/Records/Yesterday"
                instance_id_key 'sid'
                instance_class UsageRecordYesterdayInstance
              end
            end
          
            class UsageRecordYesterdayInstance < InstanceResource
              def initialize(client, inheritance={}, params={})
                super
                instance_id_key 'sid'
              end
            end
          end
        end
      end
    end
  end
end