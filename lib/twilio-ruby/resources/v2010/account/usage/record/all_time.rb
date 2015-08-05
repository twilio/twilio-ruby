module Twilio
  module Resources
    module V2010
      class AccountInstance
        class UsageList
          class RecordList
            class AllTimeList < ListResource
              can :list
              command_alias :all_time
              
              def initialize(client, inheritance={})
                super
                path "/Accounts/#{@account_sid}/Usage/Records/AllTime"
                instance_id_key 'sid'
                instance_class AllTimeInstance
                list_key 'usage_records'
              end
            end
          
            class AllTimeInstance < InstanceResource
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