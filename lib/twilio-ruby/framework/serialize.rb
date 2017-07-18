module Twilio
  # @return [String] Returns a YYYY-MM-DD representation of date for Twilio,
  # if the parameter is a Date, Time, or String
  def self.serialize_iso8601_date(date)
    if date.eql?(:unset)
      date
    elsif date.is_a?(Date)
      date.iso8601
    elsif date.is_a?(Time)
      date.strftime('%Y-%m-%d')
    elsif date.is_a?(String)
      date
    end
  end

  # @return [String] Returns a YYYY-MM-DD representation of date for Twilio,
  # if the parameter is a Date, Time, or String
  def self.serialize_iso8601_datetime(date)
    if date.eql?(:unset)
      date
    elsif date.is_a?(Date)
      Time.new(date.year, date.month, date.day).utc.iso8601
    elsif date.is_a?(Time)
      date.utc.iso8601
    elsif date.is_a?(String)
      date
    end
  end

  # @param [String] date An RFC 2822 Date String
  # @return [String] A Time object
  def self.deserialize_rfc2822(date)
    Time.rfc2822(date) unless date.nil?
  end

  # @param [String] date An ISO 8601 Date String
  # @return [String] A Date object
  def self.deserialize_iso8601_date(date)
    Date.parse(date) unless date.nil?
  end

  # @param [String] date An ISO 8601 Date Time String
  # @return [String] A Time object
  def self.deserialize_iso8601_datetime(date)
    Time.parse(date) unless date.nil?
  end

  # @return [Object] A JSONified representation if the object is jsonifiable
  def self.serialize_object(object)
    if object.is_a?(Hash) || object.is_a?(Array)
      JSON.generate(object)
    else
      object
    end
  end

  # @return [Array] A one-dimensional array
  def self.flatten(map, result = {}, previous = [])
    map.each do |key, value|
      if value.is_a? Hash
        self.flatten(value, result, previous + [key])
      else
        result[(previous + [key]).join('.')] = value
      end
    end

    result
  end

  # @return [Hash] A Hash of params corresponding to those with the specified prefix
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
