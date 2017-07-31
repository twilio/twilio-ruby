module Twilio
  # Helper to remove :unset values from a Hash
  class Values
    # @param [Hash] hash The hash to strip
    # @return [Hash] A has with :unset values removed.
    def self.of(hash)
      hash.delete_if { |_, v| v.eql?(:unset) }
    end
  end
end
