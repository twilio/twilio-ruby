module Twilio
  def self.serialize_iso8601(date)
    if date
      date.iso8601
    end
  end
end
