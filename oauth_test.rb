# frozen_string_literal: true
require './lib/twilio-ruby'

client = Twilio::REST::Client.new(ENV['SID'], ENV['TOKEN'])
response = client.preview_iam.organizations('OR657dddf385c04b61f192b1d7a3703c59')
                 .accounts('ACXXXXXXXXXXXXXXXX').fetch
puts response
