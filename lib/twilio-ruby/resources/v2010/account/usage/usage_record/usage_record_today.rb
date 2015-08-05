module Twilio
  module Resources
    module V2010
      class AccountInstance
        class UsageList
          class UsageRecordList
            class UsageRecordTodayList < ListResource
              can :list
              command_alias :usage_record_todays
              
              def initialize(client, inheritance={})
                super
                path "/Accounts/#{@account_sid}/Usage/Records/Today"
                instance_id_key 'sid'
                instance_class UsageRecordTodayInstance
              end
            end
          
            class UsageRecordTodayInstance < InstanceResource
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