module Twilio
  module Util
    def url_encode(hash)
      hash.to_a.map {|p| p.map {|e| CGI.escape e.to_s}.join '='}.join '&'
    end
  end
end
