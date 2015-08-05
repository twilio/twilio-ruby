module Twilio
  module Resources
    module V2010
      class AccountInstance
        class UsageList
          class RecordList
            class LastMonthList < ListResource
              can :list
              command_alias :last_month
              
              def initialize(client, inheritance={})
                super
                path "/Accounts/#{@account_sid}/Usage/Records/LastMonth"
                instance_id_key 'sid'
                instance_class LastMonthInstance
                list_key 'usage_records'
              end
            end
          
            class LastMonthInstance < InstanceResource
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