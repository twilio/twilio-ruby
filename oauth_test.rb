require './lib/twilio-ruby'
require './lib/twilio-ruby/base/client_base'
require './lib/twilio-ruby/credential/orgs_credential_provider'
credential_provider = Twilio::REST::OrgsCredentialProvider.new(ENV['CLIENT_ID'], ENV['CLIENT_SECRET'])
client = Twilio::REST::Client.new.credential_provider(credential_provider)
response = client.preview_iam.organizations(ENV['ORG_SID'])
                 .accounts('').fetch
# client_2 = Twilio::REST::Client.new(ENV['SID'], ENV['TOKEN'])
# response = client_2.messages.create(from: ENV['FROM'], to: ENV['TO'], body: 'Hello World')
puts response
