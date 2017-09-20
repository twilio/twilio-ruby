require 'net/http'
require 'net/https'
require 'libxml'
require 'cgi'
require 'openssl'
require 'base64'
require 'forwardable'
require 'jwt'
require 'time'
require 'json'

require 'twilio-ruby/version' unless defined?(Twilio::VERSION)

require 'twilio-ruby/util'
require 'twilio-ruby/jwt/jwt'
require 'twilio-ruby/jwt/access_token'
require 'twilio-ruby/jwt/client_capability'
require 'twilio-ruby/jwt/task_router'
require 'twilio-ruby/security/request_validator'

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
end
