module Twilio
  module Resources
    module V2010
      class AccountInstance
        class UsageList
          class UsageRecordList
            class UsageRecordDailyList < ListResource
              can :list
              command_alias :usage_record_dailies
              
              def initialize(client, inheritance={})
                super
                path "/Accounts/#{@account_sid}/Usage/Records/Daily"
                instance_id_key 'sid'
                instance_class UsageRecordDailyInstance
              end
            end
          
            class UsageRecordDailyInstance < InstanceResource
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