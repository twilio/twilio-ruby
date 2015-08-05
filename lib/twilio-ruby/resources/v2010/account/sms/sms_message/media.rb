module Twilio
  module Resources
    module V2010
      class AccountInstance
        class SmsList
          class SmsMessageInstance
            class MediaList < ListResource
              can :list, :get
              command_alias :media
              
              def initialize(client, inheritance={})
                super
                path "/Accounts/#{@account_sid}/SMS/Messages/#{@parent_sid}/Media.json"
                instance_id_key 'sid'
                instance_class MediaInstance
              end
            end
          
            class MediaInstance < InstanceResource
              can :delete
              
              def initialize(client, inheritance={}, params={})
                super
                path "/Accounts/#{@account_sid}/SMS/Messages/#{@parent_sid}/Media/#{@sid}.json"
                instance_id_key 'sid'
              end
            end
          end
        end
      end
    end
  end
end