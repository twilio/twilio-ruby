# frozen_string_literal: true

require_relative './lib/twilio-ruby'

account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']

@client = Twilio::REST::Client.new account_sid, auth_token
message = @client.api.v2010.messages.list(to: '+919831560103', limit: 20, page_size: 5)

puts message
