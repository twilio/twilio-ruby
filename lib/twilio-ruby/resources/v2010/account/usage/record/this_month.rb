module Twilio
  module Resources
    module V2010
      class AccountInstance
        class UsageList
          class RecordList
            class ThisMonthList < ListResource
              can :list
              command_alias :this_month
              
              def initialize(client, inheritance={})
                super
                path "/Accounts/#{@account_sid}/Usage/Records/ThisMonth"
                instance_id_key 'sid'
                instance_class ThisMonthInstance
                list_key 'usage_records'
              end
            end
          
            class ThisMonthInstance < InstanceResource
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