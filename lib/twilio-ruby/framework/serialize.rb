module Twilio
  def self.serialize_iso8601(date)
    if date
      date.iso8601
    end
  end

  def self.deserialize_rfc2822(date)
    unless date.nil?
      Time.rfc2822(date)
    end
  end

  def self.deserialize_iso8601(date)
    unless date.nil?
      Time.iso8601(date)
    end
  end
end
