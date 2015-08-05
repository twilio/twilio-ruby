module Twilio
  module Resources
    module V2010
      class AccountInstance
        class UsageList
          class RecordList
            class TodayList < ListResource
              can :list
              command_alias :today
              
              def initialize(client, inheritance={})
                super
                path "/Accounts/#{@account_sid}/Usage/Records/Today"
                instance_id_key 'sid'
                instance_class TodayInstance
                list_key 'usage_records'
              end
            end
          
            class TodayInstance < InstanceResource
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