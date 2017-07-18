module Twilio
  module Util
    # @deprecated Please use CGI.escape instead.
    def url_encode(hash)
      warn 'DEPRECATION WARNING: this method is deprecated and will be removed in future releases.'
      hash.to_a.map { |p| p.map { |e| CGI.escape get_string(e) }.join '=' }.join '&'
    end

    # @deprecated
    def get_string(obj)
      warn 'DEPRECATION WARNING: this method is deprecated and will be removed in future releases.'
      if obj.respond_to?(:strftime)
        obj.strftime('%Y-%m-%d')
      else
        obj.to_s
      end
    end
  end
end
