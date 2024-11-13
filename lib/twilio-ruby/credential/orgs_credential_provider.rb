# frozen_string_literal: true

require_relative 'credential_provider'
require_relative 'auth_type'
require_relative './../http/token_manager'
require_relative './../auth_strategy/token_auth_strategy'
module Twilio
  module REST
    class OrgsCredentialProvider < CredentialProvider
      attr_accessor :grant_type, :client_id, :client_secret, :orgs_token, :auth_strategy

      def initialize(client_id, client_secret, orgs_token = nil)
        super(AuthType::ORGS_TOKEN)
        raise ArgumentError, 'client_id and client_secret are required' if client_id.nil? || client_secret.nil?

        @grant_type = 'client_credentials'
        @client_id = client_id
        @client_secret = client_secret
        @orgs_token = orgs_token
        @auth_strategy = nil
      end

      def to_auth_strategy
        if @orgs_token.nil?
          @orgs_token = TokenManager.new(@grant_type, @client_id, @client_secret)
        end
        if @auth_strategy.nil?
          @auth_strategy = TokenAuthStrategy.new(@orgs_token)
        end
        @auth_strategy
      end
    end
  end
end
