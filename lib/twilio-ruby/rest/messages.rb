module Twilio
  module REST
    class Messages < ListResource
      def initialize(path, client)
        path.gsub! '/SMS', ''
        super
      end
    end

    class Message < InstanceResource
      def initialize(path, client, params={})
        super
        resource :media
      end

      def redact()
        update({body: ''})
      end

      def to_h
        {
          :api_version => api_version,
          :messaging_service_sid => messaging_service_sid,
          :direction => direction, # "outbound-api"
          :account_sid => account_sid,

          :sid => sid,
          :status => status, # "queued"
          :to => to, # "+11234567890"
          :from => from, # "+10987654321"
          :body => body, # "Hello world!"
          :num_segments => num_segments, # "1"
          :num_media => num_media, # "0"
          :date_created => date_created, # "Sun, 28 Feb 2016 23:28:34 +0000"
          :date_updated => date_updated, # "Sun, 28 Feb 2016 23:28:34 +0000"
          :date_sent => date_sent, # "Sun, 28 Feb 2016 23:28:34 +0000"

          :price => price,
          :price_unit => price_unit,
          :error_code => error_code,
          :error_message => error_message,
          :uri => uri, # "/2010-04-01/Accounts/:sid/Messages/:sid.json"
          :subresource_uris => subresource_uris, #> {"media"=> "/2010-04-01/Accounts/:sid/Messages/:sid/Media.json"}
          #:media => media,
          #:media_path => media.instance_variable_get('@path')
        }
      end
    end
  end
end
