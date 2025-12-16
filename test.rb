# frozen_string_literal: true

require "./lib/twilio-ruby"

# Your Account SID and Auth Token from console.twilio.com
account_sid = ENV["TWILIO_ACCOUNT_SID"]
auth_token = ENV["TWILIO_AUTH_TOKEN"]

@client = Twilio::REST::Client.new account_sid, auth_token
# message = @client.messages.list( limit: 20, page_size: 5)
message = @client.messages.list_with_metadata( limit: 20, page_size: 5)
message.map { |item| item * 2 } # Internally calls collection.each
puts message
