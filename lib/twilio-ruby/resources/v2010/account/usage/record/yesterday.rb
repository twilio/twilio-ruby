module Twilio
  module Resources
    module V2010
      class AccountInstance < Twilio::REST::InstanceResource
        class UsageList < Twilio::REST::ListResource
          class RecordList < Twilio::REST::ListResource
            class YesterdayList < Twilio::REST::ListResource
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
          
            class YesterdayInstance < Twilio::REST::InstanceResource
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