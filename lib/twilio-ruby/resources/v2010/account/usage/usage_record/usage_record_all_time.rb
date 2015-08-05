module Twilio
  module Resources
    module V2010
      class AccountInstance
        class UsageList
          class UsageRecordList
            class UsageRecordAllTimeList < ListResource
              can :list
              command_alias :usage_record_all_times
              
              def initialize(client, inheritance={})
                super
                path "/Accounts/#{@account_sid}/Usage/Records/AllTime"
                instance_id_key 'sid'
                instance_class UsageRecordAllTimeInstance
              end
            end
          
            class UsageRecordAllTimeInstance < InstanceResource
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