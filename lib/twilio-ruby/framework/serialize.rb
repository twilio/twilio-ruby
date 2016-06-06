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
      Time.parse(date)
    end
  end

  def self.flatten(map, result={}, previous=[])
    map.each do |key, value|
      if value.is_a? Hash
        self.flatten(value, result, previous + [key])
      else
        result[(previous + [key]).join('.')] = value
      end
    end

    result
  end

  def self.prefixed_collapsible_map(map, prefix)
    result = {}
    if map.is_a? Hash
      flattened = self.flatten(map)
      result = {}
      flattened.each do |key, value|
        result[prefix + '.' + key] = value
      end
    end

    result
  end

end
