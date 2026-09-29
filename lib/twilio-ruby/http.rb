# frozen_string_literal: true

# Use autoload for HTTP modules to reduce memory usage
module Twilio
  module HTTP
    autoload :ClientTokenManager, File.join(__dir__, 'http', 'client_token_manager.rb')
    autoload :Client, File.join(__dir__, 'http', 'http_client.rb')
    autoload :OrgTokenManager, File.join(__dir__, 'http', 'org_token_manager.rb')
  end
end
