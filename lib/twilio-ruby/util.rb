# frozen_string_literal: true

module Twilio
  module Util

    def get_string(obj)
      warn "'Twilio::Util::get_string has been deprecated."
      if obj.respond_to?(:strftime)
        obj.strftime('%Y-%m-%d')
      else
        obj.to_s
      end
    end
  end
end
