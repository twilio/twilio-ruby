# frozen_string_literal: true
require './lib/twilio-ruby'
require './lib/twilio-ruby/base/client_base'
require './lib/twilio-ruby/credential/orgs_credential_provider'
credentialProvider = Twilio::REST::OrgsCredentialProvider.new(ENV['CLIENT_ID'], ENV['CLIENT_SECRET'])
client = Twilio::REST::Client.new(credential_provider: credentialProvider)
response = client.preview_iam.organizations()
                 .accounts('').fetch
puts response
