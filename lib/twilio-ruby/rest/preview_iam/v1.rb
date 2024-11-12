# frozen_string_literal: true
require_relative './v1/token'
module Twilio
  module REST
    class PreviewIam
      class V1 < Version
        def initialize(domain)
          super(domain)
          @token = nil
          @authorize = nil
          @version = 'v1'
        end

        def token
          @token ||= TokenList.new(self)
        end

      end
    end
  end
end
