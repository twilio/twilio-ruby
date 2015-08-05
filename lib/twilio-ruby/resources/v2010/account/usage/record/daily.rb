module Twilio
  module Resources
    module V2010
      class AccountInstance
        class UsageList
          class RecordList
            class DailyList < ListResource
              can :list
              command_alias :daily
              
              def initialize(client, inheritance={})
                super
                path "/Accounts/#{@account_sid}/Usage/Records/Daily"
                instance_id_key 'sid'
                instance_class DailyInstance
                list_key 'usage_records'
              end
            end
          
            class DailyInstance < InstanceResource
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