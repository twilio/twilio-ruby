module Twilio
  module Util
    def url_encode(hash)
      hash.to_a.map {|p| p.map {|e| CGI.escape get_string(e)}.join '='}.join '&'
    end

    def get_string(obj)
      if obj.respond_to?(:strftime)
        obj.strftime('%Y-%m-%d')
      else
        obj.to_s
      end
    end
  end
end
