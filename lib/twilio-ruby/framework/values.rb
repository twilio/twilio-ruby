module Twilio
  class Values
      class Unset
    end

    def self.of(hash)
      hash.delete_if { |k,v| v.eql?(Unset)}
    end
  end
end