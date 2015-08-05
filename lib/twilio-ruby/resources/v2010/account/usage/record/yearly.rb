module Twilio
  module Resources
    module V2010
      class AccountInstance
        class UsageList
          class RecordList
            class YearlyList < ListResource
              can :list
              command_alias :yearly
              
              def initialize(client, inheritance={})
                super
                path "/Accounts/#{@account_sid}/Usage/Records/Yearly"
                instance_id_key 'sid'
                instance_class YearlyInstance
                list_key 'usage_records'
              end
            end
          
            class YearlyInstance < InstanceResource
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