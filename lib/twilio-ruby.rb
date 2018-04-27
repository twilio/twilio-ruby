# frozen_string_literal: true

require 'net/http'
require 'net/https'
require 'nokogiri'
require 'cgi'
require 'openssl'
require 'base64'
require 'forwardable'
require 'jwt'
require 'time'
require 'json'

require 'twilio-ruby/version' unless defined?(Twilio::VERSION)
require 'rack/twilio_webhook_authentication'

require 'twilio-ruby/util'
require 'twilio-ruby/jwt/jwt'
require 'twilio-ruby/jwt/access_token'
require 'twilio-ruby/jwt/client_capability'
require 'twilio-ruby/jwt/task_router'
require 'twilio-ruby/security/request_validator'
require 'twilio-ruby/util/configuration'

require 'twilio-ruby/twiml/twiml'
require 'twilio-ruby/twiml/voice_response'
require 'twilio-ruby/twiml/messaging_response'

Dir[File.dirname(__FILE__) + '/twilio-ruby/http/**/*.rb'].each do |file|
  require file
end
Dir[File.dirname(__FILE__) + '/twilio-ruby/framework/**/*.rb'].each do |file|
  require file
end
Dir[File.dirname(__FILE__) + '/twilio-ruby/rest/*.rb'].each do |file|
  require file
end
Dir[File.dirname(__FILE__) + '/twilio-ruby/rest/**/*.rb'].each do |file|
  require file
end
Dir[File.dirname(__FILE__) + '/twilio-ruby/compatibility/**/*.rb'].each do |file|
  require file
end

module Twilio
  extend SingleForwardable

  def_delegators :configuration, :account_sid, :auth_token

  ##
  # Pre-configure with account SID and auth token so that you don't need to
  # pass them to various initializers each time.
  def self.configure(&block)
    yield configuration
  end

  ##
  # Returns an existing or instantiates a new configuration object.
  def self.configuration
    @configuration ||= Util::Configuration.new
  end
  private_class_method :configuration
end
