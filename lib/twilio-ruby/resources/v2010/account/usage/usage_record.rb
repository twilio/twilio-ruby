module Twilio
  module Resources
    module V2010
      class AccountInstance
        class UsageList
          class UsageRecordList < ListResource
            can :list
            command_alias :usage_records
            
            def initialize(client, inheritance={})
              super
              path "/Accounts/#{@account_sid}/Usage/Records"
              instance_id_key 'sid'
              instance_class UsageRecordInstance
              components Twilio::Resources::V2010::AccountInstance::UsageList::UsageRecordList::UsageRecordAllTimeList,
                         Twilio::Resources::V2010::AccountInstance::UsageList::UsageRecordList::UsageRecordDailyList,
                         Twilio::Resources::V2010::AccountInstance::UsageList::UsageRecordList::UsageRecordLastMonthList,
                         Twilio::Resources::V2010::AccountInstance::UsageList::UsageRecordList::UsageRecordMonthlyList,
                         Twilio::Resources::V2010::AccountInstance::UsageList::UsageRecordList::UsageRecordThisMonthList,
                         Twilio::Resources::V2010::AccountInstance::UsageList::UsageRecordList::UsageRecordTodayList,
                         Twilio::Resources::V2010::AccountInstance::UsageList::UsageRecordList::UsageRecordYearlyList,
                         Twilio::Resources::V2010::AccountInstance::UsageList::UsageRecordList::UsageRecordYesterdayList
            end
          end
        
          class UsageRecordInstance < InstanceResource
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