require 'net/http'
require 'net/https'
require 'builder'
require 'cgi'
require 'openssl'
require 'base64'
require 'forwardable'
require 'jwt'

require 'twilio-ruby/version' unless defined?(Twilio::VERSION)
require 'rack/twilio_webhook_authentication'

require 'twilio-ruby/util'
require 'twilio-ruby/util/capability'
require 'twilio-ruby/util/client_config'
require 'twilio-ruby/util/configuration'
require 'twilio-ruby/util/request_validator'
require 'twilio-ruby/util/access_token'
require 'twilio-ruby/twiml/response'

Dir[File.dirname(__FILE__) + "/twilio-ruby/http/**/*.rb"].each do |file|
  require file
end
Dir[File.dirname(__FILE__) + "/twilio-ruby/framework/**/*.rb"].each do |file|
  require file
end
Dir[File.dirname(__FILE__) + "/twilio-ruby/rest/*.rb"].each do |file|
  require file
end
Dir[File.dirname(__FILE__) + "/twilio-ruby/rest/**/*.rb"].each do |file|
  require file
end
Dir[File.dirname(__FILE__) + "/twilio-ruby/compatibility/**/*.rb"].each do |file|
  require file
end
Dir[File.dirname(__FILE__) + "/twilio-ruby/task_router/**/*.rb"].each do |file|
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
