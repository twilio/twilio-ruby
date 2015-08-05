module Twilio
  module Resources
    module V2010
      class AccountInstance
        class UsageList
          class UsageRecordList
            class UsageRecordMonthlyList < ListResource
              can :list
              command_alias :usage_record_monthlies
              
              def initialize(client, inheritance={})
                super
                path "/Accounts/#{@account_sid}/Usage/Records/Monthly"
                instance_id_key 'sid'
                instance_class UsageRecordMonthlyInstance
              end
            end
          
            class UsageRecordMonthlyInstance < InstanceResource
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