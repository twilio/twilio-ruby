require './lib/twilio-ruby'
require './lib/twilio-ruby/base/client_base'
require './lib/twilio-ruby/credential/client_credential_provider'
# credential_provider = Twilio::REST::ClientCredentialProvider.new(ENV['CLIENT_ID'], ENV['CLIENT_SECRET'])
client = Twilio::REST::Client.new(ENV['SID'], ENV['TOKEN']) #.credential_provider(credential_provider)
# response = client.preview_iam.organizations(ENV['ORG_SID']).accounts.list
response = client.messages.list(limit: 20, page_size: 10)
response.each do |record|
  puts record.sid
end
