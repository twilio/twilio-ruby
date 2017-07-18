module Twilio
  module REST
    # @deprecated Combines to two URLs into one
    def url_join(left, right)
      warn 'DEPRECATION WARNING: this method is deprecated and will be removed in future releases.'
      left = left.sub(/\/+$/, '').sub(/^\/+/, '')
      right = right.sub(/\/+$/, '').sub(/^\/+/, '')
      "#{left}/#{right}"
    end
  end
end
