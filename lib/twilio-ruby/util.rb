module Twilio
  module Util
    def url_encode(hash)
      normalized_parameters = hash.inject([]) do |memo, (key, value)|
        key = CGI.escape(get_string(key))
        if value.is_a?(Array)
          value.each { |arg| memo << [key, CGI.escape(get_string(arg))] }
        else
          memo << [key, CGI.escape(get_string(value))]
        end
        memo
      end
      normalized_parameters.map { |pair| pair.join("=") }.join("&")
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
