module Twilio
  module Resources
    module V2010
      class AccountInstance < Twilio::REST::InstanceResource
        class UsageList < Twilio::REST::ListResource
          class RecordList < Twilio::REST::ListResource
            class TodayList < Twilio::REST::ListResource
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
          
            class TodayInstance < Twilio::REST::InstanceResource
              def initialize(client, inheritance={}, params={}, query_params={})
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