module Twilio
  module Resources
    module V2010
      class AccountInstance
        class UsageList
          class UsageRecordList
            class UsageRecordLastMonthList < ListResource
              can :list
              command_alias :usage_record_last_months
              
              def initialize(client, inheritance={})
                super
                path "/Accounts/#{@account_sid}/Usage/Records/LastMonth"
                instance_id_key 'sid'
                instance_class UsageRecordLastMonthInstance
              end
            end
          
            class UsageRecordLastMonthInstance < InstanceResource
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