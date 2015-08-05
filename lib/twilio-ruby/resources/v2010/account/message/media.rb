module Twilio
  module Resources
    module V2010
      class AccountInstance < Twilio::REST::InstanceResource
        class MessageInstance < Twilio::REST::InstanceResource
          class MediaList < Twilio::REST::ListResource
            can :list, :get
            command_alias :media
            
            def initialize(client, inheritance={})
              super
              path "/Accounts/#{@account_sid}/Messages/#{@message_sid}/Media.json"
              instance_id_key 'sid'
              instance_class MediaInstance
              list_key 'media_list'
            end
          end
        
          class MediaInstance < Twilio::REST::InstanceResource
            can :delete
            
            def initialize(client, inheritance={}, params={})
              super
              path "/Accounts/#{@account_sid}/Messages/#{@message_sid}/Media/#{@sid}.json"
              instance_id_key 'sid'
            end
          end
        end
      end
    end
  end
end