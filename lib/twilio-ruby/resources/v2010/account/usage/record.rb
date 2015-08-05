module Twilio
  module Resources
    module V2010
      class AccountInstance < Twilio::REST::InstanceResource
        class UsageList < Twilio::REST::ListResource
          class RecordList < Twilio::REST::ListResource
            can :list
            command_alias :records
            
            def initialize(client, inheritance={})
              super
              path "/Accounts/#{@account_sid}/Usage/Records"
              instance_id_key 'sid'
              instance_class RecordInstance
              list_key 'usage_records'
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
        
          class RecordInstance < Twilio::REST::InstanceResource
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