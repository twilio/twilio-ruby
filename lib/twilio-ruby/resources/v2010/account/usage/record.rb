module Twilio
  module Resources
    module V2010
      class AccountInstance
        class UsageList
          class RecordList < ListResource
            can :list
            command_alias :records
            
            def initialize(client, inheritance={})
              super
              path "/Accounts/#{@account_sid}/Usage/Records"
              instance_id_key 'sid'
              instance_class RecordInstance
              list_key 'usage_record'
              components Twilio::Resources::V2010::AccountInstance::UsageList::RecordList::AllTimeList,
                         Twilio::Resources::V2010::AccountInstance::UsageList::RecordList::DailyList,
                         Twilio::Resources::V2010::AccountInstance::UsageList::RecordList::LastMonthList,
                         Twilio::Resources::V2010::AccountInstance::UsageList::RecordList::MonthlyList,
                         Twilio::Resources::V2010::AccountInstance::UsageList::RecordList::ThisMonthList,
                         Twilio::Resources::V2010::AccountInstance::UsageList::RecordList::TodayList,
                         Twilio::Resources::V2010::AccountInstance::UsageList::RecordList::YearlyList,
                         Twilio::Resources::V2010::AccountInstance::UsageList::RecordList::YesterdayList
            end
          end
        
          class RecordInstance < InstanceResource
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