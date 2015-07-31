module Twilio
  module REST
    class Message
      class Media < ListResource
        def initialize(client)
          super
          path "/Accounts/#{@account_sid}/Messages/#{@message_sid}/Media.json"
          list_key 'media_list'
        end
      end

      class MediaInstance < InstanceResource
        def initialize(client, params={})
          super
          path "/Accounts/#{@account_sid}/Messages/#{@message_sid}/Media/#{@sid}.json"
        end
      end
    end
  end
end
