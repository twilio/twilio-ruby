$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'lib')
require 'twilio-ruby'
require 'fakeweb'
require 'rack'

FakeWeb.allow_net_connect = false