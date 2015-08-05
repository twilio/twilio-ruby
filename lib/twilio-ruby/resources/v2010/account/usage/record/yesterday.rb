module Twilio
  module Resources
    module V2010
      class AccountInstance
        class UsageList
          class RecordList
            class YesterdayList < ListResource
              can :list
              command_alias :yesterday
              
              def initialize(client, inheritance={})
                super
                path "/Accounts/#{@account_sid}/Usage/Records/Yesterday"
                instance_id_key 'sid'
                instance_class YesterdayInstance
                list_key 'usage_records'
              end
            end
          
            class YesterdayInstance < InstanceResource
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