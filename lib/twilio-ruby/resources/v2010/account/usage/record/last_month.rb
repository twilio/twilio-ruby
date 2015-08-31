module Twilio
  module Resources
    module V2010
      class AccountInstance < Twilio::REST::InstanceResource
        class UsageList < Twilio::REST::ListResource
          class RecordList < Twilio::REST::ListResource
            class LastMonthList < Twilio::REST::ListResource
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
          
            class LastMonthInstance < Twilio::REST::InstanceResource
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