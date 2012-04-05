module Twilio
  module Util
    def url_encode(hash)
      hash.map do |key, param|
        join_sign = case /^(.*)([<|>]=)$/ =~ key
          when nil then '='
          else key = $1; $2
        end
        "#{CGI.escape(key.to_s)}#{join_sign}#{CGI.escape(param.to_s)}"
      end.join '&'
    end
  end
end
