# frozen_string_literal: true

module Twilio
  class Values
    def self.of(hash)
      hash.delete_if { |_, v| v.eql?(:unset) }
    end

    ##
    # Validates a value that will be interpolated into a request path.
    # Rejects values that could change the request target (path traversal,
    # extra path segments, query string or fragment injection).
    # @param [Object] value the path parameter value
    # @return [Object] the value, unchanged, when valid
    # @raise [ArgumentError] if the value is nil, empty, '.', '..' or contains '/', '?' or '#'
    def self.validate_path_param(value)
      str = value&.to_s
      if str.nil? || str.empty? || str == '.' || str == '..' || str.match?(%r{[/?#]})
        raise ArgumentError, "Invalid path parameter: must not be empty, '.', '..' or contain '/', '?', '#' (got #{value.inspect})"
      end

      value
    end
  end
end
