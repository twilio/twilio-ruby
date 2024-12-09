require 'twilio-ruby'
require 'twilio-ruby/credential/client_credential_provider'

credential_provider = Twilio::REST::ClientCredentialProvider.new(ENV['CLIENT_ID'], ENV['CLIENT_SECRET'])
client = Twilio::REST::Client.new(ENV['ACCOUNT_SID']).credential_provider(credential_provider) # passing account sid is not mandatory

# send messages
client.messages.create(
  from: ENV['TWILIO_PHONE_NUMBER'],
  to: ENV['PHONE_NUMBER'],
  body: 'Hello from Ruby!'
)
