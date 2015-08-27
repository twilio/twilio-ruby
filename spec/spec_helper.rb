$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'bundler'
Bundler.setup

Dir.glob(File.expand_path("../support/**/*.rb", __FILE__), &method(:require))

require_relative './holodeck/holodeck.rb'
require_relative './holodeck/holodeck_resource.rb'
require_relative './holodeck/hologram.rb'
Dir[File.dirname(__FILE__) + "/holodeck/decks/resources/**/**.rb"].each do |file|
  require file
end

Dir[File.dirname(__FILE__) + "/holodeck/decks/domains/*.rb"].each do |file|
  require file
end
require_relative './holodeck/decks/twilio_deck.rb'

require 'twilio-ruby'
require 'rack'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

def account_sid
  ENV['ACCOUNT_SID']
end

def auth_token
  ENV['AUTH_TOKEN']
end
