# frozen_string_literal: true

require "./lib/twilio-ruby"

# Your Account SID and Auth Token from console.twilio.com
account_sid = ENV["TWILIO_ACCOUNT_SID"]
auth_token = ENV["TWILIO_AUTH_TOKEN"]

@client = Twilio::REST::Client.new account_sid, auth_token
message_page_with_metadata = @client.messages.list_with_metadata(limit: 20, page_size: 5)
message_page_with_metadata.each { |item| puts item.message }

# message_created_with_metadata = @client.messages.create_with_metadata(
#   to: "+",
#   from: "+",
#   body: "Hello from Twilio!",
# )
#
# puts message_created_with_metadata.message
# puts message_created_with_metadata.headers
# puts message_created_with_metadata.status_code

# message_created_with_metadata = @client.messages('SM6dbc937b06440ee0eb9153e55a74c9fd').fetch_with_metadata
#
# puts message_created_with_metadata.message
# puts message_created_with_metadata.headers
# puts message_created_with_metadata.status_code

# message_update_with_metadata = @client.messages('SM6dbc937b06440ee0eb9153e55a74c9fd').update_with_metadata(body: "Hello from Twilio Ruby")
#
# puts message_update_with_metadata.message
# puts message_update_with_metadata.headers
# puts message_update_with_metadata.status_code

# message_delete_with_metadata = @client.messages('SMd21346242f23d663a4729859effa4e76').delete_with_metadata
# puts message_delete_with_metadata.message
# puts message_delete_with_metadata.headers
# puts message_delete_with_metadata.status_code

message_page_with_metadata = @client.chat.v1.credentials.list_with_metadata(limit: 20, page_size: 5)
message_page_with_metadata.each { |item| puts item.credential }
