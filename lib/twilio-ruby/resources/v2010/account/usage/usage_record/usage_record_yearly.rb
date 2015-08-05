module Twilio
  module Resources
    module V2010
      class AccountInstance
        class UsageList
          class UsageRecordList
            class UsageRecordYearlyList < ListResource
              can :list
              command_alias :usage_record_yearlies
              
              def initialize(client, inheritance={})
                super
                path "/Accounts/#{@account_sid}/Usage/Records/Yearly"
                instance_id_key 'sid'
                instance_class UsageRecordYearlyInstance
              end
            end
          
            class UsageRecordYearlyInstance < InstanceResource
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