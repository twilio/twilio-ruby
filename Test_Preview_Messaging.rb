# frozen_string_literal: true
# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require '/Users/manisingh/github/twilio/twilio-ruby/lib/twilio-ruby'
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['SID']
auth_token = ENV['TOKEN']
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+19492983370' # Your Twilio number
to = '+919831560103' # Your mobile phone number
payload = {
  "from" => from,
  "to" => to,
  "body" => "Hello, this is the body of the message."
}
message = Twilio::REST::PreviewMessaging::V1::MessageList::MessagingV1Message.new(payload)
payload = {
  "from" => from,
  "messages" => Array(message)
}
preview_message = Twilio::REST::PreviewMessaging::V1::MessageList::CreateMessagesRequest.new(payload)

client.preview_messaging.v1.messages.create(create_messages_request: preview_message)
# frozen_string_literal: true

